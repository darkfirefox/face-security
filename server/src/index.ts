import { launchServer } from './server';
import { connect } from './database/db-service';
import { startRecognition } from './recognition/recognition';
const interval = require('interval-promise');

async function start() {
  await connect();
  await launchServer();
  interval(startRecognition, 0);
}

start()