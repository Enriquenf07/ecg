import { Knex } from 'knex';

const knexConfig: Knex.Config = {
  client: 'pg',
  connection: {
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT || '5432'),
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '123',
    database: process.env.DB_DATABASE || 't01'
  },
  pool: {
    min: 2,
    max: 10,
  },
};

export const knex: Knex = require('knex')(knexConfig);
