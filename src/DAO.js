const pg = require('pg');
const config = {
    user: 'web_client',
    password: 'web_client123',
    database: 'booking_db',
    port: '5432'
};

const client = new pg.Client(config);

client.connect()
    .then(() => {
        console.log('connected to database');
    })
    .catch(err => {
        console.log('Exception on connecting to database', err);
    });

// Build a function on top of that

client.query('SELECT * FROM bookingapp.main_reservations')
    .then(result => {
        console.log(result.rows)
    });
