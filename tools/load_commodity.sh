#!/bin/bash

# Load postgresql connection settings
. pg_settings.sh

set -x 

sudo -u postgres psql -f - <<END_OF_SQL

\connect govhack;

DROP TABLE IF EXISTS commodity;

END_OF_SQL

TMP_COMMODITY_FILE=/tmp/commodity.csv

if [[ ! -f $TMP_COMMODITY_FILE ]]; then
    wget -O $TMP_COMMODITY_FILE "http://data.gov.au/bye?http://raw.data.gov.au/8830/Cty%20by%20commodity%20FY2012.csv"
fi

ogr2ogr -f PostgreSQL PG:"$OGR_PG_CONN" $TMP_COMMODITY_FILE

sudo -u postgres psql -f - <<END_OF_SQL

\connect govhack;

ALTER TABLE commodity RENAME COLUMN field_1 to direction;
ALTER TABLE commodity RENAME COLUMN field_2 to fy;
ALTER TABLE commodity RENAME COLUMN field_3 to geounit;
ALTER TABLE commodity RENAME COLUMN field_4 to commodity;
ALTER TABLE commodity RENAME COLUMN field_5 to amount;

END_OF_SQL


