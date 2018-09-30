const pg = require('pg');
const config = require('../config.js');

function getClient() {
    const client = new pg.Client(config.db);
    return client.connect()
        .then(() => {
            console.log('Connected to database');
            return client;
        })
        .catch(err => {
            console.log('Exception on connecting to database', err);
        });
}

module.exports = {
    getClient
};
