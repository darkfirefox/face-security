import { train } from './recognition/train';
import { processRecognition } from './recognition/recognition';
const interval = require('interval-promise');

async function run() {
  const faceMatcher = await train();
  interval(async () => await processRecognition(faceMatcher), 500);
}

run()
