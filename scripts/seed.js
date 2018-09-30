'use strict';

const db = require('../src/db');
const fs = require('fs');

const SEED_FILE = 'db/schema.sql';

function seed() {
    const schema = fs.readFileSync(SEED_FILE).toString();
    return db.getClient().then(client => {
        return client.query(schema).then(() => client.end());
    }).then(() => {
        console.log('Database seed finished successfully');
    });
}

seed();
