import * as dotenv from 'dotenv'
import { registerAs } from '@nestjs/config';
dotenv.config()

export default registerAs('server', () => ({
  port: parseInt(process.env.PORT, 10) || 3008,
  NODE_ENV: process.env.NODE_ENV,
  PROFILE : process.env.PROFILE,
}));
