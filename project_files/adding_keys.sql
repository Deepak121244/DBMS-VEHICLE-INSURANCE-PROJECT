use T14_DBMS_PROJECT_VehiclE_insurance;
show tables;

alter table t14_application 
	add foreign key(t14_cust_id) references t14_customer(t14_cust_id);

alter  table t14_quote 
	add foreign key (t14_application_id) references t14_application(t14_application_id) on delete cascade,
    add foreign key (t14_cust_id) references t14_customer(t14_cust_id),
    add unique(t14_application_id);

alter table t14_insurance_policy
	add foreign key (t14_application_id) references t14_application(t14_application_id),
    add foreign key (t14_cust_id) references t14_customer(t14_cust_id);

alter table t14_premium_payment
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id);
    
alter table t14_vehicle 
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id);

alter table t14_claim 
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id);

alter table t14_claim_settlement 
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id),
    add foreign key (t14_claim_id) references t14_claim(t14_claim_id),
    add unique (t14_claim_id);

alter table t14_staff
	add foreign key (t14_company_name) references t14_insurance_companies(t14_company_name);

alter table t14_department 
	add foreign key (t14_company_name) references t14_insurance_companies(t14_company_name);

alter table t14_office 
	add foreign key (t14_company_name) references t14_insurance_companies(t14_company_name),
    add foreign key (t14_department_name) references t14_department(t14_department_name);

alter table t14_membership
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id) on delete cascade,
    add unique(t14_cust_id);

alter table t14_vehicle_service
	add foreign key (t14_vehicle_id) references t14_vehicle(t14_vehicle_id),
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id);
 
alter table t14_nok
	add foreign key (t14_agreement_id) references t14_insurance_policy(t14_aggrement_id),
    add foreign key (t14_application_id) references t14_application(t14_application_id),
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id);
    
alter table t14_policy_renewable
	add foreign key (t14_agreement_id) references t14_insurance_policy(t14_aggrement_id),
    add foreign key (t14_application_id) references t14_application(t14_application_id),
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id);

alter table t14_incident_report 
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id),
    add foreign key (t14_incident_id) references t14_incident(t14_incident_id);

alter table t14_coverage
	add foreign key (t14_company_name) references t14_insurance_companies(t14_company_name);

alter table t14_product
	add foreign key (t14_company_name) references t14_insurance_companies(t14_company_name);
    
alter table t14_receipt
	add foreign key (t14_cust_id) references t14_customer(t14_cust_id),
    add foreign key (t14_premium_payment_id) references t14_premium_payment(t14_premium_payment_id),
    add unique(t14_premium_payment_id);
    
alter table t14_insurance_policy_coverage
	add foreign key (t14_coverage_id) references t14_coverage(t14_coverage_id);
