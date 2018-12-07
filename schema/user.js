// CRUD
// Create
// Read
// Update
// Delete

export default `

  type User {
    id: Int!
    username: String!
    email: String!
    teams: [Team!]!
    masterId: Int!
  }

  type Query {
    me: User!
    allUsers: [User!]!
    getUser(userId: Int!): User
  }

  type RegisterResponse {
    ok: Boolean!
    user: User
    errors: [Error!]
  }

  type LoginResponse {
    ok: Boolean!
    token: String
    refreshToken: String
    errors: [Error!]
  }

  type Mutation {
    register(username: String!, email: String!, password: String!, masterId: Int!): RegisterResponse!
    login(token: String!): LoginResponse!
  }

`;
