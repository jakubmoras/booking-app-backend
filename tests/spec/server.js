const expect = require('chai').expect;
const http = require('http-as-promised');
const _ = require('lodash');
const serverAddr = 'http://localhost:3000/';

describe('HTTP Server', () => {

    describe('GET reservations endpoint', () => {

        const response = {};

        before(() => {
            return http.get(serverAddr + 'reservations').spread((httpResponse, body) => {
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

    describe('GET menu endpoint', () => {

        const response = {};

        before(() => {
            return http.get(serverAddr + 'menu').spread((httpResponse, body) => {
                response.statusCode = httpResponse.statusCode;
                response.body = JSON.parse(body);
            });
        });

        it('should response with HTTP status code 200', () => {
            expect(response.statusCode).to.be.equal(200);
        });

        it('should response with array of menu objects', () => {
            const expectedMenuItem = {
                Id: 1,
                Restaurant_Id: '1',
                Category_Id: '1',
                Dish_Name: 'Krewetki',
                Dish_Description: 'Krewetki',
                Dish_Price: '30',
                Split_allowed: true,
                Qty_on_plate: '3'
            };
            expect(response.body).to.be.an('array').that.is.not.empty;
            expect(response.body[0]).to.be.an('object');
            expect(response.body[0]).to.be.eql(expectedMenuItem);
        });
    });
});
