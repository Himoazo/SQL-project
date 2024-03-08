/* En SELECT sats med jämförelse operatorer som > ,<  != eller liknande 
Välj postID från tabellen POSTS där datumet är större (eller senare) än 2024-01-01 */
SELECT POSTID FROM POSTS WHERE DATE > '2024-01-01';

/* En SELECT med LIKE mot ett textfält. 
Välj Kommentarer från tabellen commentText some innehåller ordet "Flexbox" */
SELECT COMMENTTEXT FROM COMMENTS WHERE COMMENTTEXT LIKE '%Flexbox%';

/* En fråga med IN, GROUP BY och HAVING.
Lista ut titlarna för de inlägg som har fått 2 röster eller fler */
SELECT title FROM Posts WHERE postID IN (SELECT postID FROM votes GROUP BY postID HAVING COUNT(*) >= 2);

/* En fråga med EXIST 
Välj kommenratexten från tabellen kommentarer där användaren har kommenterat sitt eget inlägg. 
Här har jag använt Alias p och c för att referera till posts och comments. */
SELECT commentText FROM Comments c WHERE EXISTS (SELECT postID FROM Posts p WHERE p.postID = c.postID AND p.userID = c.userID);

/* En fråga med GROUP BY.
För de användare som har kommenterat inlägg lista ut antal kommentarer som är gjorda av varje användare (av varje userID). */
SELECT COUNT(commentID), userID FROM comments GROUP BY userID;

/* En fråga med HAVING  
Lista ut antalet inlägg som är gjorda av varje användare och inkludera endast användare som har gjort mer än 2 inlägg */
SELECT COUNT(postID), userID FROM posts GROUP BY userID HAVING COUNT(postID) > 2;

/* En fråga med ORDER BY 
Lista ut inläggtexterna och sortera dem enligt textlängden från texten med högst antal tecken till texten med lägst antal tecken (descending) */
SELECT posttext FROM posts ORDER BY CHAR_LENGTH(posttext) DESC;

/* En fråga med LEFT JOIN 
lista ut alla inlägg tillsammans med eventuella tillhörande kommentarer. Om ett inlägg inte har några kommentarer ska det ändå 
inkluderas i resultatet. */
SELECT Posts.postID, Posts.postText, Comments.commentText FROM Posts LEFT JOIN Comments ON Posts.postID = Comments.postID;

/* En fråga med MAX()
Lista ut inläggtitlen av det inlägget som har det högsta dvs senaste datumet */
SELECT title FROM posts WHERE DATE = (SELECT MAX(DATE) FROM posts);

/* En selektiv DELETE
Ta bort inlägg som inte har några kommentarer alls */
DELETE p FROM posts p LEFT JOIN comments c ON p.postID = c.postID WHERE c.postID IS NULL;


/* En selective UPDATE 
Uppdatera tabellen Users så att du byter namn till Anna för användaren med användar ID 1 */
UPDATE Users SET username = 'Anna' WHERE userID = 1;



/* En Auto-increment som gör att ett unikt nummer genereras automatiskt när en ny insert infogas i en tabell. */
ALTER TABLE Users MODIFY COLUMN userID INTEGER NOT NULL AUTO_INCREMENT; 
INSERT INTO Users (username, PASSWORD, email) VALUES ('Jesper', 'secure_pw1', 'jesse@example.com'); -- Ny user utan att ange userID, deh får ett per automatik från auto increment






