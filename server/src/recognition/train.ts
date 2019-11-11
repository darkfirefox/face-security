import * as faceapi from 'face-api.js';

import { canvas, faceDetectionNet } from '../commons';
import { getAllUsers } from '../database/db-service';
import { FaceMatcher, LabeledFaceDescriptors } from 'face-api.js';

export async function train() {
  await faceDetectionNet.loadFromDisk('./weights')
  await faceapi.nets.faceLandmark68Net.loadFromDisk('./weights')
  await faceapi.nets.faceRecognitionNet.loadFromDisk('./weights')


  const labeledFaceDescriptors: faceapi.LabeledFaceDescriptors[] = [];
  const users = await getAllUsers();
  for (let user of users) {
    if (user.faceDescriptors) {
      labeledFaceDescriptors.push(new LabeledFaceDescriptors(user.username,
        [Float32Array.from(user.faceDescriptors)]));

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
