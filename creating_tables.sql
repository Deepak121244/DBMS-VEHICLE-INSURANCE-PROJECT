
use T14_Vehical_insurance;
create database if not exists T14_Vehical_insurance;

CREATE TABLE if not exists customer(
    cust_id varchar(20) primary key,
    cust_fname VARCHAR(10),
    cust_lname VARCHAR(10),
    cust_DOB DATE,
    cust_gender CHAR(2),
    cust_mob_number decimal(10,0),
    cust_email VARCHAR(20),
    cust_passport_number VARCHAR(20),
    cust_martial_status CHAR(10),
    cust_ppS_number char(9)
);

CREATE TABLE IF NOT EXISTS `Application`(
    application_id VARCHAR(20) primary key,
    cust_id VARCHAR(20),
    vehicle_id VARCHAR(20),
    application_status CHAR(8),
    coverage VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS quote(
    quote_id VARCHAR(20) primary key,
    application_id VARCHAR(20),
    cust_id varchar(20),
    issue_date DATETIME,
    valid_from_date DATETIME,
    valid_till_date DATETIME,
    `description` VARCHAR(100),
    product_id VARCHAR(20),
    coverage_level VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS insurance_policy(
    aggrement_id VARCHAR(20) primary key,
    application_id VARCHAR(20),
    cust_id varchar(20),
    depatment_name VARCHAR(20),
    policy_number VARCHAR(20),
    `start_date` DATETIME,
    `expiry_date` DATETIME,
    term_condition_description VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS premium_payment(    
    premium_payment_id VARCHAR(20) primary key,
    cust_id VARCHAR(20),
    policy_number VARCHAR(20),
    premium_payment_schedule DATETIME,
    premium_payment_amount INTEGER,
    Receipt_id VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS vehicle(
    vehicle_id	VARCHAR(20) primary key,
    cust_id	VARCHAR(20),
    policy_id	VARCHAR(20),
    dependent_nok_id	VARCHAR(20),
    vehicle_registration_number	VARCHAR(20),
    vehicle_value INTEGER,
    vehicle_type VARCHAR(20),
    vehicle_size INTEGER,
    vehicle_number_of_seat INTEGER,
    vehicle_manufacturer VARCHAR(20),
    vehicle_engine_number INTEGER,
    vehicle_chasis_number INTEGER,
    vehicle_number VARCHAR(20),
    vehicle_model_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS claim(
    claim_id	    VARCHAR(20) primary key,
    cust_id	        VARCHAR(20),
    agreement_id	VARCHAR(20),
    claim_amount	INTEGER,
    incident_id	    VARCHAR(20),
    damage_type	    VARCHAR(20),
    date_of_claim	DATE,
    claim_status	CHAR(10)
);

CREATE TABLE IF NOT EXISTS claim_settlement(     -- settlement to clam_settelment
    claim_settlement_id VARCHAR(20) primary key,
    claim_id VARCHAR(20),
    cust_id VARCHAR(20),
    vehicle_id VARCHAR(20),
    date_settled DATE,
    amount_paid INTEGER,
    coverage_id VARCHAR(20)  
);
CREATE TABLE IF NOT EXISTS staff(
    staff_id VARCHAR(20) primary key,
    company_name VARCHAR(20),
    staff_fname VARCHAR(10),
    staff_lname VARCHAR(10),
    staff_address VARCHAR(20),
    staff_contact INTEGER,
    staff_gender CHAR(2),
    staff_marital_status CHAR(8),
    staff_nationality CHAR(15),
    staff_qualification VARCHAR(20),
    staff_allowance INTEGER,
    staff_pps_number INTEGER
);
CREATE TABLE IF NOT EXISTS department(
    department_name	 VARCHAR(20) primary key,
    company_name VARCHAR(20),
    office	 VARCHAR(20),
    contact_information	VARCHAR(20),
    department_staff VARCHAR(50),
    department_leader VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS office(
    office_name VARCHAR(20) primary key,
    department_name VARCHAR(20),
    company_name VARCHAR(20),
    office_leader VARCHAR(20),
    contact_information VARCHAR(20),
    `address` VARCHAR(20),
    admin_cost	 INTEGER,
    staff	 VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS membership(
    membership_id	VARCHAR(20) primary key,
    cust_id	VARCHAR(20),
    membership_type	CHAR(15),
    organisation_contact VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS vehicle_service(
    vehicle_service	VARCHAR(20) primary key,
    vehicle_id	VARCHAR(20),
    cust_id	VARCHAR(20),
    department_name	CHAR(20),
    vehicle_service_address	VARCHAR(20),
    vehicle_service_contact	VARCHAR(20),
    vehicle_service_incharge CHAR(20),
    vehicle_service_type VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS NOK(
    nok_id	VARCHAR(20) primary key,
    agreement_id VARCHAR(20),
    application_id VARCHAR(20),
    cust_id	VARCHAR(20),
    nok_name VARCHAR(20),
    nok_address	VARCHAR(20),
    nok_phone_number INTEGER,
    nok_marital_status CHAR(8),
    nok_gender CHAR(2)	
);
CREATE TABLE IF NOT EXISTS insurance_company(  -- company to insurance_company
    company_name	VARCHAR(20) primary key,
    company_address	VARCHAR(20),
    company_contact_number	INTEGER,
    company_fax	INTEGER,
    company_email VARCHAR(20),
    company_website VARCHAR(20),
    company_location VARCHAR(20),
    company_department_name VARCHAR(20),
    company_office_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS POLICY_RENEWABLE(
    policy_renewable_id	VARCHAR(20) primary key,
	agreement_id VARCHAR(100),
    application_id VARCHAR(20),
    cust_id	 VARCHAR(20),
    date_of_renewal	 DATE,
    type_of_renewal	 CHAR(15)
);

CREATE TABLE IF NOT EXISTS incident(
    INCIDENT_ID	VARCHAR(20) primary key,
    INCIDENT_TYPE	VARCHAR(30),
    INCIDENT_DATE DATE,
    `DESCRIPTION` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS incident_report(
    incident_report_id	VARCHAR(20) primary key,
    incident_id	VARCHAR(20),
    cust_id	VARCHAR(20),
    incident_inspector	VARCHAR(20),
    incident_cost	INTEGER,
    incident_type	CHAR(10),
    incident_report_description	VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS coverage(            -- terms and conditions
    coverage_id	VARCHAR(20) primary key,
    company_name	VARCHAR(20),
    coverage_amount	INTEGER,
    coverage_type	CHAR(10),
    coverage_level	CHAR(15),
    product_id	VARCHAR(20),
    coverage_description	VARCHAR(100),
    coverage_terms	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS product(
    product_number	VARCHAR(20) primary key,
    company_name	VARCHAR(20),
    product_price	INTEGER,
    product_type	CHAR(15)
);

CREATE TABLE IF NOT EXISTS receipt(
    receipt_id	 VARCHAR(20) primary key,
    premium_payment_id	 VARCHAR(20),
    cust_id	 VARCHAR(20),
    cost INTEGER,
    `time` DATE
);

CREATE TABLE IF NOT EXISTS insurance_policy_coverage(
    agreement_id VARCHAR(20) primary key,	
    coverage_id	 VARCHAR(20)
    );
show tables;
describe customer;
describe application;
describe quote;
describe insurance_policy;
describe premium_payment;
describe vehicle;
describe claim;
describe claim_settlement;
describe staff;
describe department;
describe office;
describe membership;
describe vehicle_service;
describe nok;
describe insurance_company;
describe policy_renewable;
describe incident;
describe incident_report;
describe coverage;
describe product;
describe receipt;
describe insurance_Policy_coverage;
