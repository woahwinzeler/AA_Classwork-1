CREATE TABLE users ( 
  id INTEGER PRIMARY KEY,
  fname TEXT, 
  lname TEXT
)

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER, 
  FOREIGN KEY (author_id) REFERENCES users(id)
)

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
)

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  questions_id INTEGER,
  body TEXT,
  parent_id INTEGER,
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (body) REFERENCES questions(body),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
)