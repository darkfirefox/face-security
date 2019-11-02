import { FaceLandmarks } from 'face-api.js';

export interface UserModel {
    username: string,
    password: string,
    landmarks?: FaceLandmarks
}