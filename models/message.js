export default (sequelize, DataTypes) => {
  const Message = sequelize.define(
    'message',
    {
      text: DataTypes.STRING,
      url: DataTypes.STRING,
      filetype: DataTypes.STRING,
    },
    {
      indexes: [
        {
          fields: ['createdAt'],
        },
      ],
    },
  );

  Message.associate = (models) => {
    // 1:M
    Message.belongsTo(models.Channel, {
      foreignKey: 'channelId',
    });
    Message.belongsTo(models.User, {
      foreignKey: 'userId',
    });
  };

  return Message;
};
