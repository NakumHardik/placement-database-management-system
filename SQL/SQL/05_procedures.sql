-- =========================================
-- Stored Procedures
-- =========================================

USE placement_database;

DELIMITER $$

CREATE PROCEDURE GetStudentProfile(IN p_student_id INT)
BEGIN
    SELECT u.User_ID, u.First_Name, u.Last_Name, u.Email,
           b.Branch_Name, p.Programme_Name,
           s.Year_Of_Study, s.CPI, s.Backlogs
    FROM Student s
    JOIN Users u ON s.Student_ID=u.User_ID
    JOIN Branch b ON s.Branch_ID=b.Branch_ID
    JOIN Programme p ON b.Programme_ID=p.Programme_ID
    WHERE s.Student_ID=p_student_id;
END$$

CREATE PROCEDURE GetCompanyJobs(IN p_company_id INT)
BEGIN
    SELECT Job_ID, Job_Title, Package, Application_Deadline
    FROM Job_Posting
    WHERE Company_ID=p_company_id;
END$$

CREATE PROCEDURE GetApplicationsByStudent(IN p_student_id INT)
BEGIN
    SELECT a.App_ID,c.Company_Name,j.Job_Title,st.Status,a.Date_Applied
    FROM Application a
    JOIN Job_Posting j ON a.Job_ID=j.Job_ID
    JOIN Company c ON j.Company_ID=c.Company_ID
    JOIN Status st ON a.Status_ID=st.Status_ID
    WHERE a.Student_ID=p_student_id;
END$$

CREATE PROCEDURE UpdateApplicationStatus(
IN p_app_id INT,
IN p_status_id INT
)
BEGIN
    UPDATE Application
    SET Status_ID=p_status_id,
        Last_Updated=CURDATE()
    WHERE App_ID=p_app_id;
END$$

CREATE PROCEDURE GetEligibleJobs(
IN p_cpi DECIMAL(3,2),
IN p_backlogs INT
)
BEGIN
    SELECT j.Job_ID,c.Company_Name,j.Job_Title,j.Package
    FROM Job_Posting j
    JOIN Company c ON j.Company_ID=c.Company_ID
    JOIN Job_Eligibility e ON j.Eligibility_ID=e.Eligibility_ID
    WHERE e.Min_CPI<=p_cpi
      AND (e.Back_Allowed=TRUE OR p_backlogs=0);
END$$

CREATE PROCEDURE CompanyDriveSchedule(IN p_company_id INT)
BEGIN
    SELECT d.Drive_ID,d.Date,d.Time,d.Venue
    FROM Placement_Drive d
    WHERE d.Company_ID=p_company_id
    ORDER BY d.Date;
END$$

CREATE PROCEDURE StudentDocuments(IN p_student_id INT)
BEGIN
    SELECT Document_Name,Document_Type
    FROM Document
    WHERE Student_ID=p_student_id;
END$$

CREATE PROCEDURE MentorSessions(IN p_alumni_id INT)
BEGIN
    SELECT Mentoring_ID,Student_ID,Session_Date,Topic,Feedback
    FROM Mentoring
    WHERE Alumni_ID=p_alumni_id;
END$$

DELIMITER ;

-- Example Calls
-- CALL GetStudentProfile(1);
-- CALL GetCompanyJobs(301);
-- CALL GetApplicationsByStudent(1);
-- CALL UpdateApplicationStatus(801,604);
-- CALL GetEligibleJobs(8.25,0);
-- CALL CompanyDriveSchedule(301);
-- CALL StudentDocuments(1);
-- CALL MentorSessions(61);
