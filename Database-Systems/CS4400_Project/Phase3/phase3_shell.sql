/*
CS4400: Introduction to Database Systems
Fall 2020
Phase III Template

Team 88
Bryan K. Kim (bkim441)
Jim Liu (cliu657)
Nathan Luskey (nluskey7)
Eleanor Sim (esim6)

Directions:
Please follow all instructions from the Phase III assignment PDF.
This file must run without error for credit.
*/


-- ID: 2a
-- Author: lvossler3
-- Name: register_student
DROP PROCEDURE IF EXISTS register_student;
DELIMITER //
CREATE PROCEDURE register_student(
		IN i_username VARCHAR(40),
        IN i_email VARCHAR(40),
        IN i_fname VARCHAR(40),
        IN i_lname VARCHAR(40),
        IN i_location VARCHAR(40),
        IN i_housing_type VARCHAR(20),
        IN i_password VARCHAR(40)
)
BEGIN

-- Type solution below

insert into user values (i_username, md5(i_password), i_email, i_fname, i_lname);
insert into student values (i_username, i_housing_type, i_location);



-- End of solution
END //
DELIMITER ;

-- ID: 2b
-- Author: lvossler3
-- Name: register_employee
DROP PROCEDURE IF EXISTS register_employee;
DELIMITER //
CREATE PROCEDURE register_employee(
		IN i_username VARCHAR(40),
        IN i_email VARCHAR(40),
        IN i_fname VARCHAR(40),
        IN i_lname VARCHAR(40),
        IN i_phone VARCHAR(10),
        IN i_labtech BOOLEAN,
        IN i_sitetester BOOLEAN,
        IN i_password VARCHAR(40)
)
BEGIN
-- Type solution below

insert into user values (i_username, md5(i_password), i_email, i_fname, i_lname);

insert into employee values (i_username, i_phone);

if (i_labtech)
	then insert into labtech value (i_username); end if;

if (i_sitetester)
	then insert into sitetester value (i_username); end if;

-- End of solution
END //
DELIMITER ;


-- ID: 4a
-- Author: Aviva Smith
-- Name: student_view_results
DROP PROCEDURE IF EXISTS `student_view_results`;
DELIMITER //
CREATE PROCEDURE `student_view_results`(
    IN i_student_username VARCHAR(50),
	IN i_test_status VARCHAR(50),
	IN i_start_date DATE,
    IN i_end_date DATE
)
BEGIN
	DROP TABLE IF EXISTS student_view_results_result;
    CREATE TABLE student_view_results_result(
        test_id VARCHAR(7),
        timeslot_date date,
        date_processed date,
        pool_status VARCHAR(40),
        test_status VARCHAR(40)
    );
    INSERT INTO student_view_results_result

    -- Type solution below

		SELECT t.test_id, t.appt_date, p.process_date, p.pool_status , t.test_status
        FROM Appointment a
            LEFT JOIN Test t
                ON t.appt_date = a.appt_date
                AND t.appt_time = a.appt_time
                AND t.appt_site = a.site_name
            LEFT JOIN Pool p
                ON t.pool_id = p.pool_id
        WHERE i_student_username = a.username
            AND (i_test_status = t.test_status OR i_test_status IS NULL)
            AND (i_start_date <= t.appt_date OR i_start_date IS NULL)
            AND (i_end_date >= t.appt_date OR i_end_date IS NULL);

    -- End of solution
END //
DELIMITER ;

-- ID: 5a
-- Author: asmith457
-- Name: explore_results
DROP PROCEDURE IF EXISTS explore_results;
DELIMITER $$
CREATE PROCEDURE explore_results (
    IN i_test_id VARCHAR(7))
BEGIN
    DROP TABLE IF EXISTS explore_results_result;
    CREATE TABLE explore_results_result(
        test_id VARCHAR(7),
        test_date date,
        timeslot time,
        testing_location VARCHAR(40),
        date_processed date,
        pooled_result VARCHAR(40),
        individual_result VARCHAR(40),
        processed_by VARCHAR(80)
    );
    INSERT INTO explore_results_result

    -- Type solution below
        
        select test.test_id, test.appt_date, test.appt_time, test.appt_site, pool.process_date, pool.pool_status, test.test_status, concat(user.fname, user.lname)
        from (pool join test on pool.pool_id = test.pool_id) join user on pool.processed_by = user.username
        where test.test_id = i_test_id;
        
    -- End of solution
