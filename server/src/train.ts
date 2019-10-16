import * as faceapi from 'face-api.js';

import { canvas, faceDetectionNet } from './commons';

const REFERENCE_IMAGES = ['./Maksim.jpg', './Milana.jpg'];
const labels = ['Maksim', 'Milana'];

export async function train() {
  await faceDetectionNet.loadFromDisk('./weights')
  await faceapi.nets.faceLandmark68Net.loadFromDisk('./weights')
  await faceapi.nets.faceRecognitionNet.loadFromDisk('./weights')


  const labeledFaceDescriptors: faceapi.LabeledFaceDescriptors[] = [];
  let index = 0;
  for (let img of REFERENCE_IMAGES) {
    const referenceImage = await canvas.loadImage(img);
    const fullFaceDescription = await faceapi.detectSingleFace(referenceImage as any).withFaceLandmarks().withFaceDescriptor();
          
    if (!fullFaceDescription) {
      throw new Error(`no faces detected for ${labels[index]}`)
    }
    
    const faceDescriptors = [fullFaceDescription.descriptor];
    labeledFaceDescriptors.push(new faceapi.LabeledFaceDescriptors(labels[index], faceDescriptors));
    index++;
  }
  // REFERENCE_IMAGES.forEach(async (img, index) => {
  //       // labels.map(async label => {
          
  //         // detect the face with the highest score in the image and compute it's landmarks and face descriptor
  //         const fullFaceDescription = await faceapi.detectSingleFace(img as any).withFaceLandmarks().withFaceDescriptor()
          
  //         if (!fullFaceDescription) {
  //           throw new Error(`no faces detected for ${labels[index]}`)
  //         }
          
  //         const faceDescriptors = [fullFaceDescription.descriptor];
  //         labeledFaceDescriptors.push(new faceapi.LabeledFaceDescriptors(labels[index], faceDescriptors));
  //         // return new faceapi.LabeledFaceDescriptors(labels[index], faceDescriptors)
  //       // })
      
  // });
 

  const maxDescriptorDistance = 0.6
  const faceMatcher = new faceapi.FaceMatcher(labeledFaceDescriptors, maxDescriptorDistance)

  return faceMatcher;
}