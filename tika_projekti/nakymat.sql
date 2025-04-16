
/* 
NÄKYMÄT
*/

CREATE VIEW teos_tyyppi_luokka AS
  SELECT teos.nimi, teos.tekija, teos.vuosi, teos.isbn, 
         tyyppi, teosluokka.luokka
  FROM teos, kuuluuluokkaan, teosluokka, kuuluutyyppiin, teostyyppi
  WHERE kuuluuluokkaan.teosluokka_id = teosluokka.teosluokka_id AND
        teos.teos_id = kuuluuluokkaan.teos_id AND
        kuuluutyyppiin.teostyyppi_id = teostyyppi.teostyyppi_id AND
        teos.teos_id = kuuluutyyppiin.teos_id;








--HAKUTULOS(TEOKSEN_NIMI, ISBN, TEKIJÄ, TYYPPI, LUOKKA, HINTA)

CREATE VIEW keskusdivari.teos_tyyppi_luokka AS
  SELECT keskusdivari.teos.nimi, keskusdivari.teos.tekija, keskusdivari.teos.vuosi, keskusdivari.teos.isbn, 
         keskusdivari.teostyyppi.tyyppi, keskusdivari.teosluokka.luokka
  FROM keskusdivari.teos, keskusdivari.kuuluuluokkaan, keskusdivari.teosluokka, 
       keskusdivari.kuuluutyyppiin, keskusdivari.teostyyppi
  WHERE keskusdivari.kuuluuluokkaan.teosluokka_id = keskusdivari.teosluokka.teosluokka_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluuluokkaan.teos_id AND
        keskusdivari.kuuluutyyppiin.teostyyppi_id = keskusdivari.teostyyppi.teostyyppi_id AND
        keskusdivari.teos.teos_id = keskusdivari.kuuluutyyppiin.teos_id;



-- gddfgdfggdfg
CREATE VIEW keskusdivari.nide_hinta_paino_divari AS
  SELECT keskusdivari.teos.nimi, keskusdivari.teos.tekija, keskusdivari.teos.vuosi, 
         keskusdivari.teos.paino, keskusdivari.nide.myyntihinta, keskusdivari.divari.nimi AS divarinimi
  FROM keskusdivari.teos, keskusdivari.nide, keskusdivari.divari 
  WHERE keskusdivari.teos.teos_id = keskusdivari.nide.teos_id AND 
        keskusdivari.nide.divari_id = keskusdivari.divari.divari_id AND
        keskusdivari.nide.niteen_tila = 'myynnissä'; 




-- zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz

SELECT *
FROM keskusdivari.teos_tyyppi_luokka;

SELECT *
FROM keskusdivari.nide_hinta_paino_divari;


-- haku teoksen nimen mukaan
SELECT keskusdivari.teos_tyyppi_luokka.nimi, keskusdivari.teos_tyyppi_luokka.tekija,
       keskusdivari.teos_tyyppi_luokka.vuosi, keskusdivari.teos_tyyppi_luokka.isbn
FROM keskusdivari.teos_tyyppi_luokka
WHERE keskusdivari.teos_tyyppi_luokka.nimi LIKE '%ja%';





