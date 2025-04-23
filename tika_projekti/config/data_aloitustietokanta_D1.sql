

SET SEARCH_PATH TO D1;


-- TILAUS

INSERT INTO tilaus (tilauspvm) 
VALUES ('2025-02-24');

INSERT INTO tilaus (tilauspvm) 
VALUES ('2025-03-02');

INSERT INTO tilaus (tilauspvm) 
VALUES ('2025-03-01');



-- LÄHETYS
INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-02-25', 1 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-04', 4 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 5 );

INSERT INTO lahetys (toimituspvm, tilaus_id) 
VALUES ('2025-03-05', 5 );





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





-- NIDE
INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (15.50, 'myynnissä', 8.00, NULL, NULL, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (10.50, 'myynnissä', 5.00, NULL, NULL, 2);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (11.50, 'myynnissä', 3.50, NULL, NULL, 2);


INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (18.50, 'myynnissä', 7.50, NULL, NULL, 3);


INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (28.50, 'myynnissä', 12.50, NULL, NULL, 8);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (8.50, 'myynnissä', 1.50, NULL, NULL, 9);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (8.50, 'myynnissä', 1.50, NULL, NULL, 9);


INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (13.50, 'myyty', 8.50,  '2025-02-26', 1, 3);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (14.50, 'myyty', 4.50, ' 2025-02-26', 1, 1);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (17.50, 'myyty', 11.50,  '2025-03-25', 2, 4);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (33.50, 'myyty', 15.50,  '2025-03-02', 3, 7);

INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, myyntipvm, tilaus_id, teos_id) 
VALUES (32.50, 'myyty', 13.00,  '2025-03-02', 3, 7);

