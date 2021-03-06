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

AddModuleDescription('page-trail.pl', 'Page Trail Extension');

our ($q, %CookieParameters);
our ($PageTrailLength);

$PageTrailLength = 10;

$CookieParameters{trail} = '';
my @PageTrail;

*OldPageTrailBrowsePage = \&BrowsePage;
*BrowsePage = \&NewPageTrailBrowsePage;

sub NewPageTrailBrowsePage {
  my ($id, @rest) = @_;
  UpdatePageTrail($id);
  OldPageTrailBrowsePage($id, @rest);
}

sub UpdatePageTrail {
  my $id = shift;
  my @trail = ($id);
  foreach my $page (split(/ /, GetParam('trail', ''))) {
    push(@trail, $page) unless $page eq $id;
  }
  @trail = @trail[0..$PageTrailLength-1] if $trail[$PageTrailLength];
  $q->param('trail', join(' ', @trail));
  @PageTrail = @trail;
}

*OldPageTrailGetGotoBar = \&GetGotoBar;
*GetGotoBar = \&NewPageTrailGetGotoBar;

sub NewPageTrailGetGotoBar {
  my $bar = OldPageTrailGetGotoBar(@_);
  $bar .= $q->span({-class=>'trail'}, $q->br(), T('Trail:') . ' ',
		   map { GetPageLink($_) } reverse(@PageTrail))
    if @PageTrail;
  return $bar;
}
