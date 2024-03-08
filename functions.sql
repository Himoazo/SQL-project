/* 1- Funktion som visar det totala antalet kommentarer för ett angivet inlägg */
DELIMITER //
CREATE FUNCTION commentCount(postNum INT) RETURNS INT
BEGIN
    DECLARE commentCount INT;
    SELECT COUNT(*) INTO commentCount FROM Comments WHERE postID = postNum;
    RETURN commentCount;
END //
DELIMITER ;


SELECT commentCount(4); -- function anrop i query

-------------------------------------------------------------------------------------------
/* 2- Funktion som visar det totala antalet kommentarer gjorda av en specifik användare */
DELIMITER //

CREATE FUNCTION numberOfComments(inputUserId INT) RETURNS INT
BEGIN
    DECLARE commentCount INT;
    SELECT COUNT(*) INTO commentCount FROM Comments WHERE userID = inputUserId;
    RETURN commentCount;
END;
//
DELIMITER ;

SELECT numberOfComments(5);
-------------------------------------------------------------------------------------------
/* 3- Function som ändrar/uppdaterar E-post adress för angiven användare*/
DELIMITER //

CREATE FUNCTION changeEmail(inputUserId INT, newEmail VARCHAR(50)) RETURNS VARCHAR(40)
BEGIN
    UPDATE Users
    SET email = newEmail
    WHERE userID = inputUserId;
    RETURN 'Klart!';
END;
//
DELIMITER ;

SELECT changeEmail(2, 'test@mejl.com');   -- Testar funktionen 

---------------------------------------------------------------------------------
/* 4- Funktion som returnerar anvädarnamnet som är kopplat till det inmatade ID  */
DELIMITER //

CREATE FUNCTION showUsername(imputID INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE nameQuery VARCHAR(20);
    SELECT username INTO nameQuery FROM Users WHERE userID = imputID;
    RETURN nameQuery;
END;
//
DELIMITER ;

SELECT showUsername(4);
-----------------------------------------------------------------------------------
/* 5- Funktion som beräknar den genomsnittliga längden på inlägg (i form av antalet tecken) som gjorts av en 
specifik användare */

DELIMITER //

CREATE FUNCTION averagePostLength(inputID INT) RETURNS DECIMAL
BEGIN
    DECLARE totalLength INT;
    DECLARE postCount INT;
    DECLARE avgLength DECIMAL;
    
    -- Beräkna den totala längden (antal tecken) av inlägg som är gjorda av användaren
    SELECT SUM(CHAR_LENGTH(postText)) INTO totalLength FROM Posts WHERE userID = inputID;
    
    -- räkna antal inlägg gjorda av användaren
    SELECT COUNT(*) INTO postCount FROM Posts WHERE userID = inputID;
    
    -- Beräkna medelvärdet av inlägglängden
    IF postCount > 0 THEN
        SET avgLength = totalLength / postCount;
    ELSE
        SET avgLength = 0;
    END IF;
    
    RETURN avgLength;
END;
//
DELIMITER ;

SELECT averagePostLength(1);
