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
function getMenuEndpoint(request, h) {
    return DAO.getMenu().then(data => {
        return data
        // todo map table fields names for variable
    });
}

function getReservationsExtrasEndpoint(request, h) {
    const extrasCategory = request.params['extrasCategory'];
    return DAO.getReservationExtras(extrasCategory).catch( err=> (console.error(err)));
}

module.exports = {
    getReservationsEndpoint,
    postReservationEndpoint,
    getMenuEndpoint,
    getReservationsExtrasEndpoint
};
