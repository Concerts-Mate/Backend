#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER "$PROJECT_USER_NAME" WITH PASSWORD '$PROJECT_USER_PASSWORD' LOGIN;
    CREATE DATABASE "$PROJECT_USER_DATABASE_NAME" OWNER "$PROJECT_USER_NAME";
    GRANT ALL ON SCHEMA public TO "$PROJECT_USER_NAME";
EOSQL

PGPASSWORD="${PROJECT_USER_PASSWORD}" psql -v ON_ERROR_STOP=1 --username "$PROJECT_USER_NAME" --dbname "$PROJECT_USER_DATABASE_NAME" -f /docker-entrypoint-initdb.d/init.sql <<-EOSQL
EOSQL