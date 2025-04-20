const http = require('http');
const fs = require('fs');
const path = require('path');
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const { v4: uuid } = require('uuid');
const hostname = '192.168.4.115';
const port = 8160; //vaihda porttinumero!
//const hostname = 'localhost';
//const port = 3000; //vaihda porttinumero!

const app = express();

// ---------------------------!!!!!!!!!!!!!!!!!!!!!
const { engine } = require('express-handlebars');

app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
//app.set('views', './views');

const sql = require(__dirname + '/sql/sqlcommands');
// ---------------------------!!!!!!!!!!!!!!!!!!!!!




const ERROR_EMAIL_MISSING = 'Sähköposti vaaditaan!';
const ERROR_PASSWORD_MISSING = 'Salasana vaaditaan!';
const EMAIL_NOT_FOUND = 'Sähköpostia ei löytynyt. Tarkista sähköposti tai rekisteröidy.';
const INCORRECT_PASSWORD = 'Väärä salasana';
const ADMIN_ONLY = 'Kirjaudu ylläpitäjänä päästäksesi tälle sivulle';
const DIVARI_NOT_FOUND = 'Divaria ei löytynyt tietokannasta';
const DIVARI_NAME_MISSING = 'Divarin nimi vaaditaan!';
const ISBN_MISSING = 'ISBN vaaditaan!';
const TEOS_NAME_MISSING = 'Teoksen nimi vaaditaan!';
const AUTHOR_MISSING = 'Kirjoittaja vaaditaan!';
const TYYPPI_MISSING = 'Kirjan tyyppi vaaditaan!';
const LUOKKA_MISSING = 'Kirjan luokka vaaditaan!';
const WEIGHT_MISSING = 'Kirjan paino vaaditaan!';
const BUYPRICE_MISSING = 'Kirjan ostohinta vaaditaan!';
const SELLPRICE_MISSING = 'Kirjan myyntihinta vaaditaan!';



//Set up body-parser. This will accept POST data and append them to the req object
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); //this will also accept JSON from the tests

app.use(session({
    secret: 'my-super-secret-key',
    resave: false,
    saveUninitialized: true
}));

function usersOnly(req, res, next) {
    //Happy path, the request may pass through
    if(req.session && req.session.user) return next();

    //Unhappy path, the request is intercepted and rejected
    return res.redirect('/login');
}

function adminsOnly(req, res, next) {
    //Happy path, the request may pass through
    if(req.session && req.session.user.role === 'admin') return next();

    //Unhappy path, the request is intercepted and rejected
    req.session.errors = [ADMIN_ONLY]
    return res.redirect('/login');
}

//postgresql testailua               // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
const { Client } = require('pg');
const client = new Client({
	//user: '',
    user: process.env.DATABASE_NAME,
	password: process.env.DATABASE_PASSWORD,
	//host: 'tie-tkannat.it.tuni.fi',
    host: 'localhost',
	port: '5432',
	database: process.env.DATABASE_NAME,
});


client
	.connect()
	.then(() => {
		console.log('Connected to PostgreSQL database');
	})
	.catch((err) => {
		console.error('Error connecting to PostgreSQL database', err);
	});


//client.query('SET SEARCH_PATH TO keskusdivari')          // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// client.query('SELECT * FROM testi', (err, result) => {
//     if (err) {
//         console.error('Error executing query', err);
//     } else {
//         console.log('Query result:', result.rows);
//     }
//     });

app.get('/register2', (req, res) => {
    console.log("moimoiget")
    console.log(req.body)
});

