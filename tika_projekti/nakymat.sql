
/* 
NÄKYMÄT
*/

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- R1: Anna haun tulokset, jotka toteuttavat annetut kriteerit (ks. hakutoiminnot). 


-- R1basic
CREATE VIEW keskusdivari.R1basic AS
  SELECT keskusdivari.teos.teos_id, keskusdivari.teos.nimi, keskusdivari.teos.tekija, keskusdivari.teos.vuosi, 
         keskusdivari.teos.isbn, keskusdivari.nide.myyntihinta, keskusdivari.divari.nimi AS divarinimi, 
         keskusdivari.nide.nide_id
  FROM keskusdivari.teos, keskusdivari.nide, keskusdivari.divari 
  WHERE keskusdivari.teos.teos_id = keskusdivari.nide.teos_id AND 
        keskusdivari.nide.divari_id = keskusdivari.divari.divari_id AND
        keskusdivari.nide.niteen_tila = 'myynnissä'; 

-- R1basicluokka
CREATE VIEW keskusdivari.R1basicluokka AS
  SELECT keskusdivari.teos.teos_id, keskusdivari.teosluokka.luokka
  FROM keskusdivari.teos, keskusdivari.kuuluuluokkaan, keskusdivari.teosluokka
  WHERE keskusdivari.kuuluuluokkaan.teosluokka_id = keskusdivari.teosluokka.teosluokka_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluuluokkaan.teos_id;

-- R1basictyyppi
CREATE VIEW keskusdivari.R1basictyyppi AS
  SELECT keskusdivari.teos.teos_id, keskusdivari.teostyyppi.tyyppi
  FROM keskusdivari.teos, keskusdivari.kuuluutyyppiin, keskusdivari.teostyyppi
  WHERE keskusdivari.kuuluutyyppiin.teostyyppi_id = keskusdivari.teostyyppi.teostyyppi_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluutyyppiin.teos_id;

--R1luokkahaku
CREATE VIEW keskusdivari.R1luokkahaku AS
  SELECT keskusdivari.teos.teos_id, keskusdivari.teos.nimi, keskusdivari.teos.tekija, keskusdivari.teos.vuosi, 
         keskusdivari.teos.isbn, keskusdivari.nide.myyntihinta, keskusdivari.divari.nimi AS divarinimi,
         keskusdivari.teosluokka.luokka, keskusdivari.nide.nide_id
  FROM keskusdivari.teos, keskusdivari.nide, keskusdivari.divari, keskusdivari.kuuluuluokkaan, keskusdivari.teosluokka
  WHERE keskusdivari.teos.teos_id = keskusdivari.nide.teos_id AND 
        keskusdivari.nide.divari_id = keskusdivari.divari.divari_id AND
        keskusdivari.kuuluuluokkaan.teosluokka_id = keskusdivari.teosluokka.teosluokka_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluuluokkaan.teos_id AND
        keskusdivari.nide.niteen_tila = 'myynnissä'; 

--R1tyyppihaku
CREATE VIEW keskusdivari.R1tyyppihaku AS
  SELECT keskusdivari.teos.teos_id, keskusdivari.teos.nimi, keskusdivari.teos.tekija, keskusdivari.teos.vuosi, 
         keskusdivari.teos.isbn, keskusdivari.nide.myyntihinta, keskusdivari.divari.nimi AS divarinimi,
         keskusdivari.teostyyppi.tyyppi, keskusdivari.nide.nide_id
  FROM keskusdivari.teos, keskusdivari.nide, keskusdivari.divari, keskusdivari.kuuluutyyppiin, keskusdivari.teostyyppi
  WHERE keskusdivari.teos.teos_id = keskusdivari.nide.teos_id AND 
        keskusdivari.nide.divari_id = keskusdivari.divari.divari_id AND
        keskusdivari.kuuluutyyppiin.teostyyppi_id = keskusdivari.teostyyppi.teostyyppi_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluutyyppiin.teos_id AND
        keskusdivari.nide.niteen_tila = 'myynnissä'; 



-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- R2: Ryhmittele myynnissä olevat teokset niiden luokan mukaan. Anna luokkien teosten kokonaismyyntihinta 
-- sekä keskihinta. 
CREATE VIEW keskusdivari.R2 AS
  SELECT keskusdivari.teos.nimi, keskusdivari.teosluokka.luokka, keskusdivari.nide.myyntihinta
  FROM keskusdivari.teos, keskusdivari.kuuluuluokkaan, keskusdivari.teosluokka, keskusdivari.nide
  WHERE keskusdivari.kuuluuluokkaan.teosluokka_id = keskusdivari.teosluokka.teosluokka_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluuluokkaan.teos_id AND
        keskusdivari.teos.teos_id = keskusdivari.nide.teos_id AND
        keskusdivari.nide.niteen_tila = 'myynnissä'; 

CREATE VIEW keskusdivari.R2all AS
  SELECT keskusdivari.teos.nimi, keskusdivari.teosluokka.luokka, keskusdivari.nide.myyntihinta,
       keskusdivari.nide.niteen_tila
  FROM keskusdivari.teos, keskusdivari.kuuluuluokkaan, keskusdivari.teosluokka, keskusdivari.nide
  WHERE keskusdivari.kuuluuluokkaan.teosluokka_id = keskusdivari.teosluokka.teosluokka_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluuluokkaan.teos_id AND
        keskusdivari.teos.teos_id = keskusdivari.nide.teos_id;





-- -----------------------------------------------------------

SELECT *
FROM keskusdivari.R2;


SELECT R2.luokka, COUNT(*) AS lkm, SUM(R2.myyntihinta), ROUND (AVG(R2.myyntihinta),2) AS avg
FROM keskusdivari.R2
GROUP By R2.luokka
ORDER BY 2 DESC;

--
SELECT *
FROM keskusdivari.R2all;


SELECT R2all.luokka, SUM(R2all.myyntihinta), ROUND (AVG(R2all.myyntihinta),2) AS avg
FROM keskusdivari.R2all
WHERE keskusdivari.R2all.niteen_tila = 'myynnissä'
GROUP By R2all.luokka
ORDER BY 2 DESC;






