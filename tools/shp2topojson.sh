#!/bin/bash

set -x

rm data/countries.geojson
ogr2ogr \
  -f GeoJSON \
  -where "" \
  data/countries.geojson ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp

rm data/countries.json
topojson \
  --id-property su_a3 \
  -p name=NAME \
  -p name \
  -o data/countries.topojson \
  data/countries.geojson

