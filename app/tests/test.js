const request = require('supertest');
const app = require('../src/app-v1');  // Test v1; swap for v2

describe('App Tests', () => {
  it('should return hello', (done) => {
    request(app).get('/').expect(200).end(done);
  });
});