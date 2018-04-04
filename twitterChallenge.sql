CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  twitter_handle TEXT UNIQUE
 );

 CREATE TABLE tweets(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id)
 );

 CREATE TABLE activity(
  follower INTEGER,
  following INTEGER
 );

 INSERT INTO users(twitter_handle)
 VALUES ('@zpaterson');

 INSERT INTO users(twitter_handle)
 VALUES ('@smcueto');

 INSERT INTO users(twitter_handle)
 VALUES ('@lianThompson');

 INSERT INTO users(twitter_handle)
 VALUES ('@taleaCarpenter');


INSERT INTO tweets(user_id, message)
VALUES
      (
        (SELECT id
         FROM users
         WHERE twitter_handle = '@smcueto'),
         '#brah'
       ),
      (
        (SELECT id
         FROM users
         WHERE twitter_handle = '@lianThompson'),
         'What is the sky?'
       ),
      (
        (SELECT id
         FROM users
         WHERE twitter_handle = '@taleaCarpenter'),
         'Catch me performing at #lights in SF!'
       ),
      (
         (SELECT id
         FROM users
         WHERE twitter_handle = '@zpaterson'),
         'Matcha is gold!'
       );



INSERT INTO activity(follower, following)
VALUES
(
 (SELECT id
   FROM users
   WHERE twitter_handle = '@zpaterson'
 ),
 (SELECT id
   FROM users
   WHERE twitter_handle = '@lianThompson'
 )
);
