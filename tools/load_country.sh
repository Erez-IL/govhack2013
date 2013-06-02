#!/bin/bash

# Load postgresql connection settings
. tools/pg_settings.sh

set -x 

psql --host=$PG_HOST --port=$PG_PORT --username=$PG_USER -f - $PG_DB <<END_OF_SQL

\connect govhack;

DROP TABLE IF EXISTS country;

END_OF_SQL

shp2pgsql -W "LATIN1" -g "wkb_geometry" -s 4326 -I ./data/ne_50m_admin_0_countries/ne_50m_admin_0_countries.shp country > /tmp/countries.sql

psql --host=$PG_HOST --port=$PG_PORT --username=$PG_USER -f /tmp/countries.sql $PG_DB

psql --host=$PG_HOST --port=$PG_PORT --username=$PG_USER -f tools/update_countries.sql $PG_DB


