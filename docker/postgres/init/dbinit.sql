ALTER DATABASE postgres SET timezone TO 'Europe/Rome';

set timezone TO 'Europe/Rome';

CREATE TABLE "dati-regioni"
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
    totale_positivi integer,
    variazione_totale_positivi integer,
    nuovi_positivi integer,
    dimessi_guariti integer,
    deceduti integer,
    casi_da_sospetto_diagnostico integer,
    casi_da_screening integer,
    totale_casi integer,
    tamponi integer,
    casi_testati integer,
    note character varying,
    ingressi_terapia_intensiva integer,
    note_test character varying,
    note_casi character varying,
    totale_positivi_test_molecolare integer,
    totale_positivi_test_antigenico_rapido integer,
    tamponi_test_molecolare integer,
    tamponi_test_antigenico_rapido integer,
    codice_nuts_1 character varying,
    codice_nuts_2 character varying
);

CREATE TABLE "somministrazione-vaccini"
(
    data_somministrazione timestamp,
    fornitore character varying,
    area character varying,
    fascia_anagrafica character varying,
    sesso_maschile integer,
    sesso_femminile integer,
    categoria_operatori_sanitari_sociosanitari integer,
    categoria_personale_non_sanitario integer,
    categoria_ospiti_rsa integer,
    categoria_60_69 integer,
    categoria_70_79 integer,
    categoria_over80 integer,
    categoria_forze_armate integer,
    categoria_personale_scolastico integer,
    categoria_soggetti_fragili integer,
    categoria_altro integer,
    prima_dose integer,
    seconda_dose integer,
    codice_NUTS1 character varying,
    codice_NUTS2 character varying,
    codice_regione_ISTAT character varying,
    nome_area character varying
);





ALTER TABLE "dati-regioni"
    OWNER to postgres;

ALTER TABLE "somministrazione-vaccini"
    OWNER to postgres;


COPY "dati-regioni" FROM PROGRAM 'curl "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv"' WITH (FORMAT csv, DELIMITER ',', HEADER true);
COPY "somministrazione-vaccini" FROM PROGRAM 'curl "https://raw.githubusercontent.com/italia/covid19-opendata-vaccini/master/dati/somministrazioni-vaccini-latest.csv"' WITH (FORMAT csv, DELIMITER ',', HEADER true);
    