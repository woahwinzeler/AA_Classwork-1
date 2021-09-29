PRAGMA foreign_keys = ON;



DROP TABLE IF EXIST users
CREATE TABLE users ( 
  id INTEGER PRIMARY KEY,
  fname TEXT, 
  lname TEXT
);

DROP TABLE IF EXIST questions
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER, 
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXIST question_follows
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXIST replies
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  body TEXT,
  parent_id INTEGER,
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (body) REFERENCES questions(body),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXIST question_likes
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER, 

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO users(fname, lname)
VALUES ('Liam', 'Williams'), ('Jeff', 'Shin');

INSERT INTO questions(title, body, author_id)
VAlUES ('Problems', 'I have a problem.', (SELECT id FROM users))