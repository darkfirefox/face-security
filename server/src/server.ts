import express = require('express');
import { login, pushToken, logout, registration } from './controllers/login.controller';
const bodyParser = require('body-parser');
const port = require('../config.json');
// Create a new express application instance
const app: express.Application = express();

export function launchServer() {
  app.use(bodyParser.urlencoded({
    extended: true
  }));
  app.use(bodyParser.json());

  app.post('/login', login);

  app.put('/pushToken', pushToken);

  app.post('/signUp', registration);

  app.post('/logout', logout);

  app.listen(3000, () => {
    console.log(`Face security app listening on port ${port}!`);
  });

}

