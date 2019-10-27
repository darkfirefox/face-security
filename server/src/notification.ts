import admin = require("firebase-admin");
const serviceAccount = require("../security_keys.json");
import { topic } from './commons/message';

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://face-security-c74c7.firebaseio.com"
});


export async function subscribeToNotifications(registrationTokens: string | string[]) {
    const response = await admin.messaging().subscribeToTopic(registrationTokens, topic);
    console.log(response);
}

export async function sendNotification(message: admin.messaging.Message | any) {
    if (!message.topic) {
        message.topic = topic;
    }
    const response = await admin.messaging().send(message)
    console.log(response);
}
