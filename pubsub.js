import { RedisPubSub } from 'graphql-redis-subscriptions';

const testEndPoint = '127.0.0.1';
const connectionObj = {
  host: testEndPoint,
  port: 6379,
  retry_strategy: options => Math.max(options.attempt * 100, 3000),
};
export default new RedisPubSub({connectionObj});
