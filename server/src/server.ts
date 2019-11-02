import express = require('express');
import { login, pushToken, logout } from './controllers/login.controller';
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

  app.post('/signUp', (req, res) => {
    res.send("Not supported yet");
  });

  app.post('/logout', logout);

  app.listen(port, () => {
    console.log(`Face security app listening on port ${port}!`);
  });

}

