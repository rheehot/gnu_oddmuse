# Copyright (C) 2006  Alex Schroeder <alex@emacswiki.org>
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

require 't/test.pl';
package OddMuse;
use Test::More tests => 37;

# Make sure we can "Mark this page for deletion".
AppendStringToFile($ConfigFile, "\$KeepDays = 14;\n");

$page = get_page('action=history id=hist');
test_page($page,
	  'No other revisions available',
	  'View current revision',
	  'View all changes');
test_page_negative($page,
		   'View other revisions',
		   'Mark this page for deletion');

test_page(update_page('hist', 'testing', 'test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary'),
	  'testing',
	  'action=history',
	  'View other revisions');

test_page_negative(get_page('action=history id=hist'),
		   'Mark this page for deletion');
$page = get_page('action=history id=hist username=me');
test_page($page,
	  'test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary test summary',
	  'View current revision',
	  'View all changes',
	  'current',
	  'Mark this page for deletion');
test_page_negative($page,
		   'No other revisions available',
		   'View other revisions',
		   'value\="rollback"');

test_page(update_page('hist', 'Tesla', 'Power'),
	  'Tesla',
	  'action=history',
	  'View other revisions');

$page = get_page('action=history id=hist username=me');
test_page($page,
	  'test summary',
	  'Power',
	  'View current revision',
	  'View all changes',
	  'current',
	  'value\="rollback"',
	  'name="rollback-\d+"',
	  'Mark this page for deletion');
test_page_negative($page,
		   'Tesla',
		   'No other revisions available',
		   'View other revisions');
xpath_test($page,
	   '//table[@class="history"]/tr[position()=2]/td[position()=1]/input[@name="diffrevision"][@value="2"]',
	   '//table[@class="history"]/tr[position()=2]/td[position()=2]/input[@name="revision"][@value=""][@checked="checked"]',
	   '//table[@class="history"]/tr[position()=2]/td[position()=3]/a[text()="Revision 2"]',
	   '//table[@class="history"]/tr[position()=3]/td[position()=1]/input[@name="diffrevision"][@value="1"][@checked="checked"]',
	   '//table[@class="history"]/tr[position()=3]/td[position()=2]/input[@name="revision"][@value="1"]',
	   '//table[@class="history"]/tr[position()=3]/td[position()=3]/a[text()="Revision 1"]');