END$$
DELIMITER ;

-- ID: 6a
-- Author: asmith457
-- Name: aggregate_results
DROP PROCEDURE IF EXISTS aggregate_results;
DELIMITER $$
CREATE PROCEDURE aggregate_results(
    IN i_location VARCHAR(50),
    IN i_housing VARCHAR(50),
    IN i_testing_site VARCHAR(50),
    IN i_start_date DATE,
    IN i_end_date DATE)
BEGIN
    DROP TABLE IF EXISTS aggregate_results_result;
    CREATE TABLE aggregate_results_result(
        test_status VARCHAR(40),
        num_of_test INT,
        percentage DECIMAL(6,2)
    );

    INSERT INTO aggregate_results_result

    -- Type solution below

    select test_status, count(*), 0
    from (select * from test join site on test.appt_site = site.site_name) as t1 
	join 
    (select * from student join appointment on student.student_username = appointment.username) as t2 
    join
    (select * from pool) as t3
    on t1.pool_id = t3.pool_id AND t1.site_name = t2.site_name AND t1.appt_date = t2.appt_date AND t1.appt_time = t2.appt_time
    where ((i_location is NULL OR i_location = t2.location)
    AND (i_housing is NULL OR i_housing = t2.housing_type)
    AND (i_testing_site is NULL OR i_testing_site = t2.site_name)
    AND (i_start_date is NULL OR i_start_date >= t3.process_date)
    AND (i_end_date is NULL OR i_end_date <= t3.process_date)
    )
    group by test_status;
    
    select sum(num_of_test) into @sum from aggregate_results_result;
    
    update aggregate_results_result
    SET
    percentage = 100 * num_of_test / @sum;
    
    -- End of solution
END$$
DELIMITER ;


-- ID: 7a
-- Author: lvossler3
-- Name: test_sign_up_filter
DROP PROCEDURE IF EXISTS test_sign_up_filter;
DELIMITER //
CREATE PROCEDURE test_sign_up_filter(
    IN i_username VARCHAR(40),
    IN i_testing_site VARCHAR(40),
    IN i_start_date date,
    IN i_end_date date,
    IN i_start_time time,
    IN i_end_time time)
sp_main: BEGIN
	set @starting_date = (select min(appt_date) from appointment);
    if i_start_date is NULL then set i_start_date = @starting_date; end if;
    set @ending_date = (select max(appt_date) from appointment);
    if i_end_date is NULL then set i_end_date = @ending_date; end if;
    set @starting_time = (select min(appt_time) from appointment);
    if i_start_time is NULL then set i_start_time = @starting_time; end if;
    set @ending_time = (select max(appt_time) from appointment);
    if i_end_time is NULL then set i_end_time = @ending_time; end if;
    set @student_loc = (select location from student where student_username = i_username);
    set @site_loc = (select location from site where site_name = i_testing_site);
    if not @student_loc = @site_loc then leave sp_main; end if;
    
    DROP TABLE IF EXISTS test_sign_up_filter_result;
    CREATE TABLE test_sign_up_filter_result(
        appt_date date,
        appt_time time,
        street VARCHAR (40),
        city VARCHAR(40),
        state VARCHAR(2),
        zip VARCHAR(5),
        site_name VARCHAR(40));
	
    if i_testing_site is NULL then 
    INSERT INTO test_sign_up_filter_result
    select appt_date, appt_time, street, city, state, zip, appointment.site_name
    from appointment join site on appointment.site_name = site.site_name 
    where username is null and appointment.site_name in (select site_name from site join student on student.location = site.location where student_username = i_username) 
    and (appt_date between i_start_date and i_end_date) and (appt_time between i_start_time and i_end_time); leave sp_main; end if;   
        
    INSERT INTO test_sign_up_filter_result

    -- Type solution below
    select appt_date, appt_time, street, city, state, zip, appointment.site_name
    from appointment join site on appointment.site_name = site.site_name
    where username is null and appointment.site_name in (select site_name from site join student on student.location = site.location where student_username = i_username) and
    appointment.site_name = i_testing_site and (appt_date between i_start_date and i_end_date) and (appt_time between i_start_time and i_end_time);
	
    -- End of solution
    END //
    DELIMITER ;

