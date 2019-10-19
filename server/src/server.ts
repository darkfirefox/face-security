import express = require('express');

// Create a new express application instance
const app: express.Application = express();

app.post('/login', function (req, res) {
  res.send('Hello World!');
});

app.put('/pushToken', () => {});

app.post('/signUp', () => {});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});




// pushToken() {

// }

