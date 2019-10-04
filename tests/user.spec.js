import axios from 'axios';
import { XMLHttpRequest } from 'xmlhttprequest';
const testUrl = 'http://10.0.49.122:8081/graphql';
global.XMLHttpRequest = XMLHttpRequest;

describe('user resolvers', () => {
  test('allUsers', async () => {
    const response = await axios.post(testUrl, {
      query: `
      query {
        allUsers {
          id
          username
          email
        }
      }
      `,
    });

    const { data } = response;
    expect(data).toMatchObject({
      data: {
        allUsers: [],
      },
    });
  });

  test('create team', async () => {
    const response = await axios.post(testUrl, {
      query: `
      mutation {
        register(username: "testuser", email: "testuser@testuser.com", password: "tester") {
          ok
          errors {
            path
            message
          }
          user {
            username
            email
          }
        }
      }
      `,
    });

    const { data } = response;
    expect(data).toMatchObject({
      data: {
        register: {
          ok: true,
          errors: null,
          user: {
            username: 'testuser',
            email: 'testuser@testuser.com',
          },
        },
      },
    });

    const response2 = await axios.post(testUrl, {
      query: `
      mutation {
        login(email: "testuser@testuser.com", password: "tester") {
          token
          refreshToken
        }
      }
      `,
    });

    const { data: { login: { token, refreshToken } } } = response2.data;

    const response3 = await axios.post(
      testUrl,
      {
        query: `
      mutation {
        createTeam(name: "team1") {
          ok
          team {
            name
          }
        }
      }
      `,
      },
      {
        headers: {
          'x-token': token,
          'x-refresh-token': refreshToken,
        },
      },
    );

    expect(response3.data).toMatchObject({
      data: {
        createTeam: {
          ok: true,
          team: {
            name: 'team1',
          },
        },
      },
    });
  });
});
