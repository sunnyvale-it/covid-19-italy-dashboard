CREATE TABLE public."dati-regioni"
(
    data timestamp,
    stato character varying,
    codice_regione character varying,
    denominazione_regione character varying,
    lat float,
    long float,
    ricoverati_con_sintomi integer,
    terapia_intensiva integer,
    totale_ospedalizzati integer,
    isolamento_domiciliare integer,
    totale_attualmente_positivi integer,
    nuovi_attualmente_positivi integer,
    dimessi_guariti integer,
    deceduti integer,
    totale_casi integer,
    tamponi integer
)



TABLESPACE pg_default;

ALTER TABLE public."dati-regioni"
    OWNER to postgres;

