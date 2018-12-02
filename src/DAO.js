const db = require('./db.js');
const _ = require('lodash');

function getReservations() {
    return db.getClient().then(client => {
        return client.query('SELECT * FROM bookingapp.main_reservations').then(result => {
            client.end();
            return result.rows;
        });
    });
}

function insertReservation(reservation) {
    return db.getClient().then(client => {
        const query = 'INSERT INTO bookingapp.main_reservations("Event_General_Type", "Event_Detail_Type", "Room_Type", "Time", "Comment")' +
            ' VALUES($1, $2, $3, $4, $5)';
        const values = _.chain(reservation)
            .pick(['eventGeneralType', 'eventDetailType', 'roomType', 'time', 'comment'])
            .values()
            .value();
        values.Time = new Date(reservation.Time);
        return client.query(query, values).then(result => {
            client.end();
            return result.rows;
        });
    });
}

function getMenu() {
    return db.getClient().then(client => {
        return client.query('select * from bookingapp."dishes"').then(result => {
            client.end();
            return result.rows;
        });
    });

}

function getReservationExtras(category) {
    return db.getClient().then(client => {
        return client.query('SELECT * FROM bookingapp.reservation_extras where "Category" = $1',[category]).then(result => {
            client.end();
            return result.rows;
        });
    });
}

module.exports = {
    getReservations,
    insertReservation,
    getMenu,
    getReservationExtras
};
