USE T14_DBMS_PROJECT_VEHICLE_INSURANCE;
CALL get_data(); -- query for getting data
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# query 1
-- query with basic joins
-- claim status is checked and vehicle and customer details are generated acccordingly using joins
-- TRIED USING EXCEPT CLAUSE BUT FAILED
SELECT 
	c.T14_cust_id,CONCAT(T14_cust_fname, ' ', T14_cust_lname) AS cust_name,v.T14_vehicle_id,T14_CLAIM_STATUS,T14_incident_id
FROM
    T14_claim cl
        JOIN
    T14_vehicle v ON v.T14_policy_id= cl.T14_agreement_id
        JOIN
     T14_customer c ON c.T14_cust_id = v.T14_cust_id
WHERE
    T14_incident_id IS NOT NULL AND T14_claim_status LIKE 'pending';
    

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# query 2
-- query with basic sub queries and views
-- the having clause gave inappropriate rsult so we procceded with sub querires and views
-- the view is create as an alternative to sum function
CREATE VIEW cust_sum AS
    SELECT SUM(T14_cust_id)
    FROM T14_customer;

SELECT * FROM T14_CUSTOMER
	WHERE T14_CUST_ID IN (SELECT T14_CUST_ID FROM T14_PREMIUM_PAYMENT
		WHERE T14_premium_payment_amount >(SELECT * FROM cust_sum));

SELECT * 
FROM T14_CUSTOMER 
WHERE T14_CUST_ID IN (
	SELECT T14_CUST_ID FROM T14_PREMIUM_PAYMENT 
		WHERE T14_premium_payment_amount > (SELECT SUM(T14_cust_id) FROM T14_customer));
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# query 3
-- companines with departments in more than one location
-- companies with no of products morethan departments 
-- departments don't have any address so in this query we used the offcie address for the department assuming that each department has 
-- an office with address at a specific location
-- in this query after joining we get repeated product_numbers and repaeated department numbers with office
-- but we just want distict product numbers under different companies not same product no under same company so we use distinct for product

SELECT *
FROM t14_insurance_companies
WHERE t14_company_name IN (SELECT 
            o.t14_company_name
        FROM t14_PRODUCT p
                INNER JOIN 
                t14_OFFICE o ON o.t14_Company_Name = p.t14_Company_Name
        GROUP BY o.t14_Company_Name
        HAVING COUNT(DISTINCT (t14_Product_Number)) < COUNT(DISTINCT (t14_Department_Name))
            AND COUNT(t14_address) > 1);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# query 4
-- according to the data reciept entries are given only to those T14_customer who applied for premium and got confirmed
-- customers 3011,3012,3015,3016,3019 are T14_customers with multiple vehicles
-- customers 3011,3013,3014,3015,3016,3019,3021 are involved in accident
-- customers 3012,3013,3016 didn't apply for premium
-- the first join is made only to retrive T14_vehicle details and T14_customer details combined
SELECT T14_vehicle_id,T14_cust_id FROM T14_vehicle WHERE T14_cust_id IN(SELECT T14_cust_id FROM T14_vehicle GROUP BY T14_cust_id HAVING count(T14_cust_id)>1);
SELECT T14_CUST_ID,T14_INCIDENT_type FROM t14_INCIDENT_report where T14_incident_type like "%accident%" order by T14_cust_id;
select c.t14_cust_id from t14_customer c join t14_premium_payment p on c.t14_cust_id=p.t14_cust_id;

SELECT T14_customer.*
FROM T14_Customer
WHERE
    T14_customer.T14_cust_id IN (
    SELECT c.T14_cust_id
	FROM T14_customer c
	JOIN t14_incident_report IR 
		ON c.T14_cust_id = IR.T14_cust_id
		LEFT JOIN
			t14_receipt R ON c.T14_cust_id = r.T14_cust_id
        WHERE c.T14_cust_id IN (
			SELECT v.T14_cust_id
                FROM T14_vehicle V
                GROUP BY T14_cust_id
                HAVING COUNT(V.T14_cust_id) > 1)
                AND R.t14_receipt_id IS NULL
                AND T14_incident_type LIKE '%accident%');

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# query 5
-- query with function
-- since datatype of vehicle number is varchar(30) and is of form 'AP XX AA YYYY',a function is created to convert YYYY Into unsigned integer

DELIMITER //
CREATE FUNCTION get_vehicle_number(vehicle_number VARCHAR(20))
RETURNS INTEGER
DETERMINISTIC
BEGIN
    DECLARE vehical_no INTEGER; 
    SET vehical_no = CAST(SUBSTR(vehicle_number,7,4) AS UNSIGNED);
    RETURN vehical_no;
END //
DELIMITER ;

SELECT t14_vehicle.*
FROM t14_vehicle
	JOIN t14_premium_payment ON t14_vehicle.T14_cust_id = t14_premium_payment.T14_cust_id
WHERE t14_premium_payment_amount > GET_VEHICLE_NUMBER(t14_vehicle_number);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# query 6
-- CUSTOMER 3011 3012 3014 3015 3016 3017 3019 HAVE CLAIM AMOUNT < COVERAGE AMOUNT
DELIMITER //
CREATE FUNCTION SUM_OF_INDEXES(A VARCHAR(20),B VARCHAR(20),C VARCHAR(20),D VARCHAR(20))
RETURNS INTEGER
DETERMINISTIC
BEGIN
    DECLARE SUM_OF_ID INTEGER; 
    SET SUM_OF_ID = CAST(A AS UNSIGNED)+CAST(B AS UNSIGNED)+CAST(C AS UNSIGNED)+CAST(D AS UNSIGNED);
    RETURN SUM_OF_ID;
END //
DELIMITER ;

SELECT * FROM T14_CUSTOMER WHERE T14_CUST_ID IN
	(SELECT CL.T14_CUST_ID 
    FROM T14_COVERAGE CV
		JOIN T14_INSURANCE_POLICY_COVERAGE `IPC` ON `IPC`.T14_COVERAGE_ID=CV.T14_COVERAGE_ID
        JOIN T14_INSURANCE_POLICY IP ON `IPC`.T14_AGREEMENT_ID=IP.T14_AGGREMENT_ID
        JOIN T14_CUSTOMER C ON IP.T14_CUST_ID = C.T14_CUST_ID
        JOIN T14_CLAIM CL ON CL.T14_CUST_ID = C.T14_CUST_ID 
        JOIN T14_CLAIM_SETTLEMENT CLS ON CL.T14_CLAIM_ID = CLS.T14_CLAIM_ID
        JOIN T14_VEHICLE V ON V.T14_CUST_ID = C.T14_CUST_ID
        WHERE T14_COVERAGE_AMOUNT>T14_CLAIM_AMOUNT 
        AND T14_CLAIM_AMOUNT>(SUM_OF_INDEXES(CL.T14_CUST_ID,CLS.T14_CLAIM_ID,CLS.T14_CLAIM_SETTLEMENT_ID,V.T14_VEHICLE_ID)));

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
