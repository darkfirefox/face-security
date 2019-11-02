import { subscribeToNotifications, unsubscribeFromNotifications } from '../notification';
import { findByNameAndPassword } from '../database/db-service';

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