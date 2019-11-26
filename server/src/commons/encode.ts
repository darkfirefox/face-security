import * as bcrypt from 'bcrypt';

export async function cryptPassword(password: string) {
    const salt = await bcrypt.genSalt(10);
    return await bcrypt.hash(password, salt);
};

export async function comparePassword(first: string, second: string) {
    return await bcrypt.compare(first, second);
};