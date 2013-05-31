# GovHack 2013
# Australian Foreign Trade Data 2006 - 2011

## Aim

The aim of this project is to create some visualisations and tell a story with
Australian Foreign trade data.

## Data

The data set used is [Australian foreign trade country and commodity data]
(http://raw.data.gov.au/8830/Cty%20by%20commodity%20FY2012.csv).

The data set contains 184,793 rows of data for 229 countries (or territories)
and 264 commodity categories over a 6 year period.

The data is for __Financial Year__ and the amounts are in __thousands of Australian dollars__.

## Approach

I think we are best concentrating on overall country data and maybe even
limiting that to our 10 largest trading partners.

If (and I think it's a big if) we have time, we could look at other things, but I
think we are best getting something displayed visually as quickly as possible
and trying to make a video to explain it.

## Plan

So far I have:

- written some Perl to manipulate the data
- created a database table and loaded the data so we can analyse in SQL
- generated country totals
- put it all on github so that it is accessible

What else I could do (but it would be great if someone could take this on):
- make some more data summaries
- limit the data to our top 10 trading partners
- if we want to use a
[Choropleth map](http://en.wikipedia.org/wiki/Choropleth_map)
then select a colour progression and determine what number ranges move from
one colour to the next


If someone else could:
- display that visually (e.g. overlaying a map of the world, maybe as some sort of
[Choropleth map](http://en.wikipedia.org/wiki/Choropleth_map)

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

As mentioned above I don't think we'll have time this weekend to look into the
different categories, but here is a quick overview.

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