app.post('/register2', async (req, res) => {
    console.log("moimoipost")
    console.log(req.body)

    let errors = [];

    const { email, password, etunimi, sukunimi, osoite, kaupunki, postinumero, puh} = req.body;
    const newUser = { email, password, etunimi, sukunimi, osoite, kaupunki, postinumero, puh}

    const ERROR_NAME_MISSING = 'Name is required!';
    //const ERROR_EMAIL_MISSING = 'Email is required!';
    //const ERROR_PASSWORD_MISSING = 'Password is required!';
    const ERROR_EMAIL_IN_USE = 'Email is already in use!';
    //if(name.length === 0){
    if(!newUser.etunimi || newUser.etunimi.trim() === ''){
        console.log("moi")
        errors.push(ERROR_NAME_MISSING)
        //req.session.errors = [ERROR_EMAIL_IN_USE]
    }
    if(!newUser.sukunimi || newUser.sukunimi.trim() === ''){
        console.log("moi")
        errors.push(ERROR_NAME_MISSING)
        //req.session.errors = [ERROR_EMAIL_IN_USE]
    }
    if(!newUser.email || newUser.email.trim() === ''){
        errors.push(ERROR_EMAIL_MISSING)
    }
    if(!newUser.password || newUser.password.trim() === ''){
        errors.push(ERROR_PASSWORD_MISSING)
    }

    // client
	// .connect()
	// .then(() => {
	// 	console.log('Connected to PostgreSQL database register');
	// })
	// .catch((err) => {
	// 	console.error('Error connecting to PostgreSQL database register', err);
	// });

    var last_id;
    try {
        const emails = await client.query('SELECT asiakas_id, email FROM asiakas')
        console.log('Query result:', emails.rows);
        //Jos ei ole yhtään rekisteröitynyttä käyttäjää
        console.log(emails.rows.length)
        if(emails.rows.length == 0){
            last_id = 0;
        }else{
            console.log(emails.rows[emails.rows.length - 1]);
            last_id = emails.rows[emails.rows.length - 1]['asiakas_id']
        }
        for(const row of emails.rows) {
            if(row['email'] == email){
                errors.push(ERROR_EMAIL_IN_USE)
                req.session.errors = [ERROR_EMAIL_IN_USE]
                return res.redirect('/register')
            }
        };
    }catch (err){
        console.error(err);
    }
    // finally{
    //     await client.end()
    // }

    if(errors.length > 0) {
        req.session.errors = errors
        return res.redirect('/register')
    }
    console.log(last_id)
    try {
        const result = await client.query(
            `INSERT INTO asiakas (asiakas_id, etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puhelin, salasana, rooli) VALUES (${last_id + 1}, '${etunimi}', '${sukunimi}', '${osoite}', ${postinumero}, '${kaupunki}', '${email}', '${puh}', '${password}', 'user')`)
        console.log('Query result:', result);
    }catch (err){
        console.error(err);
        errors.push(err)
        req.session.errors = errors
        return res.redirect('/register')
    }
    // finally{
    //     await client.end()
    // }

    //Generate a unique id for the new user, you can use uuid()
    user_id = uuid()

    newUser.role = "user"

    req.session.user = newUser;

    return res.redirect('/main')
})


app.get('/', (req, res) => {
    fs.readFile(path.resolve('frontpage.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage);
        }
        res.end();
    });
});

app.get('/register', (req, res) => {
    const errors = req.session.errors || [];
    delete req.session.errors;
    console.log(errors);

    fs.readFile(path.resolve('register.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage + errors);
        }
        res.end();
    });
});

app.post('/login', async (req, res) => {
    client.query('SET SEARCH_PATH TO keskusdivari')   // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


    let errors = [];

    const { email, password } = req.body;
    const user = { email, password}

    console.log(req.body)
    
    if(!user.email || user.email.trim() === ''){
        errors.push(ERROR_EMAIL_MISSING)
    }
    if(!user.password || user.password.trim() === ''){
        errors.push(ERROR_PASSWORD_MISSING)
    }

    if(errors.length > 0) {
        req.session.errors = errors
        return res.redirect('/login')
    }

    // client
	// .connect()
	// .then(() => {
	// 	console.log('Connected to PostgreSQL database login');
	// })
	// .catch((err) => {
	// 	console.error('Error connecting to PostgreSQL database login', err);
	// });

    //var password_correct = false;
    var email_found = false;
    var role
    try {
        const emails_n_users = await client.query('SELECT email, salasana, rooli FROM asiakas')
        console.log('Query result:', emails_n_users.rows);

        for(const row of emails_n_users.rows) {
            if(row['email'] == email){
                console.log(row['salasana']);
                console.log(password);

                if(row['salasana'] != password){
                    errors.push(INCORRECT_PASSWORD)
                    req.session.errors = [INCORRECT_PASSWORD]
                    return res.redirect('/login')
                }
                //errors.push(ERROR_EMAIL_IN_USE)
                //req.session.errors = [ERROR_EMAIL_IN_USE]
                email_found = true;
                role = row['rooli']
            }
        };
    }catch (err){
        console.error(err);
    }
    // finally{
    //     await client.end()
    // }
    // await client.end()


    if(!email_found){
        errors.push(EMAIL_NOT_FOUND)
        req.session.errors = [EMAIL_NOT_FOUND]
        return res.redirect('/login')
    }

    user_id = uuid()

    if(role == 'admin'){
        user.role = "admin"
    }else{
        user.role = "user"
    }
    //user.role = "user"

    req.session.user = user;

    return res.redirect('/main')
})

app.get('/login', (req, res) => {
    const errors = req.session.errors || [];
    delete req.session.errors;
    console.log(errors);

    fs.readFile(path.resolve('login.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage + errors);
        }
        res.end();
    });


});

