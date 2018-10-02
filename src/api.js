const DAO = require("./DAO.js");

function getReservationsEndpoint(request, h) {
    return DAO.getReservations().then(data => {
        return data.map(row => ({
            id: row['Id'],
            eventType: row['Event_General_Type'],
            eventDetailType: row['Event_Detail_Type'],
            roomType: row['Room_Type'],
            comment: row['Comment'],
            time: row['Time']
        }));
    });
}

function postReservationEndpoint(request, h) {
    return DAO.insertReservation(request.payload).then(() => {
        return h.response().code(201);
    }).catch(err => {
        return h.response().code(412);
    });
}

module.exports = {
    getReservationsEndpoint,
    postReservationEndpoint
};
