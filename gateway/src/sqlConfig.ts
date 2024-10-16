import { Knex } from 'knex';

const knexConfig: Knex.Config = {
  client: 'pg',
  connection: {
    host: process.env.DB_HOST,
    port: parseInt(process.env.DB_PORT || '5432'),
    user: process.env.DB_HOST,
    password: process.env.DB_HOST,
    database: process.env.DB_HOST
  }
};

export const knex: Knex = require('knex')(knexConfig);
