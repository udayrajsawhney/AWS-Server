import formatErrors from '../formatErrors';
import requiresAuth from '../permissions';

export default {
  Query: {
    getTeamMembers: requiresAuth.createResolver(async (parent, { teamId }, { models }) =>
      models.sequelize.query(
        'select * from users as u join members as m on m.userId = u.id where m.teamId = ?',
        {
          replacements: [teamId],
          model: models.User,
          raw: true,
        },
      )),
  },
  Mutation: {
    addTeamMember: requiresAuth.createResolver(async (parent, { email, teamId }, { models, user }) => {
      try {
        const memberPromise = models.Member.findOne(
          { where: { teamId, userId: user.id } },
          { raw: true },
        );
        const userToAddPromise = models.User.findOne({ where: { email } }, { raw: true });
        const [member, userToAdd] = await Promise.all([memberPromise, userToAddPromise]);
        if (!member.admin) {
          return {
            ok: false,
            errors: [{ path: 'email', message: 'You cannot add members to the team' }],
          };
        }
        if (!userToAdd) {
          return {
            ok: false,
            errors: [{ path: 'email', message: 'Could not find user with this email' }],
          };
        }
        await models.Member.create({ userId: userToAdd.id, teamId });
        return {
          ok: true,
        };
      } catch (err) {
        console.log(err);
        return {
          ok: false,
          errors: formatErrors(err, models),
        };
      }
    }),
    createTeam: requiresAuth.createResolver(async (parent, args, { models, user }) => {
      try {
        const response = await models.sequelize.transaction(async (transaction) => {
          const team = await models.Team.create({ ...args }, { transaction });
          await models.Channel.create(
            { name: 'general', public: true, teamId: team.id },
            { transaction },
          );
          await models.Member.create(
            { teamId: team.id, userId: user.id, admin: true },
            { transaction },
          );
          return team;
        });
        return {
          ok: true,
          team: response,
        };
      } catch (err) {
        console.log(err);
        return {
          ok: false,
          errors: formatErrors(err, models),
        };
      }
    }),
  },
  Team: {
    channels: ({ id }, args, { models, user }) =>
      models.sequelize.query(
        `
    select *
    from channels as c 
    left outer join pcmembers as pc 
    on c.id = pc.channelId
    where c.teamId = :teamId and (c.public = true or pc.userId = :userId);`,
        {
          replacements: { teamId: id, userId: user.id },
          model: models.Channel,
          raw: true,
        },
      ),
    directMessageMembers: ({ id }, args, { models, user }) =>
      models.sequelize.query(
        'select distinct u.id, u.username from users as u join direct_messages as dm on (u.id = dm.senderId) or (u.id = dm.receiverId) where (:currentUserId = dm.senderId or :currentUserId = dm.receiverId) and dm.teamId = :teamId',
        {
          replacements: { currentUserId: user.id, teamId: id },
          model: models.User,
          raw: true,
        },
      ),
  },
};
