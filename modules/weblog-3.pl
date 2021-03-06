# Copyright (C) 2005–2014  Alex Schroeder <alex@gnu.org>
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

use strict;
use v5.10;

AddModuleDescription('weblog-3.pl', 'Create a Blog Front Page');

# Categories

our ($q, %Action, %Page, $OpenPageName, $HomePage, $ScriptName, @MyInitVariables, $FreeLinkPattern, $UserGotoBar, @UserGotoBarPages, $UsePathInfo);
our ($CategoriesPage);

$CategoriesPage = 'Categories';

*CategoriesOldOpenPage = \&OpenPage;
*OpenPage = \&CategoriesNewOpenPage;

my %Category = (); # fast checking
my @Categories = (); # correct order
my $CategoryInit = 0;

*OldCategoriesNewText = \&NewText;
*NewText = \&NewCategoriesNewText;

sub NewCategoriesNewText {
  my $id = shift;
  if ($id eq $HomePage) {
    return '<journal>';
  } elsif (GetParam('tag','')
           or $Category{$id}) {
    # if the page is either on the categories page, or the tag=1
    # parameter was added, show a journal
    $Page{text} = T('Matching pages:')
        . "\n\n"
        . '<journal "^\d\d\d\d-\d\d-\d\d.*'
        . $OpenPageName
        . '">';
  } else {
    return OldCategoriesNewText($id, @_);
  }
}

sub CategoriesNewOpenPage {
  CategoryInit() unless $CategoryInit;
  CategoriesOldOpenPage(@_);
}

# Category page

sub CategoryParse {
  my @paragraphs = split(/\n\n+/, shift);
  my @result;
  foreach (@paragraphs) {
    next unless /^\*/;
    while (/\*+\s*\[\[$FreeLinkPattern\]\]/g) {
      my $id = FreeToNormal($1);
      push(@result, $id);
    }
    last;
  }
  return @result;
}

sub CategoryInit {
  $CategoryInit = 1;
  @Categories = CategoryParse(GetPageContent($CategoriesPage));
  map { $Category{$_} = 1 } @Categories;
}

# New Action

$Action{new} = \&DoCategories;

sub DoCategories {
  print GetHeader('', T('New')), $q->start_div({-class=>'content categories'}),
    GetFormStart(undef, 'get', 'cat');
  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = gmtime();
  my $today = sprintf("%d-%02d-%02d", $year + 1900, $mon + 1, $mday);
  CategoryInit() unless $CategoryInit;
  print $q->p({-class=>'table'}, map {GetEditLink("$today $_", $_)} @Categories);
  print $q->p($q->textfield('id', $today), GetHiddenValue('action', 'edit'));
  print $q->p(Ts('Edit %s.', GetPageLink($CategoriesPage)));
  print $q->submit("Go!");
  print $q->end_form, $q->end_div();
  PrintFooter();
}

# Goto Bar

my $GotoBarInit = 0;

sub GotoBarInit {
  $GotoBarInit = 1;
  @UserGotoBarPages = (@UserGotoBarPages,
		       CategoryParse(GetPageContent($HomePage)));
}

*GetGotoBar = * NewGetGotoBar;

sub NewGetGotoBar {
  my $id = shift;
  GotoBarInit() unless $GotoBarInit;
  my @links;
  foreach my $name (@UserGotoBarPages) {
    push (@links, GetPageLink($name, $name));
  }
  my @parts = split(/_/, GetId());
  CategoryInit() unless $CategoryInit;
  if ($parts[0] =~ /\d\d\d\d-\d\d-\d\d/) {
    shift(@parts);
    push(@links, map {
      if ($Category{$_}) {
	$q->a({-href=>$ScriptName . ($UsePathInfo ? '/' : '?') . UrlEncode($_),
	       -class=>'local tag',
	       -rel=>'tag'}, $_);
      } else {
	# provide tag=1 parameter to tell OpenPage to add journal tag
	$q->a({-href=>$ScriptName . '?tag=1;action=browse;id=' . UrlEncode($_),
	       -class=>'local tag',
	       -rel=>'tag'}, $_);
      }
    } @parts);
  }
  push (@links, ScriptLink('action=new', T('New')));
  return $q->span({-class=>'gotobar bar'}, @links, $UserGotoBar);
}
