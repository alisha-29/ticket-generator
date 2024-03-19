-- Inserting into author table
INSERT INTO author (id, name) VALUES (1, 'James Bond');

-- Inserting into user table
INSERT INTO "user" (id, name) VALUES (1, 'User1');
INSERT INTO "user" (id, name) VALUES (2, 'User2');
INSERT INTO "user" (id, name) VALUES (3, 'User3');

-- Inserting into post table
INSERT INTO post (id, name, authorid, createdts) VALUES (1, 'First Post', 1, CURRENT_TIMESTAMP);

-- Inserting into comment table
INSERT INTO comment (id, content, postid, createdts, userid) VALUES (1, 'Nice post!', 1, CURRENT_TIMESTAMP, 1);
INSERT INTO comment (id, content, postid, createdts, userid) VALUES (2, 'Great job!', 1, CURRENT_TIMESTAMP, 2);
INSERT INTO comment (id, content, postid, createdts, userid) VALUES (3, 'I agree.', 1, CURRENT_TIMESTAMP, 3);



--------QUERY----------------
WITH LatestComments AS (
    SELECT c.postid,
           c.content,
           c.createdts,
           ROW_NUMBER() OVER (PARTITION BY c.postid ORDER BY c.createdts DESC) AS rn
    FROM comment c
             JOIN post p ON c.postid = p.id
             JOIN author a ON p.authorid = a.id
             JOIN "user" u ON c.userid = u.id
    WHERE a.name = 'James Bond'
)
SELECT p.id AS post_id,
       p.name AS post_name,
       a.name AS author_name,
       lc.content AS latest_comment_content,
       lc.createdts AS latest_comment_createdts
FROM post p
         JOIN author a ON p.authorid = a.id
         JOIN LatestComments lc ON p.id = lc.postid
WHERE lc.rn <= 10;
