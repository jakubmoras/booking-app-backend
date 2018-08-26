'use strict';

const Hapi = require('hapi');
const api = require('./src/api');
const DAO = require('./src/DAO');

const server = Hapi.server({
    port: 3000,
    host: 'localhost'
});

server.route({
    method: 'GET',
    path: '/',
    handler: api.mainHandler
});

server.start().then(() => {
    console.log(`Server running at: ${server.info.uri}`);
});

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});