-- ID: 7b
-- Author: lvossler3
-- Name: test_sign_up
DROP PROCEDURE IF EXISTS test_sign_up;
DELIMITER //
CREATE PROCEDURE test_sign_up(
		IN i_username VARCHAR(40),
        IN i_site_name VARCHAR(40),
        IN i_appt_date date,
        IN i_appt_time time,
        IN i_test_id INT
)
sp_main: BEGIN
	if i_username is null or i_site_name is null or i_appt_date is null or i_appt_time is null or i_test_id is null then leave sp_main; end if;
    if i_username in (select username from test join appointment where appt_site = site_name and test.appt_date = appointment.appt_date and test.appt_time = appointment.appt_time and test_status = 'pending') then leave sp_main; end if;
	set @nullUser = (select username from appointment where site_name = i_site_name and appt_date = i_appt_date and appt_time = i_appt_time);
    if @nullUser is not null then leave sp_main; end if; 
    if i_test_id in (select test_id from test) then leave sp_main; end if;
-- Type solution below
	UPDATE appointment
    SET username = i_username
    WHERE site_name = i_site_name and appt_date = i_appt_date and appt_time = i_appt_time;
	INSERT into test VALUES (i_test_id, 'pending', null, i_site_name, i_appt_date, i_appt_time);
-- End of solution
END //
DELIMITER ;

-- Number: 8a
-- Author: lvossler3
-- Name: tests_processed
DROP PROCEDURE IF EXISTS tests_processed;
DELIMITER //
CREATE PROCEDURE tests_processed(
    IN i_start_date date,
    IN i_end_date date,
    IN i_test_status VARCHAR(10),
    IN i_lab_tech_username VARCHAR(40))
sp_main: BEGIN
	set @start_date = (select min(appt_date) from test);
    set @end_date = (select max(appt_date) from test);
    if i_start_date is null then set i_start_date = @start_date; end if;
    if i_end_date is null then set i_end_date = @end_date; end if;
    DROP TABLE IF EXISTS tests_processed_result;
    CREATE TABLE tests_processed_result(
        test_id VARCHAR(7),
        pool_id VARCHAR(10),
        test_date date,
        process_date date,
        test_status VARCHAR(10) );
    
	if i_lab_tech_username is null and i_test_status is null then
    INSERT INTO tests_processed_result 
    select test_id, test.pool_id, appt_date as test_date, process_date, test_status 
	from test join pool on test.pool_id = pool.pool_id
    where (appt_date between i_start_date and i_end_date); leave sp_main; end if;
    
	if i_lab_tech_username is null then
    INSERT INTO tests_processed_result
    select test_id, test.pool_id, appt_date as test_date, process_date, test_status 
	from test join pool on test.pool_id = pool.pool_id
    where (appt_date between i_start_date and i_end_date) and test_status = i_test_status; leave sp_main; end if;
    
    if i_test_status is null then
    INSERT INTO tests_processed_result 
	select test_id, test.pool_id, appt_date as test_date, process_date, test_status 
	from test join pool on test.pool_id = pool.pool_id
    where (appt_date between i_start_date and i_end_date) and processed_by = i_lab_tech_username; leave sp_main; end if;
    
    INSERT INTO tests_processed_result
	select test_id, test.pool_id, appt_date as test_date, process_date, test_status 
	from test join pool on test.pool_id = pool.pool_id
    where (appt_date between i_start_date and i_end_date) and test_status = i_test_status and processed_by = i_lab_tech_username;
    END //
    DELIMITER ;
    
select test_id, test.pool_id, appt_date, process_date, test_status 
from test join pool on test.pool_id = pool.pool_id
where appt_date between '2020-09-01' and '2020-09-07' and test_status = 'positive' and processed_by = 'ygao10';
	CALL tests_processed(NULL, '2020-09-07', 'positive', 'ygao10');
		CALL tests_processed(NULL, NULL, 'positive', NULL);
    	CALL tests_processed(NULL, NULL, NULL, 'ygao10');
		-- [GOOD] tests start_date filter
	CALL tests_processed('2020-09-03', NULL, NULL, 'jhilborn98');
		-- [GOOD] tests end_date and status filters
	CALL tests_processed(NULL, '2020-09-07', 'positive', 'ygao10');
    select * from tests_processed_result;
