import * as faceapi from 'face-api.js';

import { canvas, faceDetectionNet } from '../commons';
import { getAllUsers } from '../database/db-service';
import { FaceMatcher } from 'face-api.js';

export async function train() {
  await faceDetectionNet.loadFromDisk('./weights')
  await faceapi.nets.faceLandmark68Net.loadFromDisk('./weights')
  await faceapi.nets.faceRecognitionNet.loadFromDisk('./weights')


  const labeledFaceDescriptors: faceapi.LabeledFaceDescriptors[] = [];
  const users = await getAllUsers();
  for (let user of users) {
    let points;
    if (user.landmarks) {
      points = getPointsArray(user.landmarks as unknown as Float32Array);
      labeledFaceDescriptors.push(new faceapi.LabeledFaceDescriptors(user.username, points));

    }
  }

  if (labeledFaceDescriptors.length) {
    const maxDescriptorDistance = 0.6;
    return new faceapi.FaceMatcher(labeledFaceDescriptors, maxDescriptorDistance);
  } else {
    console.log("There are no face descriptors!");
    return null;
  }
}

function getPointsArray(points: any): any {
  const result: any | never[] | number[] = [];
  points.forEach((point: any) => result.push(point as any));
  return result;
}