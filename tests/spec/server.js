const expect = require('chai').expect;
const http = require('http-as-promised');
const _ = require('lodash');

describe('HTTP Server', () => {

    describe('GET reservations endpoint', () => {

        const response = {};

        before(() => {
            return http.get('http://localhost:3000/reservations').spread((httpResponse, body) => {
                response.statusCode = httpResponse.statusCode;
                response.body = JSON.parse(body);
            });
        });

        it('should response with HTTP status code 200', () => {
            expect(response.statusCode).to.be.equal(200);
        });

        it('should response with array of reservations objects', () => {
            expect(response.body).to.be.an('array').that.is.not.empty;
            expect(response.body[0]).to.be.an('object');
        });

    });
});
