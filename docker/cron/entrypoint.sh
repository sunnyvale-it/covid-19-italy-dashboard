#!/bin/bash 
set -x

# Start the run once job.
echo "Docker container has been started"


# one-time DB initialization only
if [ ! -f /container.env ]; then
    sleep 90
    psql postgresql://postgres:postgres@postgres:5432/postgres -c "truncate \"dati-regioni\""
    export FIRST_DATE=$(date -d 'Mon Feb 24 00:00:00' +%Y-%m-%d)
    export CURRENT_DATE=$(date +%Y-%m-%d)
    export DATE_DIFF=$(dateutils.ddiff $CURRENT_DATE $FIRST_DATE)
    for  (( i=$DATE_DIFF; i<=0; i++ ))
    do
        echo $i
        export DATE=$(date +%Y%m%d -d "$CURRENT_DATE -$i day")
        echo "curl -s -o /tmp/dpc-covid19-ita-regioni-${DATE}.csv https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-${DATE}.csv"
        curl -s -o /tmp/dpc-covid19-ita-regioni-${DATE}.csv https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-${DATE}.csv
        psql postgresql://postgres:postgres@postgres:5432/postgres -c "\copy \"dati-regioni\" FROM '/tmp/dpc-covid19-ita-regioni-${DATE}.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);" 
        rm -f /tmp/dpc-covid19-ita-regioni-${DATE}.csv
    done
    rm /tmp/*.csv
    #psql postgresql://postgres:postgres@postgres:5432/postgres -c "UPDATE \"dati-regioni\" SET data = data AT TIME ZONE 'Europe/Rome';"
fi



declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

crontab /schedules.crontab
cron -f