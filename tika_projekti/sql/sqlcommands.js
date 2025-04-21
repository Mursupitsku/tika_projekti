


const sqlCommands = {
    nimihaku: 'SELECT * FROM keskusdivari.R1basic WHERE keskusdivari.R1basic.nimi LIKE $1',
    tekijahaku: 'SELECT * FROM keskusdivari.R1basic WHERE keskusdivari.R1basic.tekija LIKE $1',
    luokat : "SELECT * FROM keskusdivari.R1basicluokka",
    tyypit : "SELECT * FROM keskusdivari.R1basictyyppi",
    luokkahaku: 'SELECT * FROM  keskusdivari.R1luokkahaku WHERE keskusdivari.R1luokkahaku.luokka LIKE $1',
    tyyppihaku: 'SELECT * FROM  keskusdivari.R1tyyppihaku WHERE keskusdivari.R1tyyppihaku.tyyppi LIKE $1',
    R2raport1: 'SELECT R2.luokka, COUNT(*) AS lkm, SUM(R2.myyntihinta), ROUND (AVG(R2.myyntihinta),2) AS avg FROM keskusdivari.R2 GROUP By R2.luokka ORDER BY 2 DESC;',
    R2raport1all: 'SELECT R2all.luokka, COUNT(*) AS lkm, SUM(R2all.myyntihinta), ROUND (AVG(R2all.myyntihinta),2) AS avg FROM keskusdivari.R2all GROUP By R2all.luokka ORDER BY 2 DESC;',
    nidehaku: 'SELECT * FROM keskusdivari.R1basic WHERE keskusdivari.R1basic.nide_id = $1;'
};

module.exports = sqlCommands;



