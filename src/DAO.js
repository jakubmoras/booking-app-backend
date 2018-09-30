const db = require('./db.js');

function getReservations() {
    return db.getClient().then(client => {
        return client.query('SELECT * FROM bookingapp.main_reservations').then(result => {
            client.end();
            return result.rows;
        });
    });
}

module.exports = {
    getReservations
};
