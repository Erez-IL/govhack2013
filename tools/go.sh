#!/bin/bash

rm data/countries-raw.json
ogr2ogr \
  -f GeoJSON \
  -where "" \
  data/countries-raw.json ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp

rm data/countries.json
topojson \
  --id-property su_a3 \
  -p name=NAME \
  -p name \
  -o data/countries.json \
  data/countries-raw.json

