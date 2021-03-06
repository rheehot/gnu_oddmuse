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

# Die Daten stammen von der deutschen Ausgabe des Monde Diplomatique.
# Falls der Wiki nur Deutsch ist, kann man diese Datei einfach als
# Modul installieren: Im Datenverzeichnis ein neues Unterverzeichnis
# namens 'modules' erstellen, und die Datei hineinkopieren.

# If you are running a multilingual site, then you should explicitly
# load this file from your language-specific config file.

use utf8;
use strict;

AddModuleDescription('national-days-de.pl', 'Special Days') if defined &AddModuleDescription;

our %SpecialDays = (
  '1-1' => 'Haiti: Erlangung der Unabhängigkeit 1804, Kuba: Jahrestag der Revolution 1959, Sudan: Erlangung der Unabhängigkeit 1956',
  '1-26' => 'Australien: Nationalfeiertag (Australia Day), Indien: Republic Day',
  '1-31' => 'Nauru: Erlangung der Unabhängigkeit 1968',
  '1-4' => 'Myanmar (Burma/Birma): Erlangung der Unabhängigkeit 1948',
  '2-4' => 'Sri Lanka: Erlangung der Unabhängigkeit 1948',
  '2-6' => 'Neuseeland: Waitangi Day (Unterzeichnung des Vertrages von Waitangi zwischen Maoris und britischer Regierung 1840)',
  '2-7' => 'Grenada: Erlangung der Unabhängigkeit 1974',
  '2-11' => 'Iran (Persien): Tag des Sieges der islamischen Revolution 1979',
  '2-16' => 'Litauen: Wiederherstellung der Souveränität 1918',
  '2-18' => 'Gambia: Erklärung der Unabhängigkeit 1965',
  '2-22' => 'Saint Lucia: Erlangung der Unabhängigkeit 1979',
  '2-23' => 'Brunei: Nationalfeiertag, Guyana: Gründung der Republik 1970',
  '2-24' => 'Estland: Erklärung der Unabhängigkeit 1918',
  '2-25' => 'Kuwait: Nationalfeiertag',
  '2-26' => 'Kuwait: Befreiungstag',
  '2-27' => 'Dominikanische Republik: Erklärung der Unabhängigkeit 1844',
  '3-1' => 'Bosnien und Herzegowina: Erlangung der Unabhängigkeit 1992',
  '3-3' => 'Bulgarien: Tag der Befreiung von der türkischen Herrschaft 1878',
  '3-6' => 'Ghana: Erklärung der Unabhängigkeit 1957',
  '3-11' => 'Litauen: Wiederherstellung der Souveränität 1990',
  '3-12' => 'Mauritius: Erlangung der Unabhängigkeit 1968',
  '3-14' => 'Andorra: Tag der Verfassung',
  '3-15' => 'Ungarn: Gedenktag an den Revolutions- und Freiheitskampf 1848/49',
  '3-17' => 'Irland: St. Patrick\'s Day',
  '3-20' => 'Tunesien: Erlangung der Unabhängigkeit 1956',
  '3-21' => 'Namibia: Erlangung der Unabhängigkeit 1990',
  '3-23' => 'Pakistan: Beschluss zur Staatsgründung 1940',
  '3-25' => 'Griechenland: Beginn des Freiheitskampfes gegen das Osmanische Reich 1821',
  '3-31' => 'Malta: National Day (Abzug der letzten britischen Truppen 1979)',
  '4-4' => 'Senegal: Erlangung der Unabhängigkeit 1960',
  '4-9' => 'Irak: vorläufig / Eroberung Bagdads durch Koalitionstruppen',
  '4-16' => 'Dänemark: im Ausland der Geburtstag der regierenden Königin Margrethe II. (1940)',
  '4-17' => 'Syrien: Abzug der letzten französischen Mandatstruppen 1946',
  '4-18' => 'Simbabwe: Erlangung der Unabhängigkeit',
  '4-19' => 'Jahrestag der Papstwahl (Benedikt XVI.)',
  '4-25' => 'Italien: Tag der Befreiung 1945',
  '4-26' => 'Tansania: Jahrestag der Vereinigung von Tanganjika und Sansibar 1964',
  '4-27' => 'Afghanistan: Tag der Revolution, Sierra Leone: Erlangung der Unabhängigkeit 1961, Südafrika: Tag der ersten freien Wahlen 1994, Togo: Erlangung der Unabhängigkeit 1960',
  '4-30' => 'Niederlande: Königinnentag',
  '5-1' => 'Marshallinseln: Erklärung der Unabhängigkeit 1979',
  '5-3' => 'Polen: erste polnische Verfassung 1791',
  '5-15' => 'Paraguay: Erklärung der Unabhängigkeit 1811',
  '5-17' => 'Norwegen: Jahrestag der Verfassung',
  '5-20' => 'Kamerun: Erlangung der Unabhängigkeit 1960',
  '5-22' => 'Jemen: Haupt-Nationalfeiertag - Wiedervereinigung von Nord- und Süd-Jemen 1990',
  '5-24' => 'Eritrea: Erklärung der Unabhängigkeit 1993',
  '5-25' => 'Argentinien: Tag des Vaterlandes (Sturz des spanischen Vizekönigs 1810), Jordanien: Erlangung der Unabhängigkeit 1946',
  '5-26' => 'Georgien: Erklärung der Unabhängigkeit 1918',
  '5-28' => 'Aserbaidschan: Erklärung der Unabhängigkeit 1918, Äthiopien: Tag der Niederlage des Derg-Regimes 1991',
  '6-1' => 'Samoa (West-): Beschluß zur Unabhängigkeit 1961',
  '6-2' => 'Italien: Gründung der Republik 1946',
  '6-5' => 'Dänemark: innerhalb Dänemarks wird der Verfassungstag gefeiert (1849), Seschellen: Liberation Day',
  '6-6' => 'Schweden: Flaggentag',
  '6-7' => 'Malta: Sette Giugno (Arbeiteraufstand 1919)',
  '6-10' => 'Portugal: Dia de Portugal (Todestag von Luis Vaz de Camoes 1580)',
  '6-12' => 'Philippinen: Erlangung der Unabhängigkeit, Russland: Tag der Unabhängigkeit - Souveränitätserklärung der RSFSR 1990',
  '6-17' => 'Island: Erklärung der Unabhängigkeit 1944',
  '6-23' => 'Luxemburg: offizieller Geburtstag des regierenden Großherzogs, Henri - der eigentlich am 16.4. Geburtstag hat)',
  '6-25' => 'Kroatien: Erklärung der Unabhängigkeit 1991, Mosambik: Erlangung der Unabhängigkeit 1975, Slowenien: Erklärung der Unabhängigkeit 1991',
  '6-26' => 'Madagaskar: Nationalfeiertag',
  '6-27' => 'Dschibuti: Erlangung der Unabhängigkeit',
  '6-30' => 'Kongo, Demokratische Republik (Zaire): Erlangung der Unabhängigkeit 1960',
  '7-1' => 'Burundi: Erlangung der Unabhängigkeit 1962, Kanada: Nationalfeiertag (Canada Day), Ruanda: Erlangung der Unabhängigkeit 1962',
  '7-3' => 'Belarus (Weißrussland): Nationalfeiertag',
  '7-4' => 'Tonga: Geburtstag des regierenden Königs, Vereinigte Staaten von Amerika: Erklärung der Unabhängigkeit 1776',
  '7-5' => 'Kap Verde: Erlangung der Unabhängigkeit 1975, Venezuela: Erklärung der Unabhängigkeit 1811',
  '7-6' => 'Komoren: Erlangung der Unabhängigkeit 1975, Litauen: Staatsgründung durch die Krönung von Fürst Mindaugas 1250, Malawi: Erlangung der Unabhängigkeit 1964',
  '7-7' => 'Nepal: Geburtstag des regierenden Königs, Salomonen: Erlangung der Unabhängigkeit 1978',
  '7-10' => 'Bahamas: Erklärung der Unabhängigkeit',
  '7-11' => 'Mongolei: Jahrestag des Sieges der Revolution (1921)',
  '7-12' => 'Kiribati: Erlangung der Unabhängigkeit 1979, Sao Tome und Principe: Erlangung der Unabhängigkeit 1975',
  '7-14' => 'Frankreich: Jahrestag des Sturms auf die Bastille 1789',
  '7-20' => 'Kolumbien: Erklärung der Unabhängigkeit 1810',
  '7-21' => 'Belgien: Tag der Vereidigung des ersten belgischen Königs, Leopold I.',
  '7-23' => 'Ägypten: Revolutionstag 1952',
  '7-26' => 'Liberia: Erklärung der Unabhängigkeit 1847, Malediven: Erlangung der Unabhängigkeit 1965',
  '7-28' => 'Peru: Erklärung der Unabhängigkeit 1821',
  '7-30' => 'Marokko: Thronbesteigung des regierenden Königs Mohammed VI. 1999, Vanuatu: Erlangung der Unabhängigkeit 1980',
  '8-1' => 'Benin: Erlangung der Unabhängigkeit, Schweiz: Jahrestag der Bundesfeier 1291',
  '8-2' => 'Mazedonien: Gedenktag anlässlich des Aufstandes gegen die Türken 1903',
  '8-6' => 'Bolivien: Erlangung der Unabhängigkeit, Jamaika: Erklärung der Unabhängigkeit 1962',
  '8-7' => 'Elfenbeinküste: Erlangung der Unabhängigkeit 1960',
  '8-9' => 'Singapur: Erlangung der Unabhängigkeit 1965 durch Ausscheiden aus der Malayischen Föderation',
  '8-10' => 'Ecuador: Erklärung der Unabhängigkeit 1809',
  '8-11' => 'Tschad: Erlangung der Unabhängigkeit 1960',
  '8-14' => 'Pakistan: Staatsgründung 1947',
  '8-15' => 'Indien: Erklärung der Unabhängigkeit (Independence Day), Kongo, Republik: Erlangung der Unabhängigkeit 1960, Korea, Süd: Erklärung der Unabhängigkeit 1948, Liechtenstein: Nationalfeiertag',
  '8-17' => 'Gabun: Erlangung der Unabhängigkeit 1960, Indonesien: Erklärung der Unabhängigkeit 1945',
  '8-19' => 'Afghanistan: Erlangung der Unabhängigkeit',
  '8-20' => 'Estland: Erklärung der Wiederherstellung der Unabhängigkeit 1991, Ungarn: offizieller Haupt-Nationalfeiertag (Fest des Staatsgründers und ersten ungarischen Königs Stephan des Heiligen)',
  '8-24' => 'Ukraine: Erklärung der Unabhängigkeit 1991',
  '8-25' => 'Uruguay: Erlangung der Unabhängigkeit 1825',
  '8-27' => 'Moldau: Erklärung der Unabhängigkeit 1991',
  '8-29' => 'Slowakei: Tag des slowakischen Nationalaufstandes',
  '8-31' => 'Kirgisistan: Erklärung der Unabhängigkeit 1991, Malaysia: Erlangung der Unabhängigkeit 1957, Trinidad und Tobago: Erlangung der Unabhängigkeit',
  '9-1' => 'Libyen: Jahrestag der Revolution 1969, Slowakei: Tag der Verfassung der Slowakischen Republik, Usbekistan: Erklärung der Unabhängigkeit 1991',
  '9-2' => 'Vietnam: Erklärung der Unabhängigkeit 1945',
  '9-3' => 'Katar: Erlangung der Unabhängigkeit 1971, San Marino: Tag der Staatsgründung',
  '9-6' => 'Swasiland: Erlangung der Unabhängigkeit 1968',
  '9-7' => 'Brasilien: Erklärung der Unabhängigkeit (1822)',
  '9-8' => 'Andorra: Tag der Schutzpatronin von Andorra, Malta: Our Lady of Victory (Ende der großen Türken-Belagerung 1565), Mazedonien: Erklärung der Unabhängigkeit 1991',
  '9-9' => 'Korea, Nord: Erklärung der Unabhängigkeit 1948, Tadschikistan: Erklärung der Unabhängigkeit 1991',
  '9-15' => 'Costa Rica: Erklärung der Unabhängigkeit 1821, El Salvador: Erklärung der Unabhängigkeit 1821, Guatemala: Erklärung der Unabhängigkeit 1821, Honduras: Erklärung der Unabhängigkeit 1821, Nicaragua: Erklärung der Unabhängigkeit 1821',
  '9-16' => 'Mexiko: Erklärung der Unabhängigkeit 1810, Papua-Neuguinea: Erklärung der Unabhängigkeit 1975',
  '9-18' => 'Chile: Erklärung der Unabhängigkeit 1810',
  '9-19' => 'Chile: Erklärung der Unabhängigkeit 1810, Saint Kitts und Nevis: Erlangung der Unabhängigkeit 1983',
  '9-21' => 'Armenien: Erklärung der Unabhängigkeit, Belize: Erklärung der Unabhängigkeit, Malta: Independence Day (Erlangung der Unabhängigkeit 1964)',
  '9-22' => 'Mali: Erlangung der Unabhängigkeit 1960',
  '9-23' => 'Saudi-Arabien: Proklamation des Königreichs 1932',
  '9-24' => 'Guinea-Bissau: Erklärung der Unabhängigkeit 1973',
  '9-26' => 'Jemen: Revolutionstag (Nord-Jemen) 1962',
  '9-30' => 'Botsuana (Botswana): Erlangung der Unabhängigkeit 1966',
  '10-1' => 'China: Gründung der Volksrepublik 1949, Nigeria: Erlangung der Unabhängigkeit, Palau: Erlangung der Unabhängigkeit 1994, Tuvalu: Erlangung der Unabhängigkeit 1978, Zypern: Erklärung der Unabhängigkeit 1960',
  '10-2' => 'Guinea: Erklärung der Unabhängigkeit 1958',
  '10-3' => 'Deutschland: Jahrestag der Wiedervereinigung 1990',
  '10-4' => 'Lesotho: Erlangung der Unabhängigkeit',
  '10-9' => 'Uganda: Erlangung der Unabhängigkeit 1962',
  '10-10' => 'Fidschi: Erlangung der Unabhängigkeit 1970, Taiwan: Tag der republikanischen Revolte gegen die Mandschu-Dynastie 1911 bzw. Tag der Staatsgründung',
  '10-12' => 'Spanien: Gedenktag an die Entdeckung Amerikas 1492, Äquatorial Guinea: Erlangung der Unabhängigkeit 1968',
  '10-14' => 'Jemen: Revolutionstag (Süd-Jemen) 1963',
# '10-16' => 'Vatikanstaat: Jahrestag der Wahl des letzte nPapstes (Johannes Paul II.)',
  '10-21' => 'Somalia: Nationalfeiertag',
  '10-23' => 'Ungarn: Gedenktag für den Volksaufstand 1956 sowie Erklärung der Unabhängigkeit 1989',
  '10-24' => 'Sambia: Erlangung der Unabhängigkeit 1964',
  '10-26' => 'Österreich: Jahrestag der Verabschiedung des Neutralitätsgesetzes 1955',
  '10-27' => 'Saint Vincent und die Grenadinen: Erlangung der Unabhängigkeit 1979, Turkmenistan: Erklärung der Unabhängigkeit 1991',
  '10-28' => 'Tschechische Republik: Erlangung der Unabhängigkeit 1918',
  '10-29' => 'Türkei: Ausrufung der Republik durch Atatürk 1923',
  '11-1' => 'Algerien: Beginn der Revolution 1954, Antigua und Barbuda: Erlangung der Unabhängigkeit',
  '11-3' => 'Dominica: Erlangung der Unabhängigkeit, Mikronesien: Erlangung der Unabhängigkeit 1986, Panama: Erklärung der Unabhängigkeit 1903',
  '11-9' => 'Kambodscha: Tag der Entlassung aus dem französischen Protektorat 1953',
  '11-11' => 'Angola: Erlangung der Unabhängigkeit 1975, Polen: Erlangung der Unabhängigkeit 1918',
  '11-18' => 'Lettland: Erklärung der Unabhängigkeit 1918, Oman: Geburtstag des herrschenden Sultans',
  '11-19' => 'Monaco: Namenstag des regierenden Fürsten (Rainier III.)',
  '11-21' => 'Bosnien und Herzegowina: Friedenstag (Friedensabkommen von Dayton)',
  '11-22' => 'Libanon: Erlangung der Unabhängigkeit 1943',
  '11-25' => 'Bosnien und Herzegowina: Beitritt zum Staat Jugoslawien 1945, Surinam: Erlangung der Unabhängigkeit 1975',
  '11-28' => 'Albanien: Erklärung der Unabhängigkeit 1912, Mauretanien: Erlangung der Unabhängigkeit 1960, Timor-Leste (Ost-Timor): Nationalfeiertag',
  '11-29' => 'Albanien: Nationalfeiertag',
  '11-30' => 'Barbados: Erlangung der Unabhängigkeit 1966, Jemen: Ende der britischen Kolonialherrschaft im Süd-Jemen 1967',
  '12-1' => 'Rumänien: Nationalfeiertag, Zentralafrikanische Republik: Jahrestag der Staatsgründung 1958',
  '12-2' => 'Laos: Proklamation der Demokratischen Volksrepublik Laos 1975, Vereinigte Arabische Emirate: Jahrestag der Staatsgründung 1971',
  '12-5' => 'Thailand: Geburtstag des regierenden Königs',
  '12-6' => 'Finnland: Erklärung der Unabhängigkeit 1917',
  '12-11' => 'Burkina Faso: Erlangung der Unabhängigkeit',
  '12-12' => 'Kenia: Erlangung der Unabhängigkeit',
  '12-13' => 'Malta: Republic Day (Malteser wird Staatsoberhaupt 1974), Saint Lucia: St. Lucia Day (vermuteter Jahrestag der Entdeckung)',
  '12-16' => 'Bahrain: Nationalfeiertag, Kasachstan: Erklärung der Unabhängigkeit 1991',
  '12-17' => 'Bangladesch: Erlangung der Unabhängigkeit, Bhutan: Krönung des ersten Königs 1907',
  '12-18' => 'Niger: Ausrufung der Republik',
  '12-23' => 'Japan: Geburtstag des regierenden Kaisers Akihito',
               );
