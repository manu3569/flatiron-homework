---------------------
-- BUILD DB SOURCE --
---------------------


-- PROJECTS --

CREATE TABLE projects (
  id INTEGER PRIMARY KEY,
  title text,
  funding_goal INTEGER,
  start_date text,
  end_date text
);

INSERT INTO projects VALUES (NULL, 'iPhone Solar Charger Case', 190000, '2013-10-01', '2013-11-01');
INSERT INTO projects VALUES (NULL, 'iPhone Wireless Charger', 180000, '2013-10-02', '2013-11-03');
INSERT INTO projects VALUES (NULL, 'iPhone External Monitor', 170000, '2013-10-03', '2013-11-05');
INSERT INTO projects VALUES (NULL, 'iPhone USB Taste Sensor', 160000, '2013-10-04', '2013-11-07');
INSERT INTO projects VALUES (NULL, 'iPhone Invisibility Case', 150000, '2013-10-05', '2013-11-15');
INSERT INTO projects VALUES (NULL, 'iPhone Screen Projector', 140000, '2013-10-10', '2013-11-11');
INSERT INTO projects VALUES (NULL, 'iPhone Wool Knit Case', 130000, '2013-10-15', '2013-11-01');
INSERT INTO projects VALUES (NULL, 'iPhone External SMS Notification LED', 120000, '2013-10-20', '2013-10-30');
INSERT INTO projects VALUES (NULL, 'iPhone Foldable Keyboard', 110000, '2013-10-30', '2013-11-31');
INSERT INTO projects VALUES (NULL, 'iPhone Thunderbolt-to-classic Charger Converter', 810000, '2013-12-01', '2013-12-31');


-- USERS --

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name text,
  age INTEGER
);

INSERT INTO users VALUES (NULL, 'Lavona Parrales', 42);
INSERT INTO users VALUES (NULL, 'Iliana Yamanaka', 23);
INSERT INTO users VALUES (NULL, 'Daniela Vida', 54);
INSERT INTO users VALUES (NULL, 'Cletus Pipes', 62);
INSERT INTO users VALUES (NULL, 'Ashton Roda', 21);
INSERT INTO users VALUES (NULL, 'Alexander Handley', 23);
INSERT INTO users VALUES (NULL, 'Christie Touchet', 54);
INSERT INTO users VALUES (NULL, 'Sharen Mccubbin', 35);
INSERT INTO users VALUES (NULL, 'Valerie Heiss', 42);
INSERT INTO users VALUES (NULL, 'Chasidy Swink', 62);
INSERT INTO users VALUES (NULL, 'Lovie Byars', 37);
INSERT INTO users VALUES (NULL, 'Ernestine Ring', 80);
INSERT INTO users VALUES (NULL, 'Kiley Mcferrin', 15);
INSERT INTO users VALUES (NULL, 'Hsiu Summerville', 36);
INSERT INTO users VALUES (NULL, 'Iris Bogle', 42);
INSERT INTO users VALUES (NULL, 'Meagan Waechter', 44);
INSERT INTO users VALUES (NULL, 'Karry Sheahan', 32);
INSERT INTO users VALUES (NULL, 'Michale Minard', 18);
INSERT INTO users VALUES (NULL, 'Andria Sollars', 26);
INSERT INTO users VALUES (NULL, 'Kasie Sudler', 28);



-- PLEDGES --

CREATE TABLE pledges (
  id INTEGER PRIMARY KEY,
  amount INTEGER,
  user_id INTEGER,
  project_id INTEGER
);

INSERT INTO pledges VALUES (NULL, 344000, 7, 4);
INSERT INTO pledges VALUES (NULL, 352100, 12, 10);
INSERT INTO pledges VALUES (NULL, 266200, 1, 5);
INSERT INTO pledges VALUES (NULL, 113900, 2, 10);
INSERT INTO pledges VALUES (NULL, 165800, 12, 9);
INSERT INTO pledges VALUES (NULL, 191300, 15, 5);
INSERT INTO pledges VALUES (NULL, 151200, 11, 2);
INSERT INTO pledges VALUES (NULL, 491900, 1, 7);
INSERT INTO pledges VALUES (NULL, 21700, 2, 4);
INSERT INTO pledges VALUES (NULL, 295500, 17, 5);
INSERT INTO pledges VALUES (NULL, 67500, 8, 9);
INSERT INTO pledges VALUES (NULL, 27600, 9, 2);
INSERT INTO pledges VALUES (NULL, 240600, 19, 4);
INSERT INTO pledges VALUES (NULL, 391900, 2, 4);
INSERT INTO pledges VALUES (NULL, 17000, 0, 7);
INSERT INTO pledges VALUES (NULL, 35600, 2, 8);
INSERT INTO pledges VALUES (NULL, 406400, 20, 2);
INSERT INTO pledges VALUES (NULL, 411000, 17, 5);
INSERT INTO pledges VALUES (NULL, 497900, 19, 4);
INSERT INTO pledges VALUES (NULL, 432500, 15, 10);
INSERT INTO pledges VALUES (NULL, 85500, 8, 3);
INSERT INTO pledges VALUES (NULL, 97200, 1, 6);
INSERT INTO pledges VALUES (NULL, 253100, 8, 2);
INSERT INTO pledges VALUES (NULL, 449700, 1, 1);
INSERT INTO pledges VALUES (NULL, 186500, 4, 5);
INSERT INTO pledges VALUES (NULL, 105800, 3, 9);
INSERT INTO pledges VALUES (NULL, 201500, 4, 7);
INSERT INTO pledges VALUES (NULL, 205900, 8, 10);
INSERT INTO pledges VALUES (NULL, 490400, 5, 1);
INSERT INTO pledges VALUES (NULL, 332700, 14, 10);