-- ID: 9a
-- Author: ahatcher8@
-- Name: view_pools
DROP PROCEDURE IF EXISTS view_pools;
DELIMITER //
CREATE PROCEDURE view_pools(
    IN i_begin_process_date DATE,
    IN i_end_process_date DATE,
    IN i_pool_status VARCHAR(20),
    IN i_processed_by VARCHAR(40)
)
BEGIN
    DROP TABLE IF EXISTS view_pools_result;
    CREATE TABLE view_pools_result(
        pool_id VARCHAR(10),
        test_ids VARCHAR(100),
        date_processed DATE,
        processed_by VARCHAR(40),
        pool_status VARCHAR(20));

    INSERT INTO view_pools_result
-- Type solution below


    SELECT pool.pool_id, GROUP_CONCAT(test_id SEPARATOR ','), process_date, processed_by, pool_status FROM pool
    JOIN test ON test.pool_id = pool.pool_id
    WHERE (i_end_process_date IS NULL OR process_date <= i_end_process_date)
    AND (i_begin_process_date IS NULL OR (process_date >= i_begin_process_date OR process_date IS NULL))
    AND (i_pool_status IS NULL OR pool_status = i_pool_status)
    AND (i_processed_by IS NULL OR processed_by LIKE CONCAT('%', i_processed_by, '%'))
    GROUP BY pool_id;

-- End of solution
END //
DELIMITER ;

-- ID: 10a
-- Author: ahatcher8@
-- Name: create_pool
DROP PROCEDURE IF EXISTS create_pool;
DELIMITER //
CREATE PROCEDURE create_pool(
	IN i_pool_id VARCHAR(10),
    IN i_test_id VARCHAR(7)
)
BEGIN
-- Type solution below
DECLARE assigned VARCHAR(10);
DECLARE pool_exists INT;
DECLARE test_exists INT;
SELECT pool_id INTO assigned FROM test WHERE test_id = i_test_id;
SELECT COUNT(*) INTO pool_exists FROM pool WHERE pool_id = i_pool_id;
SELECT COUNT(*) INTO test_exists FROM test WHERE test_id=i_test_id;
IF (assigned IS NULL AND pool_exists=0 AND test_exists>0) THEN
INSERT INTO pool (pool_id, pool_status, process_date, processed_by) VALUES (i_pool_id, 'pending', NULL, NULL);
UPDATE test SET pool_id = i_pool_id WHERE test_id = i_test_id;
END IF;
-- End of solution
END //
DELIMITER ;

-- ID: 10b
-- Author: ahatcher8@
-- Name: assign_test_to_pool
DROP PROCEDURE IF EXISTS assign_test_to_pool;
DELIMITER //
CREATE PROCEDURE assign_test_to_pool(
    IN i_pool_id VARCHAR(10),
    IN i_test_id VARCHAR(7)
)
BEGIN
-- Type solution below
DECLARE no_in_pool INT;
DECLARE assigned VARCHAR(10);
SELECT COUNT(*) INTO no_in_pool FROM test WHERE pool_id = i_pool_id GROUP BY pool_id;
SELECT pool_id INTO assigned FROM test WHERE test_id = i_test_id;

IF (no_in_pool < 7 AND no_in_pool > 0 AND assigned IS NULL) THEN UPDATE test SET pool_id=i_pool_id WHERE test_id = i_test_id;
END IF;


-- End of solution
END //
DELIMITER ;

-- ID: 11a
-- Author: ahatcher8@
-- Name: process_pool
DROP PROCEDURE IF EXISTS process_pool;
DELIMITER //
CREATE PROCEDURE process_pool(
    IN i_pool_id VARCHAR(10),
    IN i_pool_status VARCHAR(20),
    IN i_process_date DATE,
    IN i_processed_by VARCHAR(40)
)
BEGIN
-- Type solution below

    SELECT pool_status
    INTO @curr_status
    FROM POOL
    WHERE pool_id = i_pool_id;

    IF
        ((@curr_status = 'pending') AND (i_pool_status = 'positive' OR i_pool_status = 'negative'))
    THEN
        UPDATE POOL
        SET pool_status = i_pool_status, process_date = i_process_date, processed_by = i_processed_by
        WHERE pool_id = i_pool_id;
    END IF;


-- End of solution
END //
DELIMITER ;

-- ID: 11b
-- Author: ahatcher8@
-- Name: process_test
DROP PROCEDURE IF EXISTS process_test;
DELIMITER //
CREATE PROCEDURE process_test(
    IN i_test_id VARCHAR(7),
    IN i_test_status VARCHAR(20)
)
BEGIN
-- Type solution below
DECLARE pool_stat VARCHAR(20);
SELECT pool_status INTO pool_stat FROM test JOIN pool ON pool.pool_id = test.pool_id WHERE test_id = i_test_id;
IF (pool_stat = 'negative' AND i_test_status = 'negative') THEN
UPDATE test SET test_status = i_test_status 
WHERE test_id = i_test_id
AND test_status = 'pending';
END IF;

IF (pool_stat = 'positive' AND (i_test_status = 'negative' OR i_test_status = 'positive')) THEN
UPDATE test SET test_status = i_test_status 
WHERE test_id = i_test_id
AND test_status = 'pending';
END IF;

-- End of solution
END //
DELIMITER ;

-- ID: 12a
-- Author: dvaidyanathan6
-- Name: create_appointment

DROP PROCEDURE IF EXISTS create_appointment;
DELIMITER //
CREATE PROCEDURE create_appointment(
	IN i_site_name VARCHAR(40),
    IN i_date DATE,
    IN i_time TIME
)
sp_main: BEGIN
-- Type solution below
set @num_appointments = (select count(*) from appointment where username is null and appt_date = i_date and site_name = i_site_name);
set @max_appointments = (select count(username)*10 from working_at where site = i_site_name); 
if @num_appointments > @max_appointments - 1 then leave sp_main; end if;
INSERT into appointment VALUES (null, i_site_name, i_date, i_time);
-- End of solution
END //
DELIMITER ;
(select count(username)*10 from working_at where site = 'Bobby Dodd Stadium'); 
(select count(*) from appointment where username is null and appt_date = '2020-11-14' and site_name = 'Bobby Dodd Stadium');
-- ID: 13a
-- Author: dvaidyanathan6@
-- Name: view_appointments
DROP PROCEDURE IF EXISTS view_appointments;
DELIMITER //
CREATE PROCEDURE view_appointments(
    IN i_site_name VARCHAR(40),
    IN i_begin_appt_date DATE,
    IN i_end_appt_date DATE,
    IN i_begin_appt_time TIME,
    IN i_end_appt_time TIME,
    IN i_is_available INT  -- 0 for "booked only", 1 for "available only", NULL for "all"
)
sp_main: BEGIN
    DROP TABLE IF EXISTS view_appointments_result;
    CREATE TABLE view_appointments_result(
        appt_date DATE,
        appt_time TIME,
        site_name VARCHAR(40),
        location VARCHAR(40),
        username VARCHAR(40));

	set @starting_date = (select min(appt_date) from appointment);
    if i_begin_appt_date is NULL then set i_begin_appt_date = @starting_date; end if;
    set @ending_date = (select max(appt_date) from appointment);
    if i_end_appt_date is NULL then set i_end_appt_date = @ending_date; end if;
    set @starting_time = (select min(appt_time) from appointment);
    if i_begin_appt_time is NULL then set i_begin_appt_time = @starting_time; end if;
    set @ending_time = (select max(appt_time) from appointment);
    if i_end_appt_time is NULL then set i_end_appt_time = @ending_time; end if;
    
    if i_site_name is NULL and i_is_available = 0 then 
	INSERT INTO view_appointments_result
	select appt_date, appt_time, appointment.site_name, location, username
	from appointment join site on appointment.site_name = site.site_name
	where username is not null and (appt_date between i_begin_appt_date and i_end_appt_date) and (appt_time between i_begin_appt_time and i_end_appt_time); leave sp_main; end if; 
    
    if i_site_name is NULL and i_is_available = 1 then 
	INSERT INTO view_appointments_result
	select appt_date, appt_time, appointment.site_name, location, username
	from appointment join site on appointment.site_name = site.site_name
	where username is null and (appt_date between i_begin_appt_date and i_end_appt_date) and (appt_time between i_begin_appt_time and i_end_appt_time); leave sp_main; end if;
    
    if i_site_name is NULL and i_is_available is null then 
	INSERT INTO view_appointments_result
	select appt_date, appt_time, appointment.site_name, location, username
	from appointment join site on appointment.site_name = site.site_name
	where (appt_date between i_begin_appt_date and i_end_appt_date) and (appt_time between i_begin_appt_time and i_end_appt_time); leave sp_main; end if;
    
    if i_site_name is not NULL and i_is_available = 0 then 
	INSERT INTO view_appointments_result
	select appt_date, appt_time, appointment.site_name, location, username
	from appointment join site on appointment.site_name = site.site_name
	where username is not null and (appt_date between i_begin_appt_date and i_end_appt_date) and (appt_time between i_begin_appt_time and i_end_appt_time) and appointment.site_name = i_site_name; leave sp_main; end if;

	if i_site_name is not NULL and i_is_available = 1 then 
	INSERT INTO view_appointments_result
	select appt_date, appt_time, appointment.site_name, location, username
	from appointment join site on appointment.site_name = site.site_name
	where username is null and (appt_date between i_begin_appt_date and i_end_appt_date) and (appt_time between i_begin_appt_time and i_end_appt_time) and appointment.site_name = i_site_name; leave sp_main; end if;		
       
	INSERT INTO view_appointments_result
	select appt_date, appt_time, appointment.site_name, location, username
	from appointment join site on appointment.site_name = site.site_name
	where (appt_date between i_begin_appt_date and i_end_appt_date) and (appt_time between i_begin_appt_time and i_end_appt_time) and appointment.site_name = i_site_name;
END //
DELIMITER ;
    
-- ID: 14a
-- Author: kachtani3@
-- Name: view_testers
DROP PROCEDURE IF EXISTS view_testers;
DELIMITER //
CREATE PROCEDURE view_testers()
BEGIN
    DROP TABLE IF EXISTS view_testers_result;
    CREATE TABLE view_testers_result(

        username VARCHAR(40),
        name VARCHAR(80),
        phone_number VARCHAR(10),
        assigned_sites VARCHAR(255));

    INSERT INTO view_testers_result
-- Type solution below

	select e.username, name, phone_num, f.assigned_sites from (
	select username, CONCAT(fname," ", lname) as name, phone_num from (
	SELECT * FROM sitetester as a
	left join USER as b on b.username=a.sitetester_username) as c
	left join employee as d on d.emp_username=c.sitetester_username) as e 
	left join (
	select username, GROUP_CONCAT(site Order By site SEPARATOR',' ) AS assigned_sites FROM WORKING_AT group by username) as f on e.username=f.username;


-- End of solution
END //
DELIMITER ;

-- ID: 15a
-- Author: kachtani3@
-- Name: create_testing_site
DROP PROCEDURE IF EXISTS create_testing_site;
DELIMITER //
CREATE PROCEDURE create_testing_site(
	IN i_site_name VARCHAR(40),
    IN i_street varchar(40),
    IN i_city varchar(40),
    IN i_state char(2),
    IN i_zip char(5),
    IN i_location varchar(40),
    IN i_first_tester_username varchar(40)
)
BEGIN
-- Type solution below

	insert into SITE values (i_site_name, i_street, i_city, i_state, i_zip, i_location);
    insert into WORKING_AT values (i_first_tester_username, i_site_name);

-- End of solution
END //
DELIMITER ;

-- ID: 16a
-- Author: kachtani3@
-- Name: pool_metadata
DROP PROCEDURE IF EXISTS pool_metadata;
DELIMITER //
CREATE PROCEDURE pool_metadata(
    IN i_pool_id VARCHAR(10))
BEGIN
    DROP TABLE IF EXISTS pool_metadata_result;
    CREATE TABLE pool_metadata_result(
        pool_id VARCHAR(10),
        date_processed DATE,
        pooled_result VARCHAR(20),
        processed_by VARCHAR(100));

    INSERT INTO pool_metadata_result
-- Type solution below

    SELECT pool_id, process_date, pool_status, concat(fname, ' ', lname)
    FROM pool
    JOIN user ON username = processed_by
    WHERE pool_id = i_pool_id;

-- End of solution
END //
DELIMITER ;

-- ID: 16b
-- Author: kachtani3@
-- Name: tests_in_pool
DROP PROCEDURE IF EXISTS tests_in_pool;
DELIMITER //
CREATE PROCEDURE tests_in_pool(
    IN i_pool_id VARCHAR(10))
BEGIN
    DROP TABLE IF EXISTS tests_in_pool_result;
    CREATE TABLE tests_in_pool_result(
        test_id varchar(7),
        date_tested DATE,
        testing_site VARCHAR(40),
        test_result VARCHAR(20));

    INSERT INTO tests_in_pool_result
-- Type solution below

    SELECT test_id, appt_date, appt_site, test_status FROM test
    WHERE pool_id = i_pool_id;

-- End of solution
END //
DELIMITER ;

-- ID: 17a
-- Author: kachtani3@
-- Name: tester_assigned_sites
DROP PROCEDURE IF EXISTS tester_assigned_sites;
DELIMITER //
CREATE PROCEDURE tester_assigned_sites(
    IN i_tester_username VARCHAR(40))
BEGIN
    DROP TABLE IF EXISTS tester_assigned_sites_result;
    CREATE TABLE tester_assigned_sites_result(
        site_name VARCHAR(40));

    INSERT INTO tester_assigned_sites_result
-- Type solution below
	-- should check whetheer user in appointemnt
    SELECT site FROM WORKING_AT WHERE username=i_tester_username;

-- End of solution
END //
DELIMITER;

-- ID: 17b
-- Author: kachtani3@
-- Name: assign_tester
DROP PROCEDURE IF EXISTS assign_tester;
DELIMITER //
CREATE PROCEDURE assign_tester(
	IN i_tester_username VARCHAR(40),
    IN i_site_name VARCHAR(40)
)
BEGIN
-- Type solution below

	INSERT INTO WORKING_AT VALUES (i_tester_username, i_site_name);

-- End of solution
END //
DELIMITER ;


-- ID: 17c
-- Author: kachtani3@
-- Name: unassign_tester
DROP PROCEDURE IF EXISTS unassign_tester;
DELIMITER //
CREATE PROCEDURE unassign_tester(
	IN i_tester_username VARCHAR(40),
    IN i_site_name VARCHAR(40)
)
BEGIN
-- Type solution below
	-- should check number of site_name if else
	DECLARE number DECIMAL DEFAULT 0;
    
    SELECT COUNT(*) INTO number FROM WORKING_AT WHERE site=i_site_name;
    
    IF number > 1 THEN
		DELETE FROM WORKING_AT WHERE site=i_site_name AND username=i_tester_username;
    END IF;

-- End of solution
END //
DELIMITER ;

-- ID: 18a
-- Author: lvossler3
-- Name: daily_results
DROP PROCEDURE IF EXISTS daily_results;
DELIMITER //
CREATE PROCEDURE daily_results()
BEGIN
	DROP TABLE IF EXISTS daily_results_result;
    CREATE TABLE daily_results_result(
		process_date date,
        num_tests int,
        pos_tests int,
        pos_percent DECIMAL(6,2));
	INSERT INTO daily_results_result
    -- Type solution below

    select d.process_date, d.num_tests, IFNULL(e.pos_tests, 0), IFNULL(round(e.pos_tests/d.num_tests * 100, 2), 0.00) from (
	select count(*) as num_tests, process_date from (
	SELECT a.test_status, a.pool_id, b.process_date FROM test as a
	left join pool as b on a.pool_id=b.pool_id where a.test_status != "pending") as c group by process_date) as d
	left join (
	select count(*) AS pos_tests, process_date from (
	SELECT a.test_status, a.pool_id, b.process_date FROM test as a
	left join pool as b on a.pool_id=b.pool_id where a.test_status != "pending") as c where test_status="Positive" group by process_date) as e on d.process_date=e.process_date;


    -- End of solution
    END //
    DELIMITER ;
