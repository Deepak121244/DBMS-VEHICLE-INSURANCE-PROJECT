drop database if exists t14_DBMS_PROJECT_vehicle_insurance;
create database if not exists T14_DBMS_PROJECT_Vehicle_insurance;

use T14_DBMS_PROJECT_Vehicle_insurance;

CREATE TABLE if not exists `t14_customer`(
    t14_cust_id varchar(20) primary key,
    t14_cust_fname VARCHAR(10) NOT NULL,
    t14_cust_lname VARCHAR(10) NOT NULL,
    t14_cust_DOB DATE NOT NULL,
    t14_cust_gender CHAR(2) NOT NULL,
    t14_cust_mob_number decimal(10,0) NOT NULL,
    t14_cust_email VARCHAR(225) NOT NULL,
    t14_cust_passport_number VARCHAR(20) NOT NULL,
    t14_cust_martial_status CHAR(10) NOT NULL,
    t14_cust_ppS_number char(9) NOT NULL
);

CREATE TABLE IF NOT EXISTS `t14_Application`(
    t14_application_id VARCHAR(20) primary key,
    t14_cust_id VARCHAR(20) NOT NULL,
    t14_vehicle_id VARCHAR(20) NOT NULL,
    t14_application_status ENUM("accepted","rejected","pending") DEFAULT 'pending',
    t14_coverage VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `t14_quote`(
    t14_quote_id VARCHAR(20) primary key NOT NULL,
    t14_application_id VARCHAR(20)  NOT NULL,
    t14_cust_id varchar(20)  NOT NULL,
    t14_issue_date DATETIME  NOT NULL,
    t14_valid_from_date DATETIME NOT NULL,
    t14_valid_till_date DATETIME NOT NULL,
    t14_description VARCHAR(100) NOT NULL,
    t14_product_id VARCHAR(20) NOT NULL,
    t14_coverage_level VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS `t14_insurance_policy`(
    t14_aggrement_id VARCHAR(20) primary key,
    t14_application_id VARCHAR(20) NOT NULL,
    t14_cust_id varchar(20) NOT NULL,
    t14_department_name VARCHAR(20) NOT NULL,
    t14_policy_number VARCHAR(20) NOT NULL,
    t14_start_date DATETIME NOT NULL,
    t14_expiry_date DATETIME NOT NULL,
    t14_term_condition_description VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS `t14_premium_payment`(
    t14_premium_payment_id VARCHAR(20) primary key,
    t14_cust_id VARCHAR(20) NOT NULL,
    t14_policy_number VARCHAR(20) NOT NULL,
    t14_premium_payment_schedule DATETIME NOT NULL,
    t14_premium_payment_amount INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `t14_vehicle`(
    t14_vehicle_id	VARCHAR(20) primary key,
    t14_cust_id	VARCHAR(20) NOT NULL,
    t14_policy_id	VARCHAR(20) NOT NULL,
    t14_dependent_nok_id	VARCHAR(20) NOT NULL,
    t14_vehicle_registration_number	VARCHAR(20) NOT NULL,
    t14_vehicle_value INTEGER,
    t14_vehicle_type VARCHAR(20) NOT NULL,
    t14_vehicle_size INTEGER,
    t14_vehicle_number_of_seat INTEGER,
    t14_vehicle_manufacturer VARCHAR(20) NOT NULL,
    t14_vehicle_chasis_number varchar(30) NOT NULL,
    t14_vehicle_number VARCHAR(20) NOT NULL,
    t14_vehicle_model_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS `t14_claim`(
    t14_claim_id	    VARCHAR(20) primary key,
    t14_cust_id	        VARCHAR(20) NOT NULL,
    t14_agreement_id	VARCHAR(20) NOT NULL,
    t14_claim_amount	INTEGER NOT NULL,
    t14_incident_id	    VARCHAR(20) ,
    t14_damage_type	    VARCHAR(20),
    t14_date_of_claim	DATE NOT NULL,
    t14_claim_status	ENUM("accepted","rejected","pending") DEFAULT 'pending'
);

CREATE TABLE IF NOT EXISTS `t14_claim_settlement`(
    t14_claim_settlement_id VARCHAR(20) primary key,
    t14_claim_id VARCHAR(20) NOT NULL,
    t14_cust_id VARCHAR(20) NOT NULL,
    t14_vehicle_id VARCHAR(20) NOT NULL,
    t14_date_settled DATE,
    t14_amount_paid INTEGER NOT NULL,
    t14_coverage_id VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS `t14_staff`(
    t14_staff_id VARCHAR(20) primary key,
    t14_company_name VARCHAR(40) NOT NULL,
    t14_staff_fname VARCHAR(10) NOT NULL,
    t14_staff_lname VARCHAR(10) NOT NULL,
    t14_staff_address VARCHAR(20) NOT NULL,
    t14_staff_contact DECIMAL(10,0) NOT NULL,
    t14_staff_gender CHAR(2),
    t14_staff_marital_status CHAR(8),
    t14_staff_nationality CHAR(15),
    t14_staff_qualification VARCHAR(20),
    t14_staff_allowance INTEGER,
    t14_staff_pps_number INTEGER
);
CREATE TABLE IF NOT EXISTS `t14_department`(
    t14_department_name	 VARCHAR(50) primary key,
    t14_company_name VARCHAR(40) NOT NULL,
    t14_contact_information	VARCHAR(20) NOT NULL,
    t14_department_staff VARCHAR(50),
    t14_department_leader VARCHAR(30) NOT NULL
);
CREATE TABLE IF NOT EXISTS `t14_office`(
    t14_office_name VARCHAR(20) primary key NOT NULL,
    t14_department_name VARCHAR(20) NOT NULL,
    t14_company_name VARCHAR(40) NOT NULL,
    t14_office_leader VARCHAR(20) NOT NULL,
    t14_contact_information VARCHAR(20) NOT NULL,
    t14_address VARCHAR(20),
    t14_admin_cost INTEGER,
    t14_staff VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS `t14_membership`(
    t14_membership_id VARCHAR(20) primary key,
    t14_cust_id	VARCHAR(20) NOT NULL,
    t14_membership_type	CHAR(15),
    t14_organisation_contact VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS `t14_vehicle_service`(
    t14_vehicle_service	VARCHAR(20) primary key,
    t14_vehicle_id	VARCHAR(20) NOT NULL,
    t14_cust_id	VARCHAR(20) NOT NULL,
    t14_department_name	CHAR(20) NOT NULL,
    t14_vehicle_service_address	VARCHAR(20),
    t14_vehicle_service_contact	VARCHAR(20),
    t14_vehicle_service_incharge CHAR(20),
    t14_vehicle_service_type VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS `t14_NOK`(
    t14_nok_id	VARCHAR(20) primary key,
    t14_agreement_id VARCHAR(20) NOT NULL,
    t14_application_id VARCHAR(20) NOT NULL,
    t14_cust_id	VARCHAR(20) NOT NULL,
    t14_nok_name VARCHAR(20) NOT NULL,
    t14_nok_address	VARCHAR(20),
    t14_nok_phone_number INTEGER NOT NULL,
    t14_nok_marital_status ENUM("married","unmarried"),
    t14_nok_gender ENUM("m","f","o") NOT NULL
);
CREATE TABLE IF NOT EXISTS `t14_insurance_companies`(
    t14_company_name	VARCHAR(40) primary key,
    t14_company_address	VARCHAR(20) NOT NULL,
    t14_company_contact_number	decimal(10,0) NOT NULL,
    t14_company_fax	decimal(10,0) NOT NULL,
    t14_company_email VARCHAR(20) NOT NULL,
    t14_company_website VARCHAR(20),
    t14_company_location VARCHAR(20),
    t14_company_department_name VARCHAR(20),
    t14_company_office_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS `t14_POLICY_RENEWABLE`(
    t14_policy_renewable_id	VARCHAR(20) primary key,
	t14_agreement_id VARCHAR(100) NOT NULL,
    t14_application_id VARCHAR(20) NOT NULL,
    t14_cust_id	 VARCHAR(20) NOT NULL,
    t14_date_of_renewal	DATE,
    t14_type_of_renewal	 CHAR(15)
);

CREATE TABLE IF NOT EXISTS `t14_incident`(
    t14_INCIDENT_ID	VARCHAR(20) primary key,
    t14_INCIDENT_TYPE VARCHAR(30) NOT NULL,
    t14_INCIDENT_DATE DATE,
    `t14_DESCRIPTION` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `t14_incident_report`(
    t14_incident_report_id	VARCHAR(20) primary key,
    t14_incident_id	VARCHAR(20) NOT NULL,
    t14_cust_id	VARCHAR(20),
    t14_incident_inspector	VARCHAR(20),
    t14_incident_cost	INTEGER,
    t14_incident_type	CHAR(30),
    t14_incident_report_description	VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `t14_coverage`(
    t14_coverage_id	VARCHAR(20) primary key,
    t14_company_name	VARCHAR(40),
    t14_coverage_amount	INTEGER,
    t14_coverage_type	CHAR(50),
    t14_coverage_level	CHAR(15),
    t14_product_id	VARCHAR(20) NULL,
    t14_coverage_description VARCHAR(2000),
    t14_coverage_terms	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `t14_product`(
    t14_product_number	VARCHAR(20) primary key,
    t14_company_name	VARCHAR(40) NOT NULL,
    t14_product_price	INTEGER,
    t14_product_type	CHAR(15)
);

CREATE TABLE IF NOT EXISTS `t14_receipt`(
    t14_receipt_id	 VARCHAR(20) primary key,
    t14_premium_payment_id	 VARCHAR(20),
    t14_cust_id	 VARCHAR(20) NOT NULL,
    t14_cost INTEGER,
    t14_time DATE
);

CREATE TABLE IF NOT EXISTS `t14_insurance_policy_coverage`(
    t14_agreement_id VARCHAR(20) primary key,	
    t14_coverage_id	 VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `t14_company_staff`(
	t14_company_name varchar(40),
	t14_staff_id varchar(20),
    constraint c_s_id primary key(t14_company_name,t14_staff_id)
);
    
show tables;
describe t14_customer;
describe t14_application;
describe t14_quote;
describe t14_insurance_policy;
describe t14_premium_payment;
describe t14_vehicle;
describe t14_claim;
describe t14_claim_settlement;
describe t14_staff;
describe t14_department;
describe t14_office;
describe t14_membership;
describe t14_vehicle_service;
describe t14_nok;
describe t14_insurance_companies;
describe t14_policy_renewable;
describe t14_incident;
describe t14_incident_report;
describe t14_coverage;
describe t14_product;
describe t14_receipt;
describe t14_insurance_Policy_coverage;
