const db = require("../db/connection");

function getAllUser() {
  return db.query("select * from users").then((data) => {
    return data.rows;
  });
}

function createUser(user) {
  const values = [
    user.firstname,
    user.lastname,
    user.username,
    user.email,
    user.pass,
    user.platform,
    user.gamelist,
    user.avatarIcon,
  ];
  return db
    .query(
      "INSERT INTO users(firstname ,lastname, username, email, pass, platform, gamelist, avatarIcon) VALUES($1, $2, $3,$4, $5, $6, $7, $8)  returning *",
      values
    )
    .then((result) => {
      return result.rows;
    });
}

function deluser(id) {
  return db.query(`DELETE FROM users WHERE id = ($1)`, [id]).then((result) => {
    return result;
  });
}

function getUser(email) {
  const values = [email];
  return db.query("select * from users where email=$1", values).then((data) => {
    if (!data.rows.length)
      throw new Error(`No user with email '${email}' found`);
    return data.rows[0];
  });
}

function getUserById(id) {
  const values = [id];
  return db.query("select * from users where id=$1", values).then((data) => {
    if (!data.rows.length) throw new Error(`No user with id '${id}' found`);
    return data.rows[0];
  });
}

function getUserByUsername(username) {
  return db
    .query("SELECT * FROM users WHERE username=$1", [username])
    .then((user) => {
      if (!user.rows.length)
        throw new Error(`No user with username '${username}' found`);
      return user.rows[0];
    });
}
// Update Functions Handlers
function updateUsername(id, username) {
  return db
    .query("UPDATE users SET username=$1 WHERE id=$2 RETURNING *", [
      username,
      id,
    ])
    .then((user) => {
      return user.rows[0];
    });
}
function updateAvatarImg(id, avatarIcon) {
  return db
    .query("UPDATE users SET avatarIcon=$1 WHERE id=$2 RETURNING *", [
      avatarIcon,
      id,
    ])
    .then((user) => {
      return user.rows[0];
    });
}
function updateEmail(id, email) {
  return db
    .query("UPDATE users SET email=$1 WHERE id=$2 RETURNING *", [email, id])
    .then((user) => {
      return user.rows[0];
    });
}
function updatePlatforms(id, platform) {
  return db
    .query("UPDATE users SET platform=$1 WHERE id=$2 RETURNING *", [
      platform,
      id,
    ])
    .then((user) => {
      return user.rows[0];
    });
}

function updateGamesList(id, games) {
  return db
    .query("UPDATE users SET gamelist=$1 WHERE id=$2 RETURNING *", [games, id])
    .then((user) => {
      return user.rows[0];
    });
}
function updatePassword(id, pass) {
  return db
    .query("UPDATE users SET pass=$1 WHERE id=$2 RETURNING *", [pass, id])
    .then((user) => {
      return user.rows[0];
    });
}
module.exports = {
  updatePlatforms,
  createUser,
  getUser,
  getUserById,
  getUserByUsername,
  getAllUser,
  deluser,
  updateUsername,
  updateEmail,
  updateGamesList,
  updatePassword,
  updateAvatarImg,
};
