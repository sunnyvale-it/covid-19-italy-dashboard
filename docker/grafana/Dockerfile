FROM grafana/grafana:latest
RUN grafana-cli plugins install grafana-worldmap-panel && \
    grafana-cli plugins install yesoreyeram-boomtable-panel
#RUN rm -rf /home/grafana/plugins && \
#    mkdir /home/grafana/plugins && \
#    cp -r /var/lib/grafana/plugins/* /home/grafana/plugins