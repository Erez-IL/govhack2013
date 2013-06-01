#!/bin/bash

set -x

rm data/countries.geojson
ogr2ogr \
  -f GeoJSON \
  -where "" \
  data/countries.geojson ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp

rm data/countries.topojson
topojson \
  --id-property name \
  -o data/countries.topojson \
  data/countries.geojson

