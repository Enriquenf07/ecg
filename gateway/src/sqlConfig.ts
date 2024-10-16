import { Knex } from 'knex';

const knexConfig: Knex.Config = {
  client: 'pg',
  connection: {
    host: 'localhost',
    port: 5432,
    user: 'root',
    password: 'umc',
    database: 't01'
  }
};

export const knex: Knex = require('knex')(knexConfig);
