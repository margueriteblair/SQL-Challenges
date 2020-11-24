CREATE TABLE careerdevs (studentId int(6), firstName VARCHAR(50), lastName VARCHAR(50), currentMonthsInProgram float, PRIMARY KEY(studentId));

INSERT INTO careerdevs VALUES (357765, 'Margie', 'Blair', 8.9),
(357766, 'Cliff', 'Choiniere', 60),
(357767, 'Tom', 'Hodgkinson', 20),
(357768, 'Scott', 'Hackman', 12),
(357769, 'Michael', 'Spremulli', 8.9),
(357770, 'Marcus', 'Galvin', 20),
(357771, 'John', 'Saylor', 15),
(357772, 'Hayden', 'Bryant', 20),
(357773, 'Arniel', 'Ceballos', 2.5);


CREATE TABLE lessonplans (studentId int(6), lessonTopic VARCHAR(30), PRIMARY KEY(studentId));

INSERT INTO lessonplans VALUES(357765, 'Multithreading'),
(357766, NULL),
(357767, 'Spring Configuration'),
(357768, 'SQL'),
(357769, 'Rest Config'),
(357770, 'Machine Learning'),
(357771, 'Design Patterns'),
(357772, 'Hibernate'),
(357773, 'Dependency Injection');

SELECT * FROM careerdevs INNER JOIN lessonplans ON lessonplans.studentId = careerdevs.studentId;

