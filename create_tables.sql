CREATE TABLE Users ( 
    userID      INTEGER NOT NULL, 
    username    VARCHAR(20) NOT NULL, 
    PASSWORD    VARCHAR(50) NOT NULL, 
    email       VARCHAR(50) NOT NULL);

CREATE TABLE Posts ( 
    postID      INTEGER NOT NULL, 
    userID      INTEGER NOT NULL, 
    sectionID   INTEGER NOT NULL, 
    title       VARCHAR(100) NOT NULL, 
    postText    VARCHAR(2000) NOT NULL, 
    date        DATE NOT NULL);


CREATE TABLE Comments ( 
    commentID       INTEGER NOT NULL, 
    postID          INTEGER NOT NULL, 
    userID          INTEGER NOT NULL, 
    commentText     VARCHAR(500) NOT NULL, 
    date            DATE NOT NULL);

CREATE TABLE Replies ( 
    replyID         INTEGER NOT NULL, 
    commentID       INTEGER NOT NULL, 
    userID          INTEGER NOT NULL, 
    replyText       VARCHAR(500) NOT NULL, 
    replyDate       DATE NOT NULL);

CREATE TABLE Sections ( 
    sectionID       INTEGER NOT NULL, 
    name            VARCHAR(50) NOT NULL, 
    description     VARCHAR(200) NOT NULL);

CREATE TABLE userRoles ( 
    roleID          INTEGER NOT NULL, 
    userID          INTEGER NOT NULL, 
    roleName        VARCHAR(20) NOT NULL );

CREATE TABLE likes ( 
    commentID       INTEGER NOT NULL, 
    userID          INTEGER NOT NULL);

CREATE TABLE votes ( 
    postID          INTEGER NOT NULL, 
    userID          INTEGER NOT NULL);