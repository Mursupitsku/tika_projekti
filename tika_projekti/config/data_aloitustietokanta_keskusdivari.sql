
-- ALOITUSTIETOKANTA
-- testitarkoitus

SET SEARCH_PATH TO keskusdivari;

-- ASIAKAS
INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (1, 'yrjö', 'ylläpitäjä', 'norsunluutorni 1', 12345, 'Helsinki', 'admin@admin.com', '04069696969', 'admin', 'admin');


INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (2, 'maija', 'meikalainen', 'norsu 11', 53212, 'Tampere', 'maija@email.com', '0222222', 'maija', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (3, 'marko', 'meika', 'katu 12', 5555, 'Tampere', 'marko@email.com', '0233332', 'marko', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (4, 'keijo', 'marjakainen', 'katu 134', 444444, 'Turku', 'keijo@email.com', '04444442', 'keijo', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (5, 'testi', 'henkilo', 'kuja 34', 22333, 'Espoo', 'testi@email.com', '0455555542', 'testi', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (6, 'sulo', 'suurostaja', 'massikuja 64', 22123, 'Espoo', 'sulo@email.com', '045343242', 'sulo', 'asiakas');




-- TILAUS

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-02-24', 2 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-02-24', 3 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-02-04', 4 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-03-02', 2 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-03-01', 5 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-03-03', 6 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-03-04', 6 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-03-05', 6 );

INSERT INTO tilaus (tilauspvm, asiakas_id) 
VALUES ('2025-03-03', 2 );



-- LÄHETYS
INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-02-25', 1 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-02-25', 2 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-02-05', 3 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-04', 4 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 5 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 5 );


INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-03', 6 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 7 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 8 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 9 );



-- POSTIKULUT
INSERT INTO postikulut (postikulu_id, paino, hinta) 
VALUES (1, 50, 2.50 );

INSERT INTO postikulut (postikulu_id, paino, hinta) 
VALUES (2, 250, 5.00 );

INSERT INTO postikulut (postikulu_id, paino, hinta) 
VALUES (3, 1000, 10.00 );

INSERT INTO postikulut (postikulu_id, paino, hinta) 
VALUES (4, 2000, 15.00 );







-- TEOS
--INSERT INTO teos (teos_id, nimi, tekija, vuosi, isbn, paino)) 
INSERT INTO teos (tekija, nimi, isbn, vuosi, paino) 
VALUES ('Madeleine Brent', 'Elektran tytär', '9155430674', 1986, 250);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Madeleine Brent', 'Tuulentavoittelijan morsian', '9156381451', 1978, 250);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Mika Waltari', 'Turms kuolematon', NULL , 1995, 550);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Mika Waltari',  'Komisario Palmun erehdys', NULL, 1940, 200);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Shelton Gilbert', 'Friikkilän pojat Mexicossa', '1234345', 1989, 20);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Dale Carnegien', 'Miten saan ystäviä, menestystä, vaikutusvaltaa', '9789510396230', 1939, 50);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Kaki', 'Painava kirja', '123455', 2020, 2000);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Kaki', 'Kevyt kirja', '124589', 2022, 45);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('George', 'Hello world!', '778899', 2021, 85);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Lena', 'Tietokantaohjelmointi', '775529', 2018, 105);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Saija', 'Joutsen laulu', '775511', 2008, 75);

INSERT INTO teos (tekija, nimi, isbn, vuosi, paino)
VALUES ('Kuuluisa Nimi', 'Kevättä ilmassa', '744311', 2012, 55);


-- TEOSLUOKKA
INSERT INTO teosluokka (luokka) 
VALUES ('romantiikka');

INSERT INTO teosluokka (luokka) 
VALUES ('historia');

INSERT INTO teosluokka (luokka) 
VALUES ('dekkari');

INSERT INTO teosluokka (luokka) 
VALUES ('huumori');

INSERT INTO teosluokka (luokka) 
VALUES ('opas');

INSERT INTO teosluokka (luokka) 
VALUES ('seikkailu');

INSERT INTO teosluokka (luokka) 
VALUES ('sikailu');

-- KUULUULUOKKAAN
INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (1, 1);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id)  
VALUES (1, 2);


INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (2, 1);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (3, 2);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (4, 3);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (5, 4);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (6, 5);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (7, 6);


INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (8, 7);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (8, 2);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (8, 3);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (9, 6);
INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (9, 3);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (10, 3);
INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (10, 1);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (11, 4);
INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (11, 5);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (12, 3);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (12, 6);


-- TEOSTYYPPI
INSERT INTO teostyyppi (tyyppi) 
VALUES ('romaani');

INSERT INTO teostyyppi (tyyppi) 
VALUES ('sarjakuva');

INSERT INTO teostyyppi (tyyppi) 
VALUES ('tietokirja');

INSERT INTO teostyyppi (tyyppi) 
VALUES ('kuvakirja');


-- KUULUU TYYPPIIN
INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (1, 1);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id)  -- kuuluu myös toiseen teostyyppiin
VALUES (1, 2);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (2, 1);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (3, 1);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (4, 1);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (4, 3);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (4, 4);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (5, 2);
INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (5, 3);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (6, 3);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (7, 4);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (7, 1);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (8, 3);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (9, 1);
INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (9, 2);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (10, 4);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (11, 2);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (11, 3);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (12, 2);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (12, 4);



-- DIVARI
INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (1, 'Lassen lehti', 'lehtikuja 3', 'www.lassenlehti.fi', TRUE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (2, 'Galleinn Galle', 'galletie 34', 'www.galle.fi', FALSE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (3, 'simon kauppa', 'simola 12', 'www.simonkauppa.fi', FALSE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (4, 'pertin divari', 'jokukatu 12', NULL, FALSE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (5, 'Aarre aitta', 'Aarrekatu 22', 'www.aarre.fi', FALSE );



-- NIDE
INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (15.50, 'myynnissä', 8.00, NULL, NULL, 1, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (10.50, 'myynnissä', 5.00, NULL, NULL, 2, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (11.50, 'myynnissä', 3.50, NULL, NULL, 2, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (5.50, 'myynnissä', 4.00, NULL, NULL, 3, 2);

INSERT INTO nide ( myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (9.50, 'myynnissä', 5.10, NULL, NULL, 1, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (19.50, 'myynnissä', 12.10, NULL, NULL, 4, 3);

INSERT INTO nide ( myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (19.50, 'myynnissä', 12.10, NULL, NULL, 5, 3);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (8.50, 'myynnissä', 1.50, NULL, NULL, 3, 3);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (18.50, 'myynnissä', 7.50, NULL, NULL, 3, 1);


INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (28.50, 'myynnissä', 12.50, NULL, NULL, 8, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (24.50, 'myynnissä', 13.50, NULL, NULL, 8, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (8.50, 'myynnissä', 1.50, NULL, NULL, 9, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (8.50, 'myynnissä', 1.50, NULL, NULL, 9, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (8.50, 'myynnissä', 1.50, NULL, NULL, 9, 4);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (15.50, 'myynnissä', 5.50, NULL, NULL, 10, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (16.50, 'myynnissä', 5.50, NULL, NULL, 10, 3);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (34.50, 'myynnissä', 14.50, NULL, NULL, 11, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (14.0, 'myynnissä', 10.50, NULL, NULL, 12, 4);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (18.50, 'myynnissä', 1.50, NULL, NULL, 1, 3);

-- myyty
INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (13.50, 'myyty', 8.50,  '2025-02-26', 1, 3, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (14.50, 'myyty', 4.50, ' 2025-02-26', 1, 1, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (9.50, 'myyty', 3.50,  '2025-03-03', 2, 3, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (6.50, 'myyty', 1.50,  '2025-03-05', 3, 5, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (17.50, 'myyty', 11.50,  '2025-03-25', 4, 4, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (33.50, 'myyty', 15.50,  '2025-03-02', 5, 7, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (32.50, 'myyty', 13.00,  '2025-03-02', 5, 7, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (15.50, 'myyty', 5.00,  '2025-03-10', 6, 8, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (25.50, 'myyty', 15.00,  '2025-03-11', 7, 8, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (28.50, 'myyty', 15.00,  '2025-03-11', 7, 8, 3);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (18.50, 'myyty', 8.00,  '2025-03-12', 8, 10, 3);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (15.50, 'myyty', 3.00,  '2025-03-12', 8, 11, 3);


INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (35.50, 'myyty', 12.00,  '2025-03-13', 9, 12, 4);




