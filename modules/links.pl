# Copyright (C) 2004  Alex Schroeder <alex@emacswiki.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use v5.10;

AddModuleDescription('links.pl', 'Link Data Extension');
our ($q, %InterSite, %IndexHash, %Page, %Action, $FS, $LinkPattern, $InterLinkPattern, $FreeLinks, $FreeLinkPattern, $FreeInterLinkPattern, $UrlPattern, $FullUrlPattern, $BracketWiki, $BracketText, $WikiLinks);
$Action{links} = \&DoLinks;

sub DoLinks {
  my @args = (GetParam('raw', 0), GetParam('url', 0), GetParam('inter', 0), GetParam('links', 1));
  if (GetParam('raw', 0)) {
    print GetHttpHeader('text/plain');
    PrintLinkList(GetFullLinkList(@args));
  } else {
    print GetHeader('', QuoteHtml(T('Full Link List')), '');
    PrintLinkList(GetFullLinkList(@args));
    PrintFooter();
  }
}

sub PrintLinkList {
  my %links = %{(shift)};
  my $existingonly = GetParam('exists', 0);
  if (GetParam('raw', 0)) {
    foreach my $page (sort keys %links) {
      foreach my $link (@{$links{$page}}) {
	print "\"$page\" -> \"$link\"\n" if not $existingonly or $IndexHash{$link};
      }
    }
  } else {
    foreach my $page (sort keys %links) {
      print $q->p(GetPageLink($page) . ': ' . join(' ', @{$links{$page}}));
    }
  }
}

sub GetFullLinkList { # opens all pages!
  my ($raw, $url, $inter, $link) = @_;
  my @pglist = AllPagesList();
  my %result;
  InterInit();
  foreach my $name (@pglist) {
    OpenPage($name);
    my @links = GetLinkList($raw, $url, $inter, $link);
    @{$result{$name}} = @links if @links;
  }
  return \%result;
}

sub GetLinkList { # for the currently open page
  my ($raw, $url, $inter, $link) = @_;
  my @blocks = split($FS, $Page{blocks});
  my @flags = split($FS, $Page{flags});
  my %links;
  foreach my $block (@blocks) {
    if (shift(@flags)) {  # dirty block and interlinks or normal links
      if ($inter and ($BracketText && $block =~ m/^(\[$InterLinkPattern\s+([^\]]+?)\])$/
		      or $BracketText && $block =~ m/^(\[\[$FreeInterLinkPattern\|([^\]]+?)\]\])$/
		      or $block =~ m/^(\[$InterLinkPattern\])$/
		      or $block =~ m/^(\[\[\[$FreeInterLinkPattern\]\]\])$/
		      or $block =~ m/^($InterLinkPattern)$/
		      or $block =~ m/^(\[\[$FreeInterLinkPattern\]\])$/)) {
	$links{$raw ? $2 : GetInterLink($2, $3)} = 1 if $InterSite{substr($2,0,index($2, ':'))};
      } elsif ($link
	       and (($WikiLinks and $block !~ m/!$LinkPattern/
		     and ($BracketWiki && $block =~ m/^(\[$LinkPattern\s+([^\]]+?)\])$/
			  or $block =~ m/^(\[$LinkPattern\])$/
			  or $block =~ m/^($LinkPattern)$/))
		    or ($FreeLinks
			and ($BracketWiki && $block =~ m/^(\[\[$FreeLinkPattern\|([^\]]+)\]\])$/
			     or $block =~ m/^(\[\[\[$FreeLinkPattern\]\]\])$/
			     or $block =~ m/^(\[\[$FreeLinkPattern\]\])$/)))) {
	$links{$raw ? FreeToNormal($2) : GetPageOrEditLink($2, $3)} = 1;
      } elsif ($url and $block =~ m/^\[$FullUrlPattern\]$/g) {
	$links{$raw ? $1 : GetUrl($1)} = 1;
      }
    } elsif ($url) {		# clean block and url
      while ($block =~ m/$UrlPattern/g) {
	$links{$raw ? $1 : GetUrl($1)} = 1;
      }
      while ($block =~ m/\[$FullUrlPattern\s+[^\]]+?\]/g) {
	$links{$raw ? $1 : GetUrl($1)} = 1;
      }
    }
  }
  my @result = sort keys %links;
  return @result;
}
