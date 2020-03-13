#!/bin/bash


sleep 30


# set the default dashboard for anonymous users
curl -vvv 'http://grafana:3000/api/user/preferences' \
    -X PUT 'http://grafana:3000' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'X-Grafana-Org-Id: 1' \
    -H 'Accept-Language: en-IN,en;q=0.9,en-GB;q=0.8,en-US;q=0.7,ml;q=0.6,mt;q=0.5' \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    --data-binary '{"homeDashboardId":1,"theme":"","timezone":""}' \
    --compressed