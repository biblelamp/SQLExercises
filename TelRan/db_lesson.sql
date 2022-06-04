CREATE TABLE IF NOT EXISTS students (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  group_name  TEXT NOT NULL,
  score       INTEGER NOT NULL
);

INSERT INTO students (name, group_name, score) VALUES
	('Aleksey', 'java_26-27e', 5),
    ('Viktors', 'java_26-27e', 5),
	('Igor', 'java_26-27e', 5),
	('Georgii', 'java_26-27e', 5);

SELECT * FROM students WHERE score<5;

INSERT INTO students (name, group_name, score) VALUES ('Muzaffar', 'basic_41-42e', 3);
UPDATE students SET score=4 WHERE name='Muzaffar';

DELETE FROM students WHERE score<5;
