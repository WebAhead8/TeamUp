const db = require("../db/connection");

function getAvatarImg() {
  return db.query("SELECT * FROM avatarImg");
}

module.exports = { getAvatarImg };
