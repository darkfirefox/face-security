import { launchServer } from './server';
import { connect } from './database/db-service';
import { startRecognition } from './recognition/recognition';
const interval = require('interval-promise');

async function start() {
  await connect();
  await launchServer();
  interval(async () => await startRecognition(), 10000);
}

start();