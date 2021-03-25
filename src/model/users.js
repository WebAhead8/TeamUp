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
  ];
  return db
    .query(
      "INSERT INTO users(firstname ,lastname, username, email, pass, platform, gamelist) VALUES($1, $2, $3,$4, $5, $6, $7)  returning *",
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

function updateUser(id, newUser) {
  const values = [
    id,
    newUser.firstname,
    newUser.lastname,
    newUser.username,
    newUser.pass,
    newUser.email,
    newUser.platform,
    newUser.gamelist,
  ];
  return {
    db: query("select * from users where id=$1", values).then((data) => {
      if (!data.rows.length) throw new Error(`No user with id '${id}' found`);
      return data.rows[0];
    }),
    db: query(
      "INSERT INTO users(firstname ,lastname, username, email, pass, platform, gamelist) VALUES($1, $2, $3,$4, $5, $6, $7)",
      values
    ),
  };
  const filter = (user) => user.id === parseInt(id);
  return db.update("users", newUser, filter);
}

module.exports = {
  createUser,
  getUser,
  getUserById,
  getUserByUsername,
  updateUser,
  getAllUser,
  deluser,
};
