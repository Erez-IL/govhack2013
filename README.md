# GovHack 2013
# Australian Foreign Trade Data 2006 - 2011

## Aim

The aim of this project is to create some visualisations and tell a story with Australian Foreign trade data.

## Data

The data set used is [Australian foreign trade country and commodity data](http://raw.data.gov.au/8830/Cty%20by%20commodity%20FY2012.csv).

The data set contains 184,793 rows of data for 229 countries, 264 commodity categories over a 6 year period.

## Approach

I think we are best concentrating on overall country data and maybe even limiting that to our 10 largest trading partners.  If (I think it's a big if) we have time, we could look at other things, but I think we are best getting something displayed visually as quickly as possible and trying to make a video to explain it.

## Data manipulation

So far I have:

- created a database table and loaded the data so we can analyse in SQL
- generated country totals
- put it all on github so that it is accessible

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

As mentioned above I don't think we'll have time this weekend to look into the different categories, but here is a quick overview.

The trade categories range from: 

- Animal feed to
- Aircraft, spacecraft & parts

and 

- Arms & ammunition to
- Medicaments (incl veterinary)

There are some special categories:

- Confidential items of trade
- Confidential mineral ores
- Confidential organic chemicals
- Special transactions & commodities

And here are some categories that I think could be interesting:

- Alcoholic beverages
- Coal
- Crude petroleum
- Iron ore & concentrates
- (could also look at other ores)
- Rice
- Wheat
