#!/bin/bash


# Load postgresql connection settings
. tools/pg_settings.sh

set -x

/bin/rm data/countries.geojson
ogr2ogr \
  -f GeoJSON data/countries.geojson \
  PG:"$OGR_PG_CONN" \
  country \
  -where "country.geounit in (select geounit from commodity)"

/bin/rm data/commodity.csv
ogr2ogr \
  -f CSV data/commodity.csv \
  PG:"$OGR_PG_CONN" \
  commodity \
  -where "geounit NOT IN ('Australia') AND commodity.geounit in (select geounit from country)"

/bin/rm data/countries.topojson
topojson \
  --id-property geounit \
  -p geounit \
  -o data/countries.topojson \
  data/countries.geojson

