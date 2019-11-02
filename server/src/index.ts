import { train } from './recognition/train';
import { processRecognition } from './recognition/recognition';
import { launchServer } from './server';
import { connect } from './database/db-service';
const interval = require('interval-promise');

async function startRecognition() {
  const faceMatcher = await train();
  interval(async () => await processRecognition(faceMatcher), 10000);
}

connect();
launchServer();
startRecognition();
