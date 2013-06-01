#!/bin/bash


sudo -u postgres createdb -T template_postgis_utf8 govhack

sudo -u postgres psql -f - <<END_OF_SQL

CREATE USER team WITH PASSWORD 'team';
GRANT ALL PRIVILEGES ON DATABASE govhack to team;

\connect govhack;

GRANT ALL ON geometry_columns to team;
GRANT ALL ON geography_columns to team;

END_OF_SQL



