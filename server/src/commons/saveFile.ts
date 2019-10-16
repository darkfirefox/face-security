import {existsSync, mkdirSync, writeFileSync} from 'fs';
import * as path from 'path';

const baseDir = path.resolve(__dirname, '../out')

export function saveFile(fileName: string, buf: Buffer) {
  if (!existsSync(baseDir)) {
    mkdirSync(baseDir)
  }

  writeFileSync(path.resolve(baseDir, fileName), buf)
}