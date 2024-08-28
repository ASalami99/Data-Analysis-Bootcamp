-- Triggers and events
-- A trigger is a block of code that executes automatically when an event takes place on a specific table

-- Triggers
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW. employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Testing it
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, "Jean-Ralphio", "Saperstein", "Exntertainment 720 CEO", 1000000, NULL);


-- Events
SELECT *
FROM employee_demographics;

SELECT *
    FROM employee_demographics
    WHERE  age >= 60;

-- Creating an event so that once they become 60 years old, they are retired. (left the database)
-- We can schedule it

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE  age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';