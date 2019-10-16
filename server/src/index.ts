import { train } from './train';
import { processRecognition } from './recognition';
const interval = require('interval-promise');

async function run() {
  const faceMatcher = await train();
  interval(async () => await processRecognition(faceMatcher), 500);
}

run()
