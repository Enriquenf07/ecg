"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.knex = void 0;
const knexConfig = {
    client: 'pg',
    connection: {
        host: 'localhost',
        port: 5433,
        user: 'postgres',
        password: 'iac',
        database: 'iac'
    }
};
exports.knex = require('knex')(knexConfig);