app.post('/add_books', async (req, res) => {
    console.log("----------------")
    let errors = [];
    console.log(req.body);
    var {dnimi, nimi, isbn, tekija, tyyppi_id, luokka_id, paino, ohinta, mhinta} = req.body;
    //const book = { nimi, isbn, tekija, tyyppi, luokka, paino, ohinta, mhinta}
    console.log(dnimi, nimi, isbn, tekija, tyyppi_id, luokka_id, paino, ohinta, mhinta);


    ohinta = parseFloat(ohinta);
    mhinta = parseFloat(mhinta);
    //tyyppi_id = parseInt(tyyppi_id);
    //luokka_id = parseInt(luokka_id);
    console.log(tyyppi_id, luokka_id);

    if(!dnimi || dnimi.trim() === ''){
        errors.push(DIVARI_NAME_MISSING)
    }
    if(!isbn || isbn.trim() === ''){
        errors.push(ISBN_MISSING)
    }
    if(ohinta <= 0){
        errors.push(BUYPRICE_MISSING)
    }
    if(mhinta <= 0){
        errors.push(SELLPRICE_MISSING)
    }
    // if(!ohinta || ohinta.trim() === ''){
    //     errors.push(BUYPRICE_MISSING)
    // }
    // if(!mhinta || mhinta.trim() === ''){
    //     errors.push(SELLPRICE_MISSING)
    // }

    console.log(dnimi)
    console.log(req.body)

    if(errors.length > 0) {
        req.session.errors = errors
        return res.redirect('/add_books')
    }

    var divari_oma_kanta;
    var divari_found = false;
    var divari_id;

    try {
        const divarit = await client.query('SELECT divari_id, nimi, oma_tietokanta FROM divari')
        console.log('Query result:', divarit.rows);
        for(const row of divarit.rows) {
            if(row['nimi'] == dnimi){
                divari_found = true;
                divari_oma_kanta = row['oma_tietokanta']
                divari_id = row['divari_id']
            }
        };
    }catch (err){
        console.error(err);
    }

    console.log(divari_oma_kanta)
    console.log(divari_found)

    if(!divari_found){
        errors.push(DIVARI_NOT_FOUND)
        req.session.errors = errors
        return res.redirect('/add_books')
    }

    if(divari_oma_kanta){
        client.query('SET SEARCH_PATH TO d1')
    }

    var isbn_found = false;
    var teos_id;
    try {
        
        const books = await client.query('SELECT teos_id, isbn FROM teos')
        console.log('Query result:', books.rows);
        for(const row of books.rows) {
            console.log(row);
            console.log("forloop");
            console.log(row['teos_id']);
            console.log(row['isbn']);
            if(row['isbn'] == isbn){
                console.log("iffi");
                isbn_found = true;
                teos_id = row['teos_id'];
            }
        };
    }catch (err){
        console.error(err);
    }

    if(isbn_found){
        //Teoksen isbn oli jo tietokannassa. Täytyy lisätä vain nide
        try {
            const result = await client.query(
                `INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, teos_id, divari_id) VALUES (${mhinta}, 'vapaa', '${ohinta}', '${teos_id}', ${divari_id})`)
            console.log('Query result:', result);
        }catch (err){
            console.error(err);
            errors.push(err)
            req.session.errors = errors
            return res.redirect('/add_books')
        }
    }else{
        //Teoksen isbn:ää ei ollut tietokannassa. Täytyy lisätä teos ja nide tietokantaan
        //Tarkistetaan onko annettu luokka, tyyppi, tekijä, paino
        if(luokka_id <= 0){
            errors.push(LUOKKA_MISSING)
        }
        if(tyyppi_id <= 0){
            errors.push(TYYPPI_MISSING)
        }
        if(!tekija || tekija.trim() === ''){
            errors.push(BUYPRICE_MISSING)
        }
        if(!paino || paino.trim() === ''){
            errors.push(WEIGHT_MISSING)
        }

        if(errors.length > 0) {
            req.session.errors = errors
            if(divari_oma_kanta){
                client.query('SET SEARCH_PATH TO keskusdivari')
            }
            return res.redirect('/add_books')
        }

        //Lisätään teos
        var inserted_teos_id;
        try {
            console.log(nimi, tekija, isbn, paino, luokka_id, tyyppi_id);
            const result = await client.query(
                `INSERT INTO teos (nimi, tekija, isbn, paino, luokka_id, tyyppi_id) VALUES ('${nimi}', '${tekija}', '${isbn}', '${paino}', '${luokka_id}', ${tyyppi_id}) RETURNING teos_id`)
            console.log('Query result:', result);
            inserted_teos_id = result.rows[0]['teos_id']
        }catch (err){
            console.error(err);
            errors.push(err)
            req.session.errors = errors
            return res.redirect('/add_books')
        }
        
        //Lisätään teos luokka ja tyyppi tauluihin
        try {
            const luokkaresult = await client.query(
                `INSERT INTO kuuluuluokkaan (teos_id, teosluokka_id) VALUES (${inserted_teos_id}, ${luokka_id}) RETURNING teos_id`)
            console.log('Query result:', luokkaresult);
            const tyyppiresult = await client.query(
                `INSERT INTO kuuluutyyppiin (teos_id, teostyyppi_id) VALUES (${inserted_teos_id}, '${tyyppi_id}') RETURNING teos_id`)
            console.log('Query result:', tyyppiresult);
            }catch (err){
            console.error(err);
            errors.push(err)
            req.session.errors = errors
            return res.redirect('/add_books')
        }

        //Lisätään nide
        try {
            const result = await client.query(
                `INSERT INTO nide (myyntihinta, niteen_tila, sisaanostohinta, teos_id, divari_id) VALUES (${mhinta}, 'vapaa', '${ohinta}', '${inserted_teos_id}', ${divari_id})`)
            console.log('Query result:', result);
        }catch (err){
            console.error(err);
            errors.push(err)
            req.session.errors = errors
            return res.redirect('/add_books')
        }

        if(divari_oma_kanta){
            client.query('SET SEARCH_PATH TO keskusdivari')
        }

    }

    errors.push("Kirja lisätty onnistuneesti");
    req.session.errors = errors

    return res.redirect('/add_books')
})



