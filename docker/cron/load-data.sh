# dati-regioni table
timestamp=`date +%Y/%m/%d-%H:%M:%S`
echo "Job started at $timestamp"
#export DATE=$(date +%Y%m%d)
#export DATE=20200309
#curl -vvv -o /tmp/dpc-covid19-ita-regioni-${DATE}.csv https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-${DATE}.csv
psql postgresql://postgres:postgres@postgres:5432/postgres -c "truncate \"dati-regioni\""
#psql postgresql://postgres:postgres@postgres:5432/postgres -c "\COPY \"dati-regioni\" FROM '/tmp/dpc-covid19-ita-regioni-${DATE}.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);" 
psql postgresql://postgres:postgres@postgres:5432/postgres -c "\COPY \"dati-regioni\" FROM PROGRAM 'curl \"https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv\"' WITH (FORMAT csv, DELIMITER ',', HEADER true);"
#psql postgresql://postgres:postgres@postgres:5432/postgres -c "UPDATE public.\"dati-regioni\" SET data = data AT TIME ZONE 'Europe/Rome';"
#rm -f /tmp/dpc-covid19-ita-regioni-${DATE}.csv