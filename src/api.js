const DAO = require("./DAO.js");

function reservationsEndpoint(request, h) {
    return DAO.getReservations().then(reservations => ({data: reservations}));
}

module.exports = {
    reservationsEndpoint
};
