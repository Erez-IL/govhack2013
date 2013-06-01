#!/bin/bash

# Load postgresql connection settings
. tools/pg_settings.sh

set -x 

psql --host=$PG_HOST --port=$PG_PORT --username=$PG_USER -f - $PG_DB <<END_OF_SQL

\connect govhack;

DROP TABLE IF EXISTS commodity;

END_OF_SQL

TMP_COMMODITY_FILE=/tmp/commodity.csv

if [[ ! -f $TMP_COMMODITY_FILE ]]; then
    wget -O $TMP_COMMODITY_FILE "http://data.gov.au/bye?http://raw.data.gov.au/8830/Cty%20by%20commodity%20FY2012.csv"
fi

ogr2ogr -f PostgreSQL PG:"$OGR_PG_CONN" $TMP_COMMODITY_FILE

psql --host=$PG_HOST --port=$PG_PORT --username=$PG_USER -f - $PG_DB <<END_OF_SQL

\connect govhack;

ALTER TABLE commodity RENAME COLUMN "direction" TO direction;
ALTER TABLE commodity RENAME COLUMN "financial  year" TO fy;
ALTER TABLE commodity RENAME COLUMN "partner country" TO geounit;
ALTER TABLE commodity RENAME COLUMN "commodity  sitc r4" TO commodity;
ALTER TABLE commodity RENAME COLUMN "a\$000" TO amount;

END_OF_SQL


