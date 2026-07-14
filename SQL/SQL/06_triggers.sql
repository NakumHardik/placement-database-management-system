-- =========================================
-- Triggers
-- =========================================

USE placement_database;

DELIMITER $$

CREATE TRIGGER trg_validate_student_cpi
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.CPI < 0 OR NEW.CPI > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='CPI must be between 0 and 10.';
    END IF;
END$$

CREATE TRIGGER trg_prevent_duplicate_application
BEFORE INSERT ON Application
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Application
        WHERE Student_ID = NEW.Student_ID
          AND Job_ID = NEW.Job_ID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Student has already applied for this job.';
    END IF;
END$$

CREATE TRIGGER trg_update_last_updated
BEFORE UPDATE ON Application
FOR EACH ROW
BEGIN
    SET NEW.Last_Updated = CURDATE();
END$$

CREATE TRIGGER trg_validate_session_date
BEFORE INSERT ON Mentoring
FOR EACH ROW
BEGIN
    IF NEW.Session_Date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Mentoring session date cannot be in the past.';
    END IF;
END$$

CREATE TRIGGER trg_log_job_posting
AFTER INSERT ON Job_Posting
FOR EACH ROW
BEGIN
    INSERT INTO Job_Posting_Log(Job_ID, Company_ID, Action_Type)
    VALUES (NEW.Job_ID, NEW.Company_ID, 'INSERT');
END$$

DELIMITER ;

-- Example:
-- UPDATE Application SET Status_ID=604 WHERE App_ID=801;
-- INSERT INTO Application (...) -- duplicate application will fail.