app.get('/add_books', adminsOnly, (req, res) => {
    const errors = req.session.errors || [];
    delete req.session.errors;
    console.log(errors);
    fs.readFile(path.resolve('add_books.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage + errors);
        }
        res.end();
    });
});






app.get('/main', usersOnly, (req, res) => {
    fs.readFile(path.resolve('main.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage);
        }
        res.end();
    });
});

//app.get('/adminstate1', usersOnly, (req, res) => {
app.get('/adminstate1', adminsOnly, (req, res) => {
    res.status(200);
    res.render('adminHome');
});






app.get('/search', usersOnly, (req, res) => {
    res.status(200);
    res.render('searchHome');
    /*
    fs.readFile(path.resolve('search.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage);
        }
        res.end();
    });
    */
});


app.post('/search', usersOnly, async (req, res) => {    
    let data = [];

    let hakusana = req.body.hakutermi;
    let hakukohde = req.body.radAnswer;

    try {
        client.query('SET SEARCH_PATH TO keskusdivari')   

        hakusana = '%' + hakusana + '%'
        const text = sql[hakukohde]
        const values = [hakusana]
        const result = await client.query(text, values) 
        data = result.rows;  

        const luokat = await client.query( sql["luokat"] ) 
        const tyypit = await client.query( sql["tyypit"] ) 

        for (let i = 0; i < data.length; i++) {
            temp_luokat = [];
            temp_tyypit = [];

            for (let j = 0; j < luokat.rows.length; j++) {   
              if (data[i].teos_id == luokat.rows[j].teos_id) {
                temp_luokat.push(luokat.rows[j].luokka)
              } 
            }         
            data[i].luokat = temp_luokat;

            for (let j = 0; j < tyypit.rows.length; j++) {        
              if (data[i].teos_id == tyypit.rows[j].teos_id) {
                 temp_tyypit.push(tyypit.rows[j].tyyppi)
              } 
            }           
            data[i].tyypit = temp_tyypit;
        } 
      
        res.status(200);
        //res.json(data);
        res.render('basicSearch', {tiedot: data } );  

    }catch (err){
        console.error(err);
        console.log(err);
        //res.json(data);
        // res.render('searchHome');   !!!!!!!!!!!!! 
    }
});


//app.get('/raport', usersOnly, (req, res) => {
app.get('/raport', adminsOnly, (req, res) => {
    res.render('raportHome');  

});

//app.get('/raport1', usersOnly, async (req, res) => {    
app.get('/raport1', adminsOnly, async (req, res) => {    
    let data = [];

    try {
        client.query('SET SEARCH_PATH TO keskusdivari')   

        const text = sql["R2raport1"]
        const result = await client.query(text) 
        data = result.rows;  

        res.status(200);
        //res.json(data);
        res.render('raport1', {tiedot: data } );  

    }catch (err){
        console.error(err);
        console.log(err);
        //res.json(data);
        // res.render('searchHome');   !!!!!!!!!!!!! 
    }
});


app.get('/order', usersOnly, (req, res) => {                  // POST!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // lisätään tkhaku!


    res.status(200);
    res.render('orderHome');  
    /*
    fs.readFile(path.resolve('order.html'), function(error, htmlPage) {
        if (error) {
            res.writeHead(404);
            res.write('An error occured: ', error);
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(htmlPage);
        }
        res.end();
    });
    */
});







app.post('/logout', (req, res) => {
    req.session.destroy();

    return res.redirect('/login');
});


app.listen(port, function () {
    console.log(
        `server is running on port ${port}`
    );
})


