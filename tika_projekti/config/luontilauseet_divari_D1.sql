

/*
Perusratkaisussa rajoitutaan kahteen yksittäiseen divariin D1
(Lassen lehti) ja D2 (Galleinn Galle). 
Divari D1 käyttää omaa tietokantaa, mutta siitä kopio
keskustietokannassa. D2 käyttää vain keskusdivarin tietokantaa. 
Toisin sanoen työssä pitää toteuttaa vähintään kaksi kaavioita
*/



/* 

DROP SCHEMA D1 CASCADE;

SET SEARCH_PATH TO public;
SHOW SEARCH_PATH;

*/
CREATE SCHEMA D1;
SET SEARCH_PATH TO D1;


CREATE TABLE tilaus (
tilaus_id SERIAL PRIMARY KEY,
tilauspvm DATE NOT NULL DEFAULT CURRENT_DATE
--asiakas_id INT NOT NULL,
--FOREIGN KEY(asiakas_id) REFERENCES asiakas
);


CREATE TABLE lahetys (
lahetys_id SERIAL PRIMARY KEY,
toimituspvm DATE NOT NULL DEFAULT CURRENT_DATE,  
tilaus_id INT NOT NULL,
FOREIGN KEY(tilaus_id) REFERENCES tilaus
);

CREATE TABLE postikulut (
postikulu_id INT,
paino INT NOT NULL,
hinta NUMERIC(5,2) NOT NULL,                       
PRIMARY KEY (postikulu_id)
);

CREATE TABLE teos (
teos_id SERIAL PRIMARY KEY,
nimi VARCHAR(60) NOT NULL,             
tekija VARCHAR(25),                       
vuosi INT,
isbn VARCHAR(15),
paino INT NOT NULL
);

CREATE TABLE teosluokka(                  
teosluokka_id SERIAL PRIMARY KEY,                       
luokka VARCHAR(15) NOT NULL,              
UNIQUE (luokka)
);

CREATE TABLE kuuluuluokkaan (              
teos_id INT, 
teosluokka_id INT,
PRIMARY KEY (teos_id, teosluokka_id),
FOREIGN KEY (teos_id) REFERENCES teos,
FOREIGN KEY (teosluokka_id) REFERENCES teosluokka
);

CREATE TABLE teostyyppi(                     
teostyyppi_id SERIAL PRIMARY KEY, 
tyyppi VARCHAR(15),
UNIQUE (tyyppi)
);

CREATE TABLE kuuluutyyppiin (            
teos_id INT, 
teostyyppi_id INT,
PRIMARY KEY (teos_id, teostyyppi_id),
FOREIGN KEY (teos_id) REFERENCES teos,
FOREIGN KEY (teostyyppi_id) REFERENCES teostyyppi
);


CREATE TABLE nide (
nide_id SERIAL PRIMARY KEY, 
myyntihinta NUMERIC(8,2) NOT NULL,
niteen_tila VARCHAR(10) NOT NULL,               
sisaanostohinta NUMERIC(8,2),
myyntipvm DATE DEFAULT CURRENT_DATE,          
tilaus_id INT,                                  
teos_id INT NOT NULL,
--divari_id INT NOT NULL,
FOREIGN KEY(tilaus_id) REFERENCES tilaus,
FOREIGN KEY(teos_id) REFERENCES teos
-- FOREIGN KEY(divari_id) REFERENCES divari
);


