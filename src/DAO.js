const pg = require('pg');
const config = require('../config.js');

const client = new pg.Client(config);

function connect() {
    return client.connect()
        .then(() => {
            console.log('Connected to database');
        })
        .catch(err => {
            console.log('Exception on connecting to database', err);
        });
}

function getReservations() {
    return client.query('SELECT * FROM bookingapp.main_reservations').then(result => result.rows);
}

// TODO refactor it!
connect();

module.exports = {
    connect,
    getReservations
};
