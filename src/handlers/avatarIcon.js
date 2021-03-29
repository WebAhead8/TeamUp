const avatarModel = require("../model/avatarImg");

function getAvatarImg(req, res, next) {
  avatarModel
    .getAvatarImg()
    .then((allAvatarImg) => {
      res.send(allAvatarImg.rows);
    })
    .catch(next);
}

module.exports = {
  getAvatarImg,
};
