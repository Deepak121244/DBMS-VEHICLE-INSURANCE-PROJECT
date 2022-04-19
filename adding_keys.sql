use T14_Vehical_insurance;
show tables;

alter table application 
	add foreign key(cust_id) references customer(cust_id);

alter  table quote 
	add foreign key (application_id) references application(application_id),
    add foreign key (cust_id) references customer(cust_id);

alter table insurance_policy
	add foreign key (application_id) references application(application_id),
    add foreign key (cust_id) references customer(cust_id);

alter table premium_payment
	add foreign key (cust_id) references customer(cust_id);
    
alter table vehicle 
	add foreign key (cust_id) references customer(cust_id);

alter table claim 
	add foreign key (cust_id) references customer(cust_id);

alter table claim_settlement 
	add foreign key (cust_id) references customer(cust_id),
    add foreign key (claim_id) references claim(claim_id);

alter table staff
	add foreign key (company_name) references insurance_company(company_name);

alter table department 
	add foreign key (company_name) references insurance_company(company_name);

alter table office 
	add foreign key (company_name) references insurance_company(company_name),
    add foreign key (department_name) references department(department_name);

alter table membership
	add foreign key (cust_id) references customer(cust_id);

alter table vehicle_service
	add foreign key (vehicle_id) references vehicle(vehicle_id),
	add foreign key (cust_id) references customer(cust_id);
 
alter table nok
	add foreign key (agreement_id) references insurance_policy(aggrement_id),
    add foreign key (application_id) references application(application_id),
	add foreign key (cust_id) references customer(cust_id);
    
alter table policy_renewable
	add foreign key (agreement_id) references insurance_policy(aggrement_id),
    add foreign key (application_id) references application(application_id),
	add foreign key (cust_id) references customer(cust_id);

alter table incident_report 
	add foreign key (cust_id) references customer(cust_id),
    add foreign key (incident_id) references incident(incident_id);

alter table coverage
	add foreign key (company_name) references insurance_company(company_name);

alter table product
	add foreign key (company_name) references insurance_company(company_name);
    
alter table receipt
	add foreign key (cust_id) references customer(cust_id),
    add foreign key (premium_payment_id) references premium_payment(premium_payment_id);
    
alter table insurance_policy_coverage
	add foreign key (coverage_id) references coverage(coverage_id);
