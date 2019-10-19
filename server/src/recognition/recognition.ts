import { FaceMatcher } from 'face-api.js';
import * as faceapi from 'face-api.js';
import { canvas, faceDetectionOptions, saveFile } from '../commons';
const config = require('../config.json');

export async function processRecognition(faceMatcher: FaceMatcher) {
  console.log("start");
  console.log(new Date());
  //  const queryImage = await canvas.loadImage(`${config.url}/shot.jpg`);
   const queryImage = await canvas.loadImage('Maksim_test.jpg');
    const resultsQuery = await faceapi.detectAllFaces(queryImage as any, faceDetectionOptions)
      .withFaceLandmarks()
      .withFaceDescriptors();
  
    const queryDrawBoxes = resultsQuery.map(res => {
      const bestMatch = faceMatcher.findBestMatch(res.descriptor);
      if (bestMatch.label === "unknown") console.error("UNKNOWN PERSON"); 
      return new faceapi.draw.DrawBox(res.detection.box, { label: bestMatch.toString() });
    })
    console.log("end");
    console.log(new Date());
    const outQuery = faceapi.createCanvasFromMedia(queryImage as any);
    queryDrawBoxes.forEach(drawBox => drawBox.draw(outQuery));
    saveFile('queryImage.jpg', (outQuery as any).toBuffer('image/jpeg'));
    console.log('done, saved results to out/queryImage.jpg');
}