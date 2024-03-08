-- Att försöka lägga till en ny användare med en existerande userID går inte 
INSERT INTO Users VALUES (1, 'bob', 'password_2', 'bob@example.com');    

/* Koden genererar följande fel:
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY' 
Vilket innebär att entitets integritet upprätthålls*/

-- Lägger till ett inlägg med obefintligt userID
INSERT INTO Posts VALUES (10, 200, 1, 'Invalid Post', 'skriver ett inlägg med obefintligt användar ID', '2024-03-01');
/* genererar följande error:
Cannot add or update a child row: a foreign key constraint fails 
(`forum_hoaz1600`.`posts`, CONSTRAINT `Posts_userID_FK` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) 
ON DELETE CASCADE ON UPDATE CASCADE)
Detta bekräftar att referensintegritets constraint fungerar korrekt. */

-- lägger till användare med felaktig E-post format
INSERT INTO Users (userID, username, PASSWORD, email) VALUES (5, 'eve', 'losenord', 'felaktig_email'); 
/* genererar följande error 
ERROR 4025 (23000): CONSTRAINT `email_format` failed for `forum_hoaz1600`.`users`
vilket innebär att E-post format constraint fungerar  */

-- username är unik
INSERT INTO Users VALUES (23, 'Gustav', 'secure_pw1', 'gustav@example.com'); 
/* Generear error: ERROR 1062 (23000): Duplicate entry 'Gustav' for key 'username'
Vilket innebär att unikheten för username upprätthålls */
