const errorMessage = 'Not authenticated'
const createResolver = (resolver) => {
  const baseResolver = resolver;
  baseResolver.createResolver = (childResolver) => {
    const newResolver = async (parent, args, context, info) => {
      await resolver(parent, args, context, info);
      return childResolver(parent, args, context, info);
    };
    return createResolver(newResolver);
  };
  return baseResolver;
};

function checkUser(user) {
  if (!user || !user.id) {
    throw new Error('Not authenticated');
  }
}

// requiresAuth
export default createResolver((parent, args, { user }) => {
  checkUser(user);
});

export const requiresTeamAccess = createResolver(async (parent, { channelId }, { user, models }) => {
  checkUser(user);
  // check if part of the team
  const channel = await models.Channel.findOne({ where: { id: channelId } });
  const member = await models.Member.findOne({
    where: { teamId: channel.teamId, userId: user.id },
  });
  if (!member) {
    throw new Error("You have to be a member of the team to subcribe to it's messages");
  }
});

export const directMessageSubscription = createResolver(async (parent, { teamId, userId }, { user, models }) => {
  checkUser(user);

  const members = await models.Member.findAll({
    where: {
      teamId,
      [models.sequelize.Op.or]: [{ userId }, { userId: user.id }],
    },
  });

  if (members.length !== 2) {
    throw new Error('Something went wrong');
  }
});
