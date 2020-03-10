# dati-regioni table
timestamp=`date +%Y/%m/%d-%H:%M:%S`
echo "Job started at $timestamp"
export DATE=$(date +%Y%m%d)
#export DATE=20200309
curl -o /tmp/dpc-covid19-ita-regioni-${DATE}.csv https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-${DATE}.csv
psql postgresql://postgres:postgres@postgres:5432/postgres -c "COPY public.\"dati-regioni\" FROM '/tmp/dpc-covid19-ita-regioni-${DATE}.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);" 
rm -f /tmp/dpc-covid19-ita-regioni-${DATE}.csv