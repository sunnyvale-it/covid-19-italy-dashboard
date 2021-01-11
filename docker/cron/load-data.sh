#!/bin/bash
# dati-regioni table
timestamp=`date +%Y/%m/%d-%H:%M:%S`
echo "Job started at $timestamp"
#export DATE=$(date +%Y%m%d)
#export DATE=20200309
#curl -vvv -o /tmp/dpc-covid19-ita-regioni-${DATE}.csv https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-${DATE}.csv
#psql postgresql://postgres:postgres@postgres:5432/postgres -c "\COPY \"dati-regioni\" FROM '/tmp/dpc-covid19-ita-regioni-${DATE}.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);" 
#psql postgresql://postgres:postgres@postgres:5432/postgres -c "UPDATE public.\"dati-regioni\" SET data = data AT TIME ZONE 'Europe/Rome';"
#rm -f /tmp/dpc-covid19-ita-regioni-${DATE}.csv


#psql postgresql://postgres:postgres@postgres:5432/postgres -c "truncate \"dati-regioni\""
#psql postgresql://postgres:postgres@postgres:5432/postgres -c "\COPY \"dati-regioni\" FROM PROGRAM 'curl \"https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv\"' WITH (FORMAT csv, DELIMITER ',', HEADER true);"




curl -s https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv -o /tmp/dpc-covid19-ita-regioni.csv

if test -f "/tmp/dpc-covid19-ita-regioni.csv"; then
    psql postgresql://postgres:postgres@postgres:5432/postgres -c "truncate \"dati-regioni\""
    psql postgresql://postgres:postgres@postgres:5432/postgres -c "\COPY \"dati-regioni\" FROM '/tmp/dpc-covid19-ita-regioni.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);" 
    rm /tmp/dpc-covid19-ita-regioni.csv
fi


curl -s https://raw.githubusercontent.com/italia/covid19-opendata-vaccini/master/dati/somministrazioni-vaccini-latest.csv -o /tmp/somministrazioni-vaccini-latest.csv

if test -f "/tmp/somministrazioni-vaccini-latest.csv"; then
    psql postgresql://postgres:postgres@postgres:5432/postgres -c "truncate \"somministrazione-vaccini\""
    psql postgresql://postgres:postgres@postgres:5432/postgres -c "\COPY \"somministrazione-vaccini\" FROM '/tmp/somministrazioni-vaccini-latest.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);" 
    rm /tmp/somministrazioni-vaccini-latest.csv
fi
