#!/bin/bash


# Load postgresql connection settings
. pg_settings.sh

set -x 

/bin/rm data/countries.geojson
ogr2ogr \
  -f GeoJSON countries.geojson \
  PG:"$OGR_PG_CONN" \
  country \ 
  -where "country.geounit in (select country from commodity)"

/bin/rm data/commodity.geojson
ogr2ogr \
  -f CSV commodity.csv \
  PG:"$OGR_PG_CONN" \
  commodity \ 
  -where "commodity.country in (select geounit from country)"

/bin/rm data/countries.topojson
topojson \
  --id-property name \
  -o data/countries.topojson \
  data/countries.geojson

