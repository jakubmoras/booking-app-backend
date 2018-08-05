'use strict';

const Hapi = require('hapi');

const server = Hapi.server({
    port: 3000,
    host: 'localhost'
});

server.route({
    method: 'GET',
    path: '/',
    handler: function (request, h) {
        return {test: "Hello world"};
    }
});

server.start().then(() => {
    console.log(`Server running at: ${server.info.uri}`);
});

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});
