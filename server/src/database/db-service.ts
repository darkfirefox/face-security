import { MongoClient, Db } from "mongodb";
import { UserModel } from './user.model';
import { cryptPassword, comparePassword } from '../commons/encode';

const mongoOptions = {
    useUnifiedTopology: true
}

const url = require('../../config.json').dbUrl;
const usersCollection = 'users';

let db: Db;
let connection: MongoClient;
export async function connect() {
    connection = await MongoClient.connect(url, mongoOptions);
    db = connection.db();
    console.log('Database connected');
}

export async function close() {
    await connection.close();
    console.log('Database closed');
}

export async function registerUser(user: UserModel) {
    console.log(`Try to register new user`);
    user.password = await cryptPassword(user.password);
    return await db.collection(usersCollection).insertOne(user);
}

export async function findByName(username: string) {
    console.log(`Try to find user with name ${username}`);
    return await db.collection(usersCollection).findOne({
        username: username
    });
}

export async function findByNameAndPassword(username: string, password: string) {
    console.log(`Try to find user with name ${username} and password ${password}`);
    const user =  await db.collection(usersCollection).findOne({
        username: username
    });
    const comparing = comparePassword(password, user.password);
    if (comparing) {
        return user;
    } else {
        return null;
    }
}

export async function getAllUsers(): Promise<UserModel[]> {
    console.log('Try to get all users');
    return db.collection(usersCollection).find({}).toArray();
}