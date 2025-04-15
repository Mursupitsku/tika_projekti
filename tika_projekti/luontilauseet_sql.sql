--Kokeiluja tässä, oikeat luontilauseet alempana

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (6, 'yrjö', 'ylläpitäjä', 'norsunluutorni 1', 12345, 'Helsinki', 'admin@admin.com', '04069696969', 'admin', 'admin');

INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) 
VALUES (1, 'testi', 'testi', 'testikatu 1', 22222, 'Tampere', 'testi@testi.com', '04069696969', 'testi', 'user');

INSERT INTO divari (nimi, osoite, web_sivu, oma_tietokanta)
VALUES ('testidivari', 'testikatu 1', 'www.google.com', false);

CREATE TABLE teos ( 

teos_id SERIAL PRIMARY KEY, 

nimi VARCHAR(30) NOT NULL, 

tekija VARCHAR(30), 

isbn VARCHAR(30) NOT NULL,

paino REAL
--PRIMARY KEY (teos_id) 



); 

CREATE TABLE nide ( 

nide_id INT, 

isbn VARCHAR(15), 

myyntihinta NUMERIC(8,2) NOT NULL, 

niteen_tila VARCHAR(10) NOT NULL, 

sisaanostohinta NUMERIC(8,2), 

myyntipvm DATE NOT NULL, 

paino INT NOT NULL, 

tilaus_id INT NOT NULL, 

teos_id INT NOT NULL, 

divari_id INT NOT NULL, 

PRIMARY KEY (nide_id), 

FOREIGN KEY(tilaus_id) REFERENCES tilaus, 

FOREIGN KEY(teos_id) REFERENCES teos, 

FOREIGN KEY(divari_id) REFERENCES divari 

); 



/*
Perusratkaisussa rajoitutaan kahteen yksittäiseen divariin D1
(Lassen lehti) ja D2 (Galleinn Galle). 
Divari D1 käyttää omaa tietokantaa, mutta siitä kopio
keskustietokannassa. D2 käyttää vain keskusdivarin tietokantaa. 
Toisin sanoen työssä pitää toteuttaa vähintään kaksi kaavioita
*/

CREATE SCHEMA D1;
SET SEARCH_PATH TO D1;

CREATE TABLE asiakas (
asiakas_id INT,
etunimi VARCHAR(15) NOT NULL,
sukunimi VARCHAR(20) NOT NULL,
katuosoite VARCHAR(20),
postinumero INT,
postitoimipaikka VARCHAR(10),
email VARCHAR(30) NOT NULL,
puhelin VARCHAR(15),
salasana VARCHAR(20) NOT NULL,
rooli VARCHAR(20) NOT NULL,
PRIMARY KEY (asiakas_id)
);

CREATE TABLE tilaus (
tilaus_id INT,
tilauspvm DATE NOT NULL,
asiakas_id INT NOT NULL,
PRIMARY KEY (tilaus_id),
FOREIGN KEY(asiakas_id) REFERENCES asiakas
);

CREATE TABLE lahetys (
lahetys_id INT,
toimituspvm DATE NOT NULL,
tilaus_id INT NOT NULL,
PRIMARY KEY (lahetys_id),
FOREIGN KEY(tilaus_id) REFERENCES tilaus
);

CREATE TABLE postikulut (
postikulu_id INT,
paino INT NOT NULL,
hinta INT NOT NULL,
PRIMARY KEY (postikulu_id)
);



CREATE TABLE teosluokka(
teos_id INT,
luokka VARCHAR(15),
PRIMARY KEY (teos_id, luokka),
FOREIGN KEY (teos_id) REFERENCES teos
);

CREATE TABLE teostyyppi(
teos_id SERIAL,
tyyppi VARCHAR(15),
PRIMARY KEY (teos_id, tyyppi),
FOREIGN KEY (teos_id) REFERENCES teos
);


CREATE TABLE teos (
teos_id SERIAL,
nimi VARCHAR(15) NOT NULL,
tekija VARCHAR(15),
vuosi INT,
isbn VARCHAR(15),
paino INT NOT NULL,
PRIMARY KEY (teos_id)
);



CREATE TABLE nide (
nide_id INT,
myyntihinta NUMERIC(8,2) NOT NULL,
niteen_tila VARCHAR(10) NOT NULL,
sisaanostohinta NUMERIC(8,2),
myyntipvm DATE NOT NULL,
tilaus_id INT NOT NULL,
teos_id INT NOT NULL,
divari_id INT NOT NULL,
PRIMARY KEY (nide_id),
FOREIGN KEY(tilaus_id) REFERENCES tilaus,
FOREIGN KEY(teos_id) REFERENCES teos
);

------------------------------------------

/* 
Työssä ei toteuteta varsinaisesti eri tietokantoja divareille, 
vaan yksittäiselle divarille ja keskusdivarille pitää
muodostaa oma kaavio/skeema (osatietokanta).
*/



CREATE SCHEMA keskusdivari;
SET SEARCH_PATH TO keskusdivari;

CREATE TABLE asiakas (
asiakas_id INT,
etunimi VARCHAR(15) NOT NULL,
sukunimi VARCHAR(20) NOT NULL,
katuosoite VARCHAR(20),
postinumero INT,
postitoimipaikka VARCHAR(10),
email VARCHAR(30) NOT NULL,
puhelin VARCHAR(15),
salasana VARCHAR(20) NOT NULL,
rooli VARCHAR(20) NOT NULL,
PRIMARY KEY (asiakas_id)
);

CREATE TABLE teos (
teos_id SERIAL,
nimi VARCHAR(15) NOT NULL,
tekija VARCHAR(15),
vuosi INT,
isbn VARCHAR(15),
paino INT NOT NULL,
tyyppi_id INT NOT NULL,
luokka_id INT NOT NULL,
PRIMARY KEY (teos_id),
--FOREIGN KEY(tyyppi_id) REFERENCES teostyyppi,
--FOREIGN KEY(luokka_id) REFERENCES teosluokka
);


CREATE TABLE tilaus (
tilaus_id INT,
tilauspvm DATE NOT NULL,
asiakas_id INT NOT NULL,
PRIMARY KEY (tilaus_id),
FOREIGN KEY(asiakas_id) REFERENCES asiakas
);

CREATE TABLE lahetys (
lahetys_id INT,
toimituspvm DATE NOT NULL,
tilaus_id INT NOT NULL,
PRIMARY KEY (lahetys_id),
FOREIGN KEY(tilaus_id) REFERENCES tilaus
);

CREATE TABLE postikulut (
postikulu_id INT,
paino INT NOT NULL,
hinta NUMERIC(5,2) NOT NULL,                        -- muutettu
PRIMARY KEY (postikulu_id)
);


CREATE TABLE teosluokka(                  -- MUUTETTU, UUSI
teosluokka_id INT,                        
luokka VARCHAR(15) NOT NULL,              
PRIMARY KEY (teosluokka_id),
UNIQUE (luokka)
);

CREATE TABLE kuuluuluokkaan (              -- UUSI TAULU!!!!!!!!!!
teos_id INT, 
teosluokka_id INT,
PRIMARY KEY (teos_id, teosluokka_id),
FOREIGN KEY (teos_id) REFERENCES teos,
FOREIGN KEY (teosluokka_id) REFERENCES teosluokka
);

CREATE TABLE teostyyppi(                     -- MUUTETTU, UUSI
teostyyppi_id INT,
tyyppi VARCHAR(15),
PRIMARY KEY (teostyyppi_id),
UNIQUE (tyyppi)
);

CREATE TABLE kuuluutyyppiin (              -- UUSI TAULU!!!!!!!!!!
teos_id INT, 
teostyyppi_id INT,
PRIMARY KEY (teos_id, teostyyppi_id),
FOREIGN KEY (teos_id) REFERENCES teos,
FOREIGN KEY (teostyyppi_id) REFERENCES teostyyppi
);




CREATE TABLE divari (
divari_id SERIAL,
nimi VARCHAR(20) NOT NULL,
osoite VARCHAR(20),
web_sivu VARCHAR(20),
oma_tietokanta BOOLEAN NOT NULL,
PRIMARY KEY (divari_id),
UNIQUE (nimi)
);


CREATE TABLE nide (
nide_id SERIAL,									--Serial parempi
myyntihinta NUMERIC(8,2) NOT NULL,
niteen_tila VARCHAR(10) NOT NULL,               -- myynnissä, myyty, ...!? --vapaa/varattu
sisaanostohinta NUMERIC(8,2),
myyntipvm DATE NOT NULL,                      -- ???? voiko olla NOT NULL --Pitää olla null ennen kuin on myyty
tilaus_id INT,                      --Null kun nide ei liity vielä tilaukseen
teos_id INT NOT NULL,
divari_id INT NOT NULL,
PRIMARY KEY (nide_id),
FOREIGN KEY(tilaus_id) REFERENCES tilaus,
FOREIGN KEY(teos_id) REFERENCES teos,
FOREIGN KEY(divari_id) REFERENCES divari
);