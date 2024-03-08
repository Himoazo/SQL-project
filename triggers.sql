/* 1- Trigger som anger det aktuella datumet vid postskapandet så att man kan skapa post utan att manuellt ange date där date 
stoppas in i insertion av triggern */

DELIMITER //
CREATE TRIGGER inserPostCurrentDate
BEFORE INSERT ON Posts
FOR EACH ROW
BEGIN
    SET NEW.date = CURDATE();
END;
//
DELIMITER ;


INSERT INTO Posts (postID, userID, sectionID, title, postText) VALUES (14, 1, 11, 'Trigger test', 'Här testar vi triggern'); -- Testa trigger

-------------------------------------------------------------------------------------------------------------------------

/* 2- Trigger som uppdaterar latest.activity kolumn i Users när en användare skapar ett inlägg. Efter inlägget är skapat så updaterar triggern
latest_activity kolumnen med datumet då inlägget skapades*/
-- skapar denna kolumn för triggers skull. Obs kolumnen är ej granskad mot Normal formerna. 
ALTER TABLE Users ADD COLUMN latest_activity DATE; 


DELIMITER //

CREATE TRIGGER userLatestActivity
AFTER INSERT ON Posts
FOR EACH ROW
BEGIN
    UPDATE Users
    SET latest_activity = NOW()
    WHERE userID = NEW.userID;
END;
//
DELIMITER ;

INSERT INTO Posts (postID, userID, sectionID, title, postText) VALUES (13, 2, 12, 'Trigger test igen', 'Här testar vi en till triggern');

--------------------------------------------------------------------------------------------------
/* 3- En trigger som inte tillåter att en användare med userRole att tas bort från databasen */
DELIMITER //

CREATE TRIGGER noDeleteUserRole
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
    DECLARE roleCount INT;
    
    -- Kollar ifall användaren har någon roll i userRole tabellen
    SELECT COUNT(*) INTO roleCount
    FROM userRoles
    WHERE userID = OLD.userID;
    
    -- om användaren har roll blir roleCount värde 1 och då bryts borttagning och ett felmeddelande genereras 
    IF roleCount > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Du får inte ta bort en användare som är Admin eller moderator';
    END IF;
END;
//
DELIMITER ;

--testa att tabort användaren vars ID = 3 som är Admin
DELETE FROM Users WHERE userID = 3;
----------------------------------------------------------------------------------------------------------------
/* 4- Trigger som uppdaterar inläggetsdatum till aktuelldatum när inläggstext ändras/uppdateras */
DELIMITER //

CREATE TRIGGER postEditedDate
BEFORE UPDATE ON Posts
FOR EACH ROW
BEGIN
    IF OLD.postText != NEW.postText THEN
        SET NEW.date = CURDATE();
    END IF;
END;
//

DELIMITER ;

UPDATE Posts SET postText = 'ändra inläggtext för att testa postEditeDate trigger' WHERE postID = 1; -- test av att ändra texten i ett inlägg
----------------------------------------------------------------------------------------------------------------------------------------------
/* 5- Trigger som ger inlägg skrivare/skapare 1 reputation poäng i userReputation kolumn i Users tabell varje gång deras inlägg får en röst (Vote) */
--Obs kolumnen är ej granskad mot Normal formerna. 
ALTER TABLE Users ADD COLUMN userReputation INTEGER DEFAULT 0; -- skapar kolumn userReputation för triggers skull 

DELIMITER //

CREATE TRIGGER reputation
AFTER INSERT ON votes
FOR EACH ROW
BEGIN
    DECLARE postCreator INT;
    
    -- Avgör userID på den som skapade inlägget som har fått en röst och lagrar det i variabeln postCreator
    SELECT userID INTO postCreator
    FROM Posts
    WHERE postID = NEW.postID;

    -- lägger till 1 poäng till inläggets skaparen
    IF postCreator IS NOT NULL THEN
        UPDATE Users
        SET userReputation = userReputation + 1
        WHERE userID = postCreator;
    END IF;
END;
//

DELIMITER ;


INSERT INTO votes VALUES (2, 10);  -- Lägga till en röst (vote) för att testa triggern