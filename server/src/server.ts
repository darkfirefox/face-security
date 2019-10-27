import express = require('express');
import { subscribeToNotifications, sendNotification } from './notification';
const bodyParser = require('body-parser');

// Create a new express application instance
const app: express.Application = express();
let token;
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());

app.post('/login', (req: any, res) => {
  console.log("Login");
  console.log(req.body);

  res.sendStatus(200);
});

app.put('/pushToken', async (req: any, res) => {
  console.log("Tokens");
  console.log(req.body);
  token = req.body.token;
  await subscribeToNotifications(token);
  setInterval(() => {
    sendNotification({
      notification: {
        title: 'Best title ever',
        body: 'zachem ya exist?'
      }
    });
  }, 10000);

  res.sendStatus(200);
});

app.post('/signUp', (req, res) => {
  res.send("Not supported yet");
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
