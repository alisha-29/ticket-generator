
DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
                         id INT PRIMARY KEY,
                         content VARCHAR(1000),
                         postid INT,
                         createdts TIMESTAMP NOT NULL,
                         userid INT,
                         FOREIGN KEY (postid) REFERENCES post(id),
                         FOREIGN KEY (userid) REFERENCES "user"(id)
);

DROP TABLE IF EXISTS post;
CREATE TABLE post (
                      id INT PRIMARY KEY,
                      name VARCHAR(100),
                      authorid INT,
                      createdts TIMESTAMP NOT NULL,
                      FOREIGN KEY (authorid) REFERENCES author(id)
);

DROP TABLE IF EXISTS author;
CREATE TABLE author (
                        id INT PRIMARY KEY,
                        name VARCHAR(100)
);

DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
                        id INT PRIMARY KEY,
                        name VARCHAR(100)
);



