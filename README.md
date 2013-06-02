# GovHack 2013
# Australian Foreign Trade Data 2006 - 2011

## See it online:

At [http://chrisberkhout.github.com/govhack2013/tmp/#coal/2006](http://chrisberkhout.github.com/govhack2013/tmp/#coal/2006)

## Get the code

    git clone git@github.com:chrisberkhout/govhack2013.git && cd govhack2013
    git submodule init
    git submodule update
    cd tmp

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

Look at ways that we could map the data to give a good visual representation.
We have looked at both specific categories as well as overall country data.

## Plan

We did the following:

- written some Perl to manipulate the data
- created a database table and loaded the data so we can analyse it in SQL
- generated country totals
- put it all on github so that it is accessible
- make some more data summaries
- did some data cleansing
- matched the country names to country codes and geocodes so that we could use
it with mapping tools
- created a
[Choropleth map](http://en.wikipedia.org/wiki/Choropleth_map)
(or a "heat" map) to show which countries are our major trading partners
- created a [Cartogram](http://en.wikipedia.org/wiki/Cartogram) to show
countries sized according to their trade in particular commodities
- made a video explaining what we have done

## Data

Once the data was imported into a database it was interesting to look at the
data to better understand it and find any anomalies.

## Countries

Note some interesting entries under "countries", such as:
- Antartica
- Australia (that doesn't look right considering this is meant to be foreign trade!)
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