-- CATEGORY --

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  label text  
);

INSERT INTO categories VALUES (NULL, 'Music');
INSERT INTO categories VALUES (NULL, 'Books');
INSERT INTO categories VALUES (NULL, 'Charity');


-- PROJECT_CATEGORIES --

CREATE TABLE project_categories (
  id INTEGER PRIMARY KEY,
  project_id INTEGER,
  category_id INTEGER);

INSERT INTO project_categories VALUES (NULL, 1, 3);
INSERT INTO project_categories VALUES (NULL, 2, 2);
INSERT INTO project_categories VALUES (NULL, 3, 2);
INSERT INTO project_categories VALUES (NULL, 4, 1);
INSERT INTO project_categories VALUES (NULL, 5, 1);
INSERT INTO project_categories VALUES (NULL, 6, 3);
INSERT INTO project_categories VALUES (NULL, 7, 1);
INSERT INTO project_categories VALUES (NULL, 8, 1);
INSERT INTO project_categories VALUES (NULL, 9, 3);
INSERT INTO project_categories VALUES (NULL, 10, 3);




-- 1. Select the titles of all projects and their pledge amounts.

SELECT title, SUM(amount)/100 
FROM projects JOIN pledges 
WHERE projects.id = pledges.project_id 
GROUP BY projects.id;

-- iPhone Solar Charger Case|9401
-- iPhone Wireless Charger|8383
-- iPhone External Monitor|855
-- iPhone USB Taste Sensor|14961
-- iPhone Invisibility Case|13505
-- iPhone Screen Projector|972
-- iPhone Wool Knit Case|7104
-- iPhone External SMS Notification LED|356
-- iPhone Foldable Keyboard|3391
-- iPhone Thunderbolt-to-classic Charger Converter|14371


-- 2. Select the user name, age, and pledge amount for all pledges.

SELECT name, age, amount/100 
FROM users JOIN pledges 
WHERE users.id = pledges.user_id;

-- Christie Touchet|54|3440
-- Ernestine Ring|80|3521
-- Lavona Parrales|42|2662
-- Iliana Yamanaka|23|1139
-- Ernestine Ring|80|1658
-- Iris Bogle|42|1913
-- Lovie Byars|37|1512
-- Lavona Parrales|42|4919
-- Iliana Yamanaka|23|217
-- Karry Sheahan|32|2955
-- Sharen Mccubbin|35|675
-- Valerie Heiss|42|276
-- Andria Sollars|26|2406
-- Iliana Yamanaka|23|3919
-- Iliana Yamanaka|23|356
-- Kasie Sudler|28|4064
-- Karry Sheahan|32|4110
-- Andria Sollars|26|4979
-- Iris Bogle|42|4325
-- Sharen Mccubbin|35|855
-- Lavona Parrales|42|972
-- Sharen Mccubbin|35|2531
-- Lavona Parrales|42|4497
-- Cletus Pipes|62|1865
-- Daniela Vida|54|1058
-- Cletus Pipes|62|2015
-- Sharen Mccubbin|35|2059
-- Ashton Roda|21|4904
-- Hsiu Summerville|36|3327


-- 3. Select the titles of all projects that have met their funding goal.

SELECT title 
FROM projects JOIN pledges 
WHERE projects.id = pledges.project_id 
GROUP BY projects.id 
HAVING SUM(amount) > funding_goal;

-- iPhone Solar Charger Case
-- iPhone Wireless Charger
-- iPhone USB Taste Sensor
-- iPhone Invisibility Case
-- iPhone Wool Knit Case
-- iPhone Foldable Keyboard
-- iPhone Thunderbolt-to-classic Charger Converter


-- 4. Select user names and amounts of all pledges. Order them by the amount.

SELECT name, amount
FROM users JOIN pledges 
WHERE users.id = pledges.user_id 
GROUP BY users.id
ORDER BY amount DESC;

-- Andria Sollars|497900
-- Ashton Roda|490400
-- Lavona Parrales|449700
-- Iris Bogle|432500
-- Karry Sheahan|411000
-- Kasie Sudler|406400
-- Christie Touchet|344000
-- Hsiu Summerville|332700
-- Sharen Mccubbin|205900
-- Cletus Pipes|201500
-- Ernestine Ring|165800
-- Lovie Byars|151200
-- Daniela Vida|105800
-- Iliana Yamanaka|35600
-- Valerie Heiss|27600


-- 5. Select the category names, and pledge amounts of all pledges in the music category.

SELECT label, amount 
FROM projects, categories, pledges, project_categories 
WHERE projects.id = project_categories.project_id 
  AND project_categories.category_id = categories.id 
  AND categories.label = 'Music'
  AND projects.id = pledges.project_id;

-- Music|21700
-- Music|240600
-- Music|344000
-- Music|391900
-- Music|497900
-- Music|186500
-- Music|191300
-- Music|266200
-- Music|295500
-- Music|411000
-- Music|17000
-- Music|201500
-- Music|491900
-- Music|35600


-- 6. Select the category names and the sum total of the pledge amounts of all the pledges in the book category.

SELECT label, SUM(amount)/100 
FROM projects, categories, pledges, project_categories 
WHERE projects.id = project_categories.project_id 
  AND project_categories.category_id = categories.id 
  AND categories.label = 'Books'
  AND projects.id = pledges.project_id
GROUP BY projects.id;

-- Books|8383
-- Books|855



