PRAGMA foreign_keys = ON;

-- Database for handling questions

-- Tables:
-- users
-- questions
-- question_follows
-- replies
-- question_likes

DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER PRIMARY KEY ,
    fname VARCHAR(40),
    lname VARCHAR(40)
);

INSERT INTO
    users(fname, lname)
VALUES
    ('Liz', 'Lemon'),
    ('Kenneth', 'Parcel'),
    ('Jack', 'Donaghy'),
    ('Tracy', 'Jordan'),
    ('Jenna', 'Maroney')
;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT(255) NOT NULL,
    body TEXT,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    questions(title, user_id)
VALUES
        ('Why did you fire Pete?', (SELECT id FROM users WHERE fname = 'Liz')),
        ('Where is my tarantula?', (SELECT id FROM users WHERE fname ='Tracy'))
 ;


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

INSERT INTO
    replies(body, question_id, parent_id, user_id)
    VALUES
        ('Good god Lemon', (SELECT id FROM questions WHERE title = 'Why did you fire Pete?'), null, (SELECT id FROM users WHERE fname = 'Jack') ),

        ('On my head', (SELECT id FROM questions WHERE title = 'Where is my tarantula?'), null, (SELECT id FROM users WHERE fname = 'Kenneth'))
;

CREATE TABLE follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    follows(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Liz'),
    (SELECT id FROM questions WHERE title = 'Why did you fire Pete?')
);

CREATE TABLE likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    likes(user_id , question_id)
VALUES
    ((SELECT id FROM users WHERE fname='Tracy'),
    (SELECT id FROM questions WHERE title='Where is my tarantula?')
);
