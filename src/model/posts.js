const db = require("../db/connection");

function getAllPosts() {
  return db.query("SELECT * FROM posts");
}

function addNewPost(newPost) {
  return db.query(
    "INSERT INTO posts (username, content, liked) VALUES ($1,$2,$3)",
    [newPost.username, newPost.content, newPost.liked]
  );
}

function deletePost(id) {
  return db.query("DELETE FROM posts WHERE id = $1", [id]);
}

module.exports = { getAllPosts, addNewPost, deletePost };
