module.exports = {
    db: {
        host: process.env.DB_HOST || 'localhost',
        user: 'web_client',
        password: 'web_client123',
        database: 'booking_db',
        port: '5432'
    }
};
