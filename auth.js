import jwt from 'jsonwebtoken';
import _ from 'lodash';
import { verify as verifyToken } from 'jsonwebtoken';

export const createTokens = async (user, secret, secret2) => {
  const createToken = jwt.sign(
    {
      user: _.pick(user, ['id', 'username']),
    },
    secret,
    {
      expiresIn: '1h',
    },
  );

  const createRefreshToken = jwt.sign(
    {
      user: _.pick(user, 'id'),
    },
    secret2,
    {
      expiresIn: '7d',
    },
  );
console.log(createToken);
  return [createToken, createRefreshToken];
};

export const refreshTokens = async (token, refreshToken, models, SECRET, SECRET2) => {
  let userId = 0;
  try {
    const { user: { id } } = jwt.decode(refreshToken);
    userId = id;
  } catch (err) {
    return {};
  }

  if (!userId) {
    return {};
  }

  const user = await models.User.findOne({ where: { id: userId }, raw: true });

  if (!user) {
    return {};
  }

  const refreshSecret = user.password + SECRET2;

  try {
    jwt.verify(refreshToken, refreshSecret);
  } catch (err) {
    return {};
  }

  const [newToken, newRefreshToken] = await createTokens(user, SECRET, refreshSecret);
  return {
    token: newToken,
    refreshToken: newRefreshToken,
    user,
  };
};

export const tryLogin = async (token, models, SECRET, SECRET2) => {
  let decoded;
  let masterId;
  try {
      decoded = verifyToken(token, SECRET);
      console.log(decoded.id);
      masterId=decoded.id;
  } catch(e) {
      res.send(e)
  }

  const user = await models.User.findOne({ where: { masterId : masterId }, raw: true });

  if (!user) {
    // user with provided email not found
    return {
      ok: false,
      token:masterId,
      errors: [{ path: 'email', message: 'Wrong email or Email not registered!' }],
    };
  }

  const refreshTokenSecret = user.password + SECRET2;

  const [newtoken, refreshToken] = await createTokens(user, SECRET, refreshTokenSecret);

  return {
    ok: true,
    token: newtoken,
    refreshToken: refreshToken,
  };
};
