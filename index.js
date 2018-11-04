'use strict';

const Hapi = require('hapi');
const api = require('./src/api');

// TODO pull out cors setting from server.route

const server = Hapi.server({
    port: 3000,
    host: 'localhost'
});

server.route({
    method: 'GET',
    path: '/reservations',
    handler: api.getReservationsEndpoint,
    options: {
        cors: true
    }
});


server.route({
    method: 'POST',
    path: '/reservation',
    handler: api.postReservationEndpoint,
    options: {
        cors: true
    }
});

server.route({
    method: 'GET',
    path: '/menu',
    handler: api.getMenuEndpoint,
    options: {
        cors: true
    }
});

server.start().then(() => {
    console.log(`Server running at: ${server.info.uri}`);
});

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});
