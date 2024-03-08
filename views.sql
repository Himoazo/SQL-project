/* En vy som visar alla inlägg (både title och postText) med antal röster och kommentarer som är kopplade till var och ett inlägg */
CREATE VIEW postOverview AS
SELECT 
    p.title,
    p.postText,
    COUNT(DISTINCT v.userID) AS voteCount,
    COUNT(DISTINCT c.commentID) AS commentCount
FROM 
    Posts p
LEFT JOIN 
    Votes v ON p.postID = v.postID
LEFT JOIN 
    Comments c ON p.postID = c.postID
GROUP BY 
    p.postID, p.userID, p.sectionID, p.title, p.postText;

    SELECT * FROM postOverview; -- Vyanrop


/* En vy som visar alla användare (användar ID och namn) med antalet imlägg och inläggkommentarer som de har fått */


CREATE VIEW userContribution AS
SELECT
    u.userID,
    u.userName,
    COUNT(DISTINCT p.postID) AS totalPosts,
    COUNT(DISTINCT c.commentID) AS totalComments
FROM
    Users u
LEFT JOIN
    Posts p ON u.userID = p.userID
LEFT JOIN
    Comments c ON p.postID = c.postID
GROUP BY
    u.userID, u.username;

SELECT * FROM userContribution; -- Anropa vyn 