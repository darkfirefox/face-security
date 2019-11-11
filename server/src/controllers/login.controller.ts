import { subscribeToNotifications, unsubscribeFromNotifications } from '../notification';
import { findByNameAndPassword, findByName, registerUser } from '../database/db-service';
import { IncomingForm, Fields, Files } from 'formidable';
import { needTrain, detectFaceDescriptors } from '../recognition/recognition';
import { FaceLandmarks } from 'face-api.js';

export async function login(req: any, res: any) {
    const username = req.body.username;
    const password = req.body.password;
    console.log(`Try to login with username: ${username} and password: ${password};`);
    const user = await findByNameAndPassword(username, password);
    if (user === null) {
        res.sendStatus(404);
    } else {
        res.sendStatus(200);
    }
}

export async function pushToken(req: any, res: any) {
    const token = req.body.token;
    await subscribeToNotifications(token);
    res.sendStatus(200);
}

export async function logout(req: any, res: any) {
    const token = req.body.token;
    await unsubscribeFromNotifications(token);
    res.sendStatus(200);
}

export async function registration(req: any, res: any) {
    const form = new IncomingForm();
 
    form.parse(req, async (err: any, fields: Fields, files: Files) => {
        const username = fields.username
        const foundName = await findByName(username as string);
        if (foundName) {
            res.sendStatus(500); // User with such name is already exists
        } else {
           
            const faceDescriptors = await detectFaceDescriptors(files.file.path)
            const user = {
                username: username as string,
                password: fields.password as string,
                faceDescriptors: Array.prototype.slice.call(faceDescriptors) 
            }
            await registerUser(user);
            needTrain();
        }

        res.sendStatus(200);
    });    
    // console.log(parsed);
    
}