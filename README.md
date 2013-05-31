# GovHack 2013
# Australian Trade Data 2006 - 2011

## Aim

The aim of this project is to create some visualisations and tell a story with Australian Foreign trade data.

## Data

The data set used is [Australian foreign trade country and commodity data](http://raw.data.gov.au/8830/Cty%20by%20commodity%20FY2012.csv).

The data set contains 184,793 rows of data for 229 countries, 264 commodity categories over a 6 year period.

## Countries

Note some interesting entries under "countries", such as:
- Antartica
- Australia (I really don't know how that got there!)
- Confidential (Alumina Special Case)
- International Waters
- No Country Details
- Ships Stores
- Unknown

There are also some "countries" which are part of another country:
- Falkland Islands
- Hong Kong (SAR of China)
- Macau (SAR of China)
- US Outlying Islands
- British Indian Ocean Territory

We probably want to merge Hong Kong and Macau into China as a single data set.

The country lists seems to closely match
[ISO 3166](http://en.wikipedia.org/wiki/ISO_3166)
and specifically
[ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1),
these codes may be useful in helping match countries to geocode data.

## Categories

The trade categories range from 

Animal feed
Crude vegetable matter, nes

Aircraft, spacecraft & parts
Confidential items of trade
Special transactions & commodities
Crude minerals, nes
Explosives & pyrotechnics
Arms & ammunition
Coal
Iron ore & concentrates
(could also look at other ores)
Crude petroleum
Confidential mineral ores
Confidential organic chemicals
