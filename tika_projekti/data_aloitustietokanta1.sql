
-- ALOITUSTIETOKANTA
-- testitarkoitus



-- ASIAKAS
INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (6, 'yrjö', 'ylläpitäjä', 'norsunluutorni 1', 12345, 'Helsinki', 'admin@admin.com', '04069696969', 'admin', 'admin');


INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (11, 'maija', 'meikalainen', 'norsu 11', 53212, 'Tampere', 'maija@email.com', '0222222', 'maija', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (12, 'marko', 'meika', 'katu 12', 5555, 'Tampere', 'marko@email.com', '0233332', 'marko', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (13, 'keijo', 'marjakainen', 'katu 134', 444444, 'Turku', 'keijo@email.com', '04444442', 'keijo', 'asiakas');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (14, 'testi', 'henkilo', 'kuja 34', 22333, 'Espoo', 'testi@email.com', '0455555542', 'testi', 'asiakas');





-- TILAUS

INSERT INTO tilaus (tilaus_id, tilauspvm, asiakas_id) 
VALUES (1, '2025-02-24', 11 );

INSERT INTO tilaus (tilaus_id, tilauspvm, asiakas_id) 
VALUES (2, '2025-02-24', 12 );

INSERT INTO tilaus (tilaus_id, tilauspvm, asiakas_id) 
VALUES (3, '2025-02-04', 13 );

INSERT INTO tilaus (tilaus_id, tilauspvm, asiakas_id) 
VALUES (4, '2025-03-02', 11 );

INSERT INTO tilaus (tilaus_id, tilauspvm, asiakas_id) 
VALUES (5, '2025-03-01', 14 );



-- LÄHETYS
INSERT INTO lahetys (lahetys_id, toimituspvm, tilaus_id) 
VALUES (1, '2025-02-25', 1 );

INSERT INTO lahetys (lahetys_id, toimituspvm, tilaus_id) 
VALUES (2, '2025-02-25', 2 );

INSERT INTO lahetys (lahetys_id, toimituspvm, tilaus_id) 
VALUES (3, '2025-02-05', 3 );

INSERT INTO lahetys (lahetys_id, toimituspvm, tilaus_id) 
VALUES (4, '2025-03-04', 4 );

INSERT INTO lahetys (lahetys_id, toimituspvm, tilaus_id) 
VALUES (5, '2025-03-05', 5 );

INSERT INTO lahetys (lahetys_id, toimituspvm, tilaus_id) 
VALUES (6, '2025-03-05', 5 );




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
INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino) 
VALUES (1, 'Madeleine Brent', 'Elektran tytär', '9155430674', 1986, 250);

INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino)
VALUES (2, 'Madeleine Brent', 'Tuulentavoittelijan morsian', '9156381451', 1978, 250);

INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino)
VALUES (3, 'Mika Waltari', 'Turms kuolematon', NULL , 1995, 550);

INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino)
VALUES (4, 'Mika Waltari',  'Komisario Palmun erehdys', NULL, 1940, 200);

INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino)
VALUES (5, 'Shelton Gilbert', 'Friikkilän pojat Mexicossa', '1234345', 1989, 20);

INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino)
VALUES (6, 'Dale Carnegien', 'Miten saan ystäviä, menestystä, vaikutusvaltaa', '9789510396230', 1939, 50);

INSERT INTO teos (teos_id, tekija, nimi, isbn, vuosi, paino)
VALUES (7, 'Kaki', 'Painava kirja', '123455', 2020, 2000);


-- TEOSLUOKKA
INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (1, 'romantiikka');

INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (2, 'historia');

INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (3, 'dekkari');

INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (4, 'huumori');

INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (5, 'opas');

INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (6, 'seikkailu');

INSERT INTO teosluokka (teosluokka_id, luokka) 
VALUES (7, 'sikailu');

-- KUULUULUOKKAAN
INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) 
VALUES (1, 1);

INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id)  -- kuuluu myös toiseen teosluokkaan
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


-- TEOSTYYPPI
INSERT INTO teostyyppi (teostyyppi_id, tyyppi) 
VALUES (1, 'romaani');

INSERT INTO teostyyppi (teostyyppi_id, tyyppi) 
VALUES (2, 'sarjakuva');

INSERT INTO teostyyppi (teostyyppi_id, tyyppi) 
VALUES (3, 'tietokirja');

INSERT INTO teostyyppi (teostyyppi_id, tyyppi) 
VALUES (4, 'kuvakirja');


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
VALUES (5, 2);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (6, 3);

INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) 
VALUES (7, 4);





-- DIVARI
INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (1, 'Lassen lehti', 'lehtikuja 3', 'www.lassenlehti.fi', TRUE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (2, 'Galleinn Galle', 'galletie 34', 'www.galle.fi', FALSE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (3, 'simon kauppa', 'simola 12', 'www.simonkauppa.fi', FALSE );

INSERT INTO divari (divari_id, nimi, osoite, web_sivu, oma_tietokanta) 
VALUES (4, 'pertin divari', 'jokukatu 12', NULL, FALSE );





-- NIDE
INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (1, 15.50, 'myynnissä', 8.00, NULL, NULL, 1, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (2, 10.50, 'myynnissä', 5.00, NULL, NULL, 2, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (3, 11.50, 'myynnissä', 3.50, NULL, NULL, 2, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (4, 5.50, 'myynnissä', 4.00, NULL, NULL, 3, 2);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (5, 9.50, 'myynnissä', 5.10, NULL, NULL, 1, 2);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (6, 19.50, 'myynnissä', 12.10, NULL, NULL, 4, 3);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (7, 19.50, 'myynnissä', 12.10, NULL, NULL, 5, 3);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (8, 8.50, 'myynnissä', 1.50, NULL, NULL, 3, 3);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (9, 18.50, 'myynnissä', 7.50, NULL, NULL, 3, 1);




-- myyty
INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (10, 13.50, 'myyty', 8.50,  '2025-02-26', 1, 3, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (11, 14.50, 'myyty', 4.50, ' 2025-02-26', 1, 1, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (12, 9.50, 'myyty', 3.50,  '2025-03-03', 2, 3, 2);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (13, 6.50, 'myyty', 1.50,  '2025-03-05', 3, 5, 2);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (14, 17.50, 'myyty', 11.50,  '2025-03-25', 4, 4, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (15, 33.50, 'myyty', 15.50,  '2025-03-02', 5, 7, 1);

INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (16, 32.50, 'myyty', 13.00,  '2025-03-02', 5, 7, 1);





INSERT INTO nide (nide_id, myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id, divari_id) 
VALUES (17, 18.50, 'myynnissä', 1.50, NULL, NULL, 1, 3);


