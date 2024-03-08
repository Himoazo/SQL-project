/* 1- Procedure AddComment lägger till kommentar till ett inlägg med det aktuella datumet (dvs utan att mata in datumet manuellt) */
ALTER TABLE Comments MODIFY COLUMN commentID INTEGER NOT NULL AUTO_INCREMENT; -- Detta är för att skippa mata in commentID och få ett auto genererat

DELIMITER //
CREATE PROCEDURE AddComment(IN postId INT, IN userId INT, IN commentText VARCHAR(500))

BEGIN
    INSERT INTO Comments (postID, userID, commentText, date)
    VALUES (postId, userId, commentText, NOW());
END //
DELIMITER ;


CALL AddComment(3, 2, 'Det här är ju bra grejer');

----------------------------------------------------------------------------------------
/* 2- En procerdur som visar kommenratexten från tabellen kommentarer där användaren har kommenterat sitt eget inlägg. */
DELIMITER //

CREATE PROCEDURE showOwnComment()
BEGIN
    SELECT postID, userID, commentText FROM Comments c WHERE EXISTS 
    (SELECT postID FROM Posts p WHERE p.postID = c.postID AND p.userID = c.userID);
END;
//
DELIMITER ;

CALL showOwnComment();
------------------------------------------------------------------------------------------------
-- 3- En procedure som visar antalet inlägg en användare har gjort
DELIMITER //

CREATE PROCEDURE totalUserPosts(IN inputUserId INT, OUT totalPosts INT)
BEGIN
    SELECT COUNT(*) INTO totalPosts FROM Posts WHERE userID = inputUserId;
END;
//
DELIMITER ;

CALL totalUserPosts(3, @totalPosts); -- Antalet inlägg som är skrivna av användare med ID = 3
SELECT @totalPosts;
----------------------------------------------------------------------------------------------------
/* 4- Procedure som visar kommentartexten på valt inlägg */
DELIMITER //

CREATE PROCEDURE postComments(IN commentedPost INT)
BEGIN
    SELECT commentText FROM Comments WHERE postID = commentedPost;
END;
//
DELIMITER ;

CALL postComments(7);  -- Här anrops det proceduren med postID 7 och då får vi texterna på 2st kommentarer på inlägget
---------------------------------------------------------------------------------------------------
/* 5- En procedure som listar ut inlägget som har fått flest röster */
DELIMITER //

CREATE PROCEDURE mostVoted()
BEGIN
    
    SELECT Posts.postID, Posts.title, Posts.postText, Posts.date, COUNT(votes.postID) AS numVotes
    FROM Posts
    LEFT JOIN votes ON Posts.postID = votes.postID
    GROUP BY Posts.postID
    ORDER BY numVotes DESC
    LIMIT 1;
END;
//
DELIMITER ;

CALL mostVoted();