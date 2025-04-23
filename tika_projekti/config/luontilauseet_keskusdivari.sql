/* 
Työssä ei toteuteta varsinaisesti eri tietokantoja divareille, 
vaan yksittäiselle divarille ja keskusdivarille pitää
muodostaa oma kaavio/skeema (osatietokanta).
*/





/* 

DROP SCHEMA keskusdivari CASCADE;

SET SEARCH_PATH TO public;
SHOW SEARCH_PATH;

*/

CREATE SCHEMA keskusdivari;
SET SEARCH_PATH TO keskusdivari;

CREATE TABLE asiakas (
asiakas_id SERIAL PRIMARY KEY,
etunimi VARCHAR(15) NOT NULL,
sukunimi VARCHAR(20) NOT NULL,
katuosoite VARCHAR(20),
postinumero INT,
postitoimipaikka VARCHAR(10),
email VARCHAR(30) NOT NULL,
puhelin VARCHAR(15),
salasana VARCHAR(20) NOT NULL,
rooli VARCHAR(20) NOT NULL
);


CREATE TABLE tilaus (
tilaus_id SERIAL PRIMARY KEY,
tilauspvm DATE NOT NULL DEFAULT CURRENT_DATE,  
asiakas_id INT NOT NULL,
FOREIGN KEY(asiakas_id) REFERENCES asiakas
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



CREATE TABLE divari (
divari_id INT,
nimi VARCHAR(20) NOT NULL,
osoite VARCHAR(20),
web_sivu VARCHAR(20),
oma_tietokanta BOOLEAN NOT NULL,
PRIMARY KEY (divari_id),
UNIQUE (nimi)
);


CREATE TABLE nide (
nide_id SERIAL PRIMARY KEY, 
myyntihinta NUMERIC(8,2) NOT NULL,
niteen_tila VARCHAR(10) NOT NULL,               
sisaanostohinta NUMERIC(8,2),
myyntipvm DATE DEFAULT CURRENT_DATE,          
tilaus_id INT,                                  
teos_id INT NOT NULL,
divari_id INT NOT NULL,
FOREIGN KEY(tilaus_id) REFERENCES tilaus,
FOREIGN KEY(teos_id) REFERENCES teos,
FOREIGN KEY(divari_id) REFERENCES divari
);
