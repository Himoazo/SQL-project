/* Insättningar i tabellen users */
INSERT INTO Users VALUES (1, 'alice', 'password_1', 'alice@example.com');
INSERT INTO Users VALUES (2, 'Elsa', 'strong_pw2', 'elsa@example.com');
INSERT INTO Users VALUES (3, 'Oscar', 'secret_pw3', 'oscar@example.com');
INSERT INTO Users VALUES (4, 'Ingrid', 'hidden_pw4', 'ingrid@example.com');
INSERT INTO Users VALUES (5, 'Axel', 'classified_pw5', 'axel@example.com');
INSERT INTO Users VALUES (6, 'Astrid', 'encrypted_pw6', 'astrid@example.com');
INSERT INTO Users VALUES (7, 'Viktor', 'guarded_pw7', 'viktor@example.com');
INSERT INTO Users VALUES (8, 'Freja', 'shielded_pw8', 'freja@example.com');
INSERT INTO Users VALUES (9, 'Liam', 'locked_pw9', 'liam@example.com');
INSERT INTO Users VALUES (10, 'Maja', 'protected_pw10', 'maja@example.com');
INSERT INTO Users VALUES (11, 'Gustav', 'secure_pw1', 'gustav@example.com');

/* Sektioner */
INSERT INTO Sections VALUES (11, 'Python Developers', 'A space for Python enthusiasts to discuss topics related to this versatile programming
 language, share code snippets, and help each other solve problems.');
INSERT INTO Sections VALUES (12, 'Web Development', 'This section is dedicated to web developers of all levels. Discuss HTML, CSS, JavaScript,
 and more. Share your projects and get feedback.');
INSERT INTO Sections VALUES (13, 'Data Science & AI', 'Explore the world of data analytics, machine learning, and artificial intelligence. 
Share your insights, projects, and learn from professionals.');

/* Posts */
INSERT INTO Posts VALUES (1, 3, 11, 'Python Debugging Tips', 'Having trouble with Python? Check out these debugging techniques.', STR_TO_DATE('17-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (2, 3, 12, 'Web Development Trends', 'Exploring the latest trends in web development.', STR_TO_DATE('18-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (3, 4, 11, 'Data Analysis med Pandas', 'Det är bra att lära sig Pandas för data manipulation.', STR_TO_DATE('19-Jan-2024', '%e-%M-%Y'));
INSERT INTO Posts VALUES (4, 4, 12, 'Responsive Web Design', 'Creating responsive web layouts using CSS media queries.', STR_TO_DATE('20-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (5, 4, 13, 'Introduction to Machine Learning', 'Getting started with ML algorithms and models.', STR_TO_DATE('21-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (6, 5, 11, 'Python vs. JavaScript', 'Comparing Python and JavaScript for backend development.', STR_TO_DATE('22-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (7, 6, 12, 'CSS Flexbox Basics', 'Understanding the fundamentals of CSS Flexbox layout.', STR_TO_DATE('23-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (8, 7, 13, 'Linear Regression Explained', 'A beginner-friendly guide to linear regression.', STR_TO_DATE('24-Nov-2023', '%e-%M-%Y'));
INSERT INTO Posts VALUES (9, 7, 13, 'Teknologins framtid', 'Tror ni att vi kommer att behövas om ett par år?', STR_TO_DATE('25-Nov-2023', '%e-%M-%Y'));

/* Comments */
INSERT INTO Comments VALUES (1, 1, 5, 'Interesting Python debugging tips!', STR_TO_DATE('17-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (2, 2, 6, 'Web development trends are evolving rapidly.', STR_TO_DATE('18-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (3, 3, 7, 'Pandas is a powerful library for data analysis.', STR_TO_DATE('20-Jan-2024', '%e-%M-%Y'));    
INSERT INTO Comments VALUES (4, 4, 8, 'Responsive web design is crucial for user experience.', STR_TO_DATE('20-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (5, 5, 9, 'Machine learning opens up exciting possibilities.', STR_TO_DATE('21-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (6, 6, 10, 'Python vs. JavaScript debate!', STR_TO_DATE('22-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (7, 7, 11, 'Flexbox is a game-changer for web layouts.', STR_TO_DATE('23-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (8, 8, 5, 'Linear regression basics explained.', STR_TO_DATE('24-Nov-2023', '%e-%M-%Y'));
INSERT INTO Comments VALUES (9, 7, 6, 'CSS is not my cup of tea anyway', STR_TO_DATE('23-Nov-2023', '%e-%M-%Y'));

/* Replies */
INSERT INTO Replies VALUES (1, 8, 10, 'Grundläggande förklaring av linjär regression.', STR_TO_DATE('27-Nov-2023', '%e-%M-%Y'));
INSERT INTO Replies VALUES (2, 7, 11, 'Flexbox är verkligen en game changer.', STR_TO_DATE('28-Nov-2023', '%e-%M-%Y'));
INSERT INTO Replies VALUES (3, 6, 1, 'Python vs. JavaScript-debatten fortsätter!.', STR_TO_DATE('29-Nov-2023', '%e-%M-%Y'));
INSERT INTO Replies VALUES (4, 5, 2, 'Maskininlärning öppnar upp för spännande möjligheter.', STR_TO_DATE('30-Nov-2023', '%e-%M-%Y'));
INSERT INTO Replies VALUES (5, 4, 3, 'Responsiv design är avgörande för användarupplevelsen.', STR_TO_DATE('21-Dec-2023', '%e-%M-%Y'));
INSERT INTO Replies VALUES (6, 3, 4, 'Pandas är en game changer för dataanalys', STR_TO_DATE('22-Jan-2024', '%e-%M-%Y'));
INSERT INTO Replies VALUES (7, 2, 5, 'Absolut! Webbutvecklingstrender är fascinerande', STR_TO_DATE('23-Dec-2023', '%e-%M-%Y')); 
INSERT INTO Replies VALUES (8, 1, 6, 'Jag håller med Python felsökning kan vara lurigt ibland.', STR_TO_DATE('24-Dec-2023', '%e-%M-%Y'));

/* UserRoles */
INSERT INTO userRoles VALUES (1, 3, 'Admin');
INSERT INTO userRoles VALUES (2, 5, 'Mod');

/* Likes */
INSERT INTO likes VALUES (1, 5);
INSERT INTO likes VALUES (2, 6);
INSERT INTO likes VALUES (3, 7);
INSERT INTO likes VALUES (4, 7);
INSERT INTO likes VALUES (4, 8);
INSERT INTO likes VALUES (4, 9);
INSERT INTO likes VALUES (5, 9);
INSERT INTO likes VALUES (6, 10);
INSERT INTO likes VALUES (7, 11);
INSERT INTO likes VALUES (8, 4);
INSERT INTO likes VALUES (1, 3);
INSERT INTO likes VALUES (2, 1);
INSERT INTO likes VALUES (3, 2);

/* Votes */
INSERT INTO votes VALUES (4, 7);
INSERT INTO votes VALUES (4, 8);
INSERT INTO votes VALUES (4, 9);
INSERT INTO votes VALUES (5, 6);
INSERT INTO votes VALUES (5, 1);
INSERT INTO votes VALUES (1, 11);