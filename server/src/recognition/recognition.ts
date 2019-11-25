import { FaceMatcher } from 'face-api.js';
import * as faceapi from 'face-api.js';
const interval = require('interval-promise');
import { canvas, faceDetectionOptions, saveFile } from '../commons';
import { sendNotification } from '../notification';
import { train } from './train';
const config = require('../../config.json');

let isTrainNeeded = true;
let faceMatcher: any;

export async function processRecognition(faceMatcher: FaceMatcher) {
  console.log("start");
  const queryImage = await canvas.loadImage(`${config.url}/shot.jpg`);
  // const queryImage = await canvas.loadImage('Maksim_Milana.jpg');
  const resultsQuery = await faceapi.detectAllFaces(queryImage as any, faceDetectionOptions)
    .withFaceLandmarks()
    .withFaceDescriptors();

  const queryDrawBoxes = resultsQuery.map(res => {
    const bestMatch = faceMatcher.findBestMatch(res.descriptor);
    if (bestMatch.label === "unknown")
      sendNotification({
        data: {
          title: 'notification_title_string',
          body: 'notification_message_string'
        },notification : {
          title_loc_key : 'notification_title_string',
          body_loc_key: 'notification_message_string',
          content_available : true,
          priority : 'high'
        }
      });
    return new faceapi.draw.DrawBox(res.detection.box, { label: bestMatch.toString() });
  })
  console.log("end");
  const outQuery = faceapi.createCanvasFromMedia(queryImage as any);
  queryDrawBoxes.forEach(drawBox => drawBox.draw(outQuery));
  saveFile('queryImage.jpg', (outQuery as any).toBuffer('image/jpeg'));
}

export async function detectFaceDescriptors(path: string) {
  const image = await canvas.loadImage(path);
  return await faceapi.computeFaceDescriptor(image as any);
}

export async function startRecognition() {
  console.log("Start recognition");
  if (isTrainNeeded) {
    console.log("Start training");
    faceMatcher = await train();
    isTrainNeeded = false;
  }
  if (faceMatcher) {
    await processRecognition(faceMatcher);
  }
}

export function needTrain() {
  console.log("Set need training");
  isTrainNeeded = true;
}