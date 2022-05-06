use T14_DBMS_PROJECT_VehiclE_insurance;
show tables;
set sql_safe_updates=0;
set foreign_key_checks=0;


call delete_data();
	
insert into 
    t14_application(t14_application_id,t14_application_status,t14_coverage,t14_cust_id,t14_vehicle_id) 
values  
    ('352bj321','pending ',"third party liabilty cover",'3011','2061'),
    ('352cg322','accepted',"propery damage liability",'3017','2062'),
    ('352nj323','rejected',"third party liabilty cover",'3016','2063'),
    ('35235324','rejected',"Comprehensive car insurance",'3015','2064'),
    ('3526x325','accepted',"Personal Accident Cover",'3019','2065'),
    ('352db326','pending ',"Own Damage Car insurancer",'3011','2066'),
    ('352jk327','pending ',"third party liabilty cover",'3014','2067'),
    ('352t2328','accepted',"propery damage liability",'3013','2068'),
    ('352dm329','rejected',"Zero Depreciation Insurance",'3011','2069'),
    ('352q9330','rejected ',"Comprehensive car insurance",'3012','2070'),
    ('352rx331','accepted',"third party liabilty cover",'3015','2071'),
    ('352k9332','pending ',"Zero Depreciation Insurance",'3019','2072'),
    ('352le333','accepted',"third party liabilty cover",'3016','2073'),
    ('352t2334','accepted',"Own Damage Car insurance",'3016','2074'),
    ('352dm335','rejected',"third party liabilty cover",'3015','2075'),
    ('352q9336','accepted',"Own Damage Car insurance",'3012','2076'),
    ('352rx337','rejected',"Zero Depreciation Insurance",'3020','2077'),
    ('352k9338','pending ',"Comprehensive car insurance",'3018','2078'),
    ('352kyy24','rejected',"third party liability",'3025','2079');

insert into
    t14_claim(t14_claim_id,t14_cust_id,t14_claim_amount,t14_damage_type,t14_date_of_claim,
    t14_claim_status,t14_agreement_id,t14_incident_id)
values
    ('1401','3011',100000,'self damage','2020-03-10','accepted','34001','1125'),
    ('1402','3015',125000,'third party damage','2020-05-13','rejected','34004',NULL),
    ('1403','3011',89000,'theft','2022-04-12','pending','34006',"1123"),
    ('1404','3019',120000,'theft','2019-09-24','rejected','34005',"1121"),
    ('1405','3016',100000,'third party damage','2018-11-25','accepted','34003','1113'),
    ('1406','3017',95000,'self damage','2021-05-19','pending','34002',"1115"),
    ('1407','3011',189000,'self damage','2022-01-14','rejected','34009',NULL),
    ('1408','3014',99000,'theft','2021-04-28','pending','34007',NULL),
    ('1409','3012',79000,'self damage','2022-02-06','accepted','34010',"1116"),
    ('1410','3019',97000,'third party damage','2019-05-27','rejected','34012','1118'),
    ('1411','3015',80000,'self damage','2020-08-18','accepted','34011','1119'),
    ('1412','3016',111000,'theft','2020-09-16','rejected','34013','1114'),
    ('1413','3015',82000,'third party damage','2022-04-20','pending','34015','1117');


insert into
	t14_claim_settlement(t14_claim_settlement_id,t14_date_settled,t14_amount_paid,
    t14_coverage_id,t14_claim_id,t14_vehicle_id,t14_cust_id)
values
    ('2301','2020-09-18',80000,1,'1402','2064','3015'),
    ('2302','2020-09-12',75000,7,'1404','2065','3019'),
    ('2303','2019-06-26',85000,2,'1407','2069','3011'),
    ('2304','2021-02-14',100000,3,'1408','2067','3014'),
    ('2305','2020-03-19',79000,3,'1401','2066','3011'),
    ('2306','2019-04-16',81000,2,'1405','2063','3016'),
    ('2307','2021-05-19',110000,4,'1403','2061','3011'),
    ('2308','2021-11-28',87600,4,'1406','2062','3017'),
    ('2309','2020-04-17',85000,6,'1409','2070','3012'),
    ('2310','2019-05-18',83000,5,'1411','2071','3015'),
    ('2311','2020-06-06',120000,7,'1413','2075','3015'),
    ('2312','2018-02-15',50000,6,'1410','2073','3016'),
    ('2313','2020-03-19',60000,3,'1412','2074','3016');

DELETE FROM T14_COVERAGE;
insert into 
	t14_coverage(t14_coverage_id,t14_coverage_type,t14_coverage_amount,t14_coverage_level,t14_coverage_description,T14_PRODUCT_ID)
values
	(1,'damage coverage','9000','medium','This coverage is generally offered as an add-on to car insurance policies in 
            India. will help you get the complete claim amount without accounting for any depreciation in the costs.',638011),
	(2,'Third-Party Coverage','21000','high','covers Cost of repairs/replacement of the damaged vehicle of third parties,
            hospitalization and treatment of third parties',638001),
	(3,'zero dept','640000','medium','This coverage is generally offered as an add-on to car insurance policies in India. 
            Suppose your vehicle is damaged and you need to replace the parts. The insurer will consider the depreciated 
            value of the parts for claim settlement',638003),
	(4,'Collision Coverage','86000','low','the cost of repairs to your vehicle that has been damaged is reimbursed.average 
            Insured Declared Value are taken into account to arrive at the premium.',638001),
    (5,'personal accident','3100','high','When you wish to protect yourself, i.e., the owner-driver of the car, by opting 
            for reimbursement of medical expenses after an accident, you are using personal accident car insurance coverage',638012),
	(6,'liabilty coverage','50000','medium','this coverage gives the highest level of protection as it includes liability 
            for third parties, damage to own vehicle, personal accident cover',638013),
	(7,'personal injury','1000','low','will help you get the complete claim amount without
			accounting for any depreciation in the costs.',638005),
	(8,'damage coverage','9000','medium','This coverage is generally offered as an add-on to car insurance policies in 
            India. will help you get the complete claim amount without accounting for any depreciation in the costs.',6380019),
	(9,'Third-Party Coverage','2101000','high','covers Cost of repairs/replacement of the damaged vehicle of third parties,
            hospitalization and treatment of third parties',638007),
	(10,'zero dept','640000','medium','This coverage is generally offered as an add-on to car insurance policies in India. 
            Suppose your vehicle is damaged and you need to replace the parts. The insurer will consider the depreciated 
            value of the parts for claim settlement',638008),
	(11,'Collision Coverage','860000','low','the cost of repairs to your vehicle that has been damaged is reimbursed.average 
            Insured Declared Value are taken into account to arrive at the premium.',638010),
    (12,'personal accident','3100000','high','When you wish to protect yourself, i.e., the owner-driver of the car, by opting 
            for reimbursement of medical expenses after an accident, you are using personal accident car insurance coverage',638015),
	(13,'liabilty coverage','560000','medium','this coverage gives the highest level of protection as it includes liability 
            for third parties, damage to own vehicle, personal accident cover',638006);

insert into 
    t14_customer(t14_cust_id,t14_cust_fname,t14_cust_lname,t14_cust_dob,t14_cust_mob_number,t14_cust_gender,t14_cust_email,t14_cust_martial_status,t14_cust_pps_number,t14_cust_passport_number) 
values 
    ('3011','Jason','Wilcox','1985-09-24','7421863294','m','JasonWilcox@gmail.com','married','7061531MA','AB33286BX'),
    ('3012','Amanda','Johnson','1974-12-04','9995922013','f','AmandaJohnson@gmail.com','unmarried','7061231BA','AB33286BY'),
    ('3013','George','Martin','2001-04-02','3697214622','m','GeorgeMartin@gmail.com','married','7031531WA','AB33286BZ'),
    ('3014','Tracy','Ewing','1965-01-06','4736523524','f','TracyEwing@gmail.com','unmarried','7061531VA','AB33286BB'),
    ('3015','Lief','Gunderson','1963-01-22','3801428820','m','LiefGunderson@gmail.com','married','7161531AA','AB33286BC'),
    ('3016','Bobby','Trundle','1957-09-11','2714348789','m','BobbyTrundle@gmail.com','married','6061531CA','AB33286BD'),
    ('3017','stan','Gunderson','1987-09-21','7654321212','m','stanGunderson@gmail.com','unmarried','7051331VB','AB33286BF'),
    ('3018','stacy','Graciel','2000-11-21','7444321212','f','stacyGraciel@gmail.com','married','6041331VB','AB31186CF'),
    ('3019','jhon','robert','1967-08-23','9871342232','m','jhonrobert1@gmail.com','unmarried','2345665AM','QWET77IW9'),
    ('3020','micheal','richard','1986-09-22','7329642022','m','michealrichard90@gmail.com','unmarried','88534J8QP','YIHD552JS'),
    ('3021','sanjana','krupati','2000-08-12','8998649264','f','sanjana13krupati@gmail.com','married','57329FH3I','GJSPN7532'),
    ('3022','William','DAVID','1992-03-02','6127946646','m','sanjana13krupati@gmail.com','married','7329FH3NI','GJSPN7532'),
    ('3023','thomas','shelby','1980-08-12','6127930183','m','sanjana13krupati@gmail.com','married','5329FH3AI','GJSPN7532'),
    ('3024','Christine','noel','1976-12-12','6129901623','f','sanjana13krupati@gmail.com','married','5733FH33I','GJSPN7532'),
    ('3025','sanjay','kurupati','2000-08-12','6798649264','m','sanjana13krupati@gmail.com','married','5732F833I','GJSPN7532');

insert into 
	t14_department(t14_department_name,t14_company_name,t14_contact_information,t14_department_staff,t14_department_leader)
values 
	('sales dept','canara insurance','9848022441','works in sales department','srujan'),
    ('marketing dept','SBI insurance','6543298061','works in marketing department','srujana'),
    ('claims dept',"united india insurance",'9995624213','works in claims department','sanjay'),
    ('admin dept','tataplus insurance','8346813223','works in admin department','sanjana'),
    ('production dept','SBI insurance','9945241342','works in production department','micheal'),
    ('manuf dept','bajaj insurance','7451672234','works in manuf department','lucifer'),
    ('operation dept','united india insurance','6554234234','works in operation department','Saleem'),
    ('accounts dept','hdfc insurance','9833257709','works in accounts department','sehmet'),
    ('work dept','tataplus insurance','77146813223','works under admin department','sharmaa'),
    ('primary dept','SBI insurance','9945241342','works in primary department','watson'),
    ('finance dept','bajaj insurance','6451671134','works in finance department','Chandra');

INSERT INTO 
	t14_incident(`t14_INCIDENT_ID`, `t14_INCIDENT_TYPE`, `t14_INCIDENT_DATE`,`t14_DESCRIPTION`) 
VALUES  ('1111', 'ROAD ACIDENT', '2018/10/11','REAR BUMPER DAMAGE'),
        ('1112', 'FIRE EXPLOSION', '2018/09/12','FRONT BUMPER DAMAGE'),
	    ('1113', 'THEFT OR ROBBERY', '2020/08/17','HEADLIGHT DAMAGE'),
		('1114', 'FIRE DAMAGE', '2013/02/19','DENTS TO THE CAR DOOR'),
		('1115', 'WATER DAMAGE', '2017/03/19','DENTS TO THE CAR DOOR AND HEADLIGHT DAMAGE'),
		('1116', 'WEAR AND TEAR', '2013/09/21','PAINT AND RUST'),
		('1117', 'HAIL DAMAGE', '2016/07/24','DENTS TO CAR AND REAR LEFT INCDICATOR DAMAGE'),
		('1118', 'HIT AND RUN', '2010/03/30','ENGINE AND FRONT BUMPER DAMAGE'),
		('1119', 'MINOR DAMAGE', '2018/12/26','AXEL DAMAGE'),
		('1120', 'MAJOR DAMAGE', '2010/08/02','ENGINE,AXEL,FRONT BUMPER AND FRONT INDICATOR DMAGE'),
		('1121', 'NATURAL CALAMITY', '2011/09/12','WINDSHEILD AND WINDOW DAMAGE'),
		('1122', 'ELECTRIC', '2013/06/11','SPARKPLUG AND PETROL FUSION'),
		('1123', 'ROAD ACCIDENT', '2018/11/17','DENTS TO THE CAR DOOR AND REAR RIGHT INDICATOR DAMAGE'),
		('1124', 'THEFT', '2014/10/16','LOST THE CAR'),
		('1125', 'FIRE EXPLOSION', '2019/09/12','COMPLETE CAR BURNT IN THE DISASTER');

insert into 
	t14_incident_report(t14_incident_report_id,t14_cust_id,t14_incident_inspector,t14_incident_cost,t14_incident_type,t14_incident_id,t14_incident_report_description)
values
	('101','3011','balaji',10000,'fire accident','1111','descritpion about incident'),
	('102','3015','pranav',11000,'road accident','1112','descritpion about incident'),
	('103','3015','chandu',12000,'water damage','1114','descritpion about incident'),
	('104','3011','prakash',13000,'road traffic','1116','descritpion about incident'),
	('105','3021','navdeep',14000,'fire accident','1119','descritpion about incident'),
	('106','3020','aashish',15000,'windsheild damage','1113','descritpion about incident'),
	('107','3019','rithish',16000,'fire accident','1117','descritpion about incident'),
	('108','3012','navyanth',17000,'rear end crash','1118','descritpion about incident'),
	('109','3013','abhinov',18000,'fire accident','1119','descritpion about incident'),
	('110','3015','bhargav',19000,'theft','1120','descritpion about incident'),
	('111','3016','rocky',20000,'multi crash','1115','descritpion about incident'),
	('112','3018','sai',21000,'hail damage','1120','descritpion about incident'),
	('113','3016','pradeep',22000,'fire accident','1121','descritpion about incident'),
	('114','3012','aakash',23000,'water damage','1124','descritpion about incident'),
	('115','3014','arun',24000,'fire accident','1125','descritpion about incident'),
	('116','3017','vivek',23010,'theft','1123','descritpion about incident'),
	('117','3011','pranay',22000,'fire accident','1121','descritpion about incident'),
	('118','3012','aasheesh',23000,'water damage','1124','descritpion about incident'),
	('119','3019','ankith',24100,'fire accident','1125','descritpion about incident'),
	('120','3017','virat',23110,'theft','1123','descritpion about incident');

insert into
	t14_insurance_companies(t14_company_name,t14_company_address,t14_company_contact_number,t14_company_fax,t14_company_email,t14_company_website,t14_company_location,t14_company_department_name,t14_company_office_name)
values
	("united india insurance","chennai",6302693445,9087183826,"bristol@gmail.com","www.britol.com","Jammu","random-star","unitedin.org"),
	('sbi insurance',"mumbai national road",938372636,885334321,"sbione@gmail.com","www.sbiones.com","nearstatebank mumbai","America VehicalIns","Rendu"),
	('tataplus insurance',"karnataka",89932123,923341234,"tata@gmail.com","tataplus.com","R-office","DelhiHotel ","tatacom"),
	("citizen insurance","uttra",345325,73356421,"cit@gmail.com","citizen.com","v-p colony","citiplace ","citiship"),
	("bajaj insurance","sitha nagr",64398292,73472822,"hulli.@gmail.com","hulli.com"," guntur","sea_plus ","humango"),
	("canara insurance","nasik nagar",7552345,39224361,"canara@gmail.com","www.Builder.com","Andra ","canara ask","west.nic"),
	("hdfc insurance","vijayawada",735262772,8885088,"Owners@gmail.com","Owners.com"," hd-road-goa","American Capital ","Towner");

insert into 
	t14_insurance_policy(t14_aggrement_id,t14_application_id,t14_cust_id,t14_department_name,t14_policy_number,t14_start_date,t14_expiry_date,t14_term_condition_description)
values
    ('34001','352bj321','3011','sales dept','2311','2010-12-01','2016-02-10','sales is not done in the case of public panic'),
    ('34002','352cg322','3017','marketing dept','2348','2001-01-22','2020-05-10','marketing the scheme of new loan is prohibited until 3 months of its existance'),
    ('34003','352nj323','3016','claims dept','2651','2020-06-18','2024-08-10','liabilty coverage is always done if the accident result in severe injuries'),
    ('34004','35235324','3015','admin dept','2411','2020-07-16','2024-09-11','Incase of theft the insurance is granted only after proper investigation and closing of case'),
    ('34005','3526x325','3019','production dept','2112','2018-03-22','2021-01-11','the production is done with respect to sales and is market dependent.'),
    ('34006','352db326','3011','manuf dept','2351','2019-04-16','2023-09-12','incase of third party the products are manufactured based on company policy'),
    ('34007','352jk327','3014','accounts dept','1411','2011-08-13','2013-04-16','the insurance is processed two days after getting confirmation from admin department'),
    ('34008','352t2328','3013','accounts dept','1611','2012-09-14','2015-05-22','the insurance amount is credited to the main account of the holder and not to any one else'),
    ('34009','352dm329','3011','sales dept','2711','2016-03-11','2020-04-22','the amount of sales is a part of aggrement.'),
    ('34010','352q9330','3012','production dept','2811','2018-08-17','2000-12-20','the product produced are only for the coverage of liabilty and not for damage over time'),
    ('34011','352rx331','3015','operation dept','2411','2019-09-16','2022-11-23','incase of liabilty coverage the amount is settled as per the damage happed to the vehicle'),
    ('34012','352k9332','3019','claims dept','2911','2016-10-11','202-11-16','settled claims need to presented while applying for new claim.'),
    ('34013','352le333','3016','sales dept','3912','2022-11-11','2024-12-16','products are sold only after the settlemnt conformation'),
    ('34014','352t2334','3016','manuf dept','4271','2022-01-16','2026-11-17','third party damage covered only if the car is not imported'),
    ('34015','352dm335','3015','admin dept','4131','2022-07-22','2024-11-18','prior notice to next of kin incase of any death'),
    ('34016','352q9336','3012','accounts dept','1411','2011-08-13','2013-04-16','the insurance is processed two days after getting confirmation from admin department'),
    ('34017','352rx337','3020','accounts dept','2611','2002-09-14','2005-05-22','the insurance amount is credited to the main account of the holder and not to any one else'),
    ('34018','352k9338','3018','sales dept','2211','2016-03-11','2018-04-22','the amount of sales is a part of aggrement.'),
    ('34019','352kyy24','3025','marketing dept','2011','2019-03-11','2028-04-22','the amount of sales is a not part of aggrement.');

insert into 
    t14_insurance_policy_coverage
values
    ('34001',1),('34003',3),
    ('34004',1),('34005',2),
    ('34008',4),('34009',5),
    ('34010',2),('34011',3),
    ('34012',5),('34013',6),
    ('34014',7),('34016',11),
    ('34017',9),('34018',8),
    ('34019',10),('34002',12),
    ('34006',13);

insert into
	t14_membership(t14_membership_id,t14_membership_type,t14_organisation_contact,t14_cust_id)
values
    ('4501','designee','8368106390','3013'),
    ('4502','Associate','3810468946','3022'),
    ('4503','Retiree','3748401384','3011'),
    ('4504','Student','9275927493','3015'),
    ('4505','Corporate','0183765927','3012'),
    ('4506','Associate','9173947484','3023'),
    ('4507','Student','7593926502','3025'),
    ('4508','designee','1938492474','3016'),
    ('4509','Corporate','3829567820','3019'),
    ('4510','Retiree','5619365092','3020'),
    ('4511','Student','8264846595','3024'),
    ('4512','Associate','2947295620','3021');

insert into 
    t14_nok(t14_nok_id,t14_cust_id,t14_nok_name,t14_nok_address,t14_nok_phone_number,t14_nok_marital_status,t14_nok_gender,t14_agreement_id,t14_application_id)
values
    ('4021','3019','Swaroop','Vizag',709540516,'married','M','34005','3526x325'),
    ('4022','3017','Vivek','Siddipet',868810905,'unmarried','M','34002','352cg322'),
    ('4023','3016','Prathyusha','Vijayawada',974892929,'unmarried','F','34003','352nj323'),
    ('4024','3011','Rajesh','Vijayawada',829439674,'married','M','34001','352bj321'),
    ('4025','3015','Lokesh','West Godavari',964739887,'unmarried','M','34004','35235324'),
    ('4026','3011','Karthik','Ranchi',927739838,'married','M','34006','352db326'),
    ('4027','3014','Balaji','Bihar',856639080,'married','M','34007','352jk327'),
    ('4028','3013','Sindhu','Hydrabad',928193789,'unmarried','F','34008','352t2328'),
    ('4029','3015','Megha','Guntur',892378292,'married','F','34011','352rx331'),
    ('4030','3011','Deepak','Chennai',929198739,'unmarried','M','34009','352dm329'),
    ('4031','3019','Sai Charan','Hunli',883837389,'married','M','34012','352k9332'),
    ('4032','3012','Jay kumar','Lucknow',938472937,'unmarried','M','34010','352q9330'),
    ('4033','3016','Anil Kumar','Mirzapur',985930384,'married','M','34013','352le333'),
    ('4034','3016','Pranathi','Delhi',928497490,'unmarried','F','34014','352t2334'),
    ('4035','3015','Chandramukhi','Chennai',923847483,'married','F','34015','352dm335'),
    ('4036','3012','Jay kumar','Lucknow',938472937,'unmarried','M','34016','352q9336'),
    ('4037','3018','Anil Kumar','Mirzapur',985930384,'married','M','34018','352k9338'),
    ('4038','3020','Pranathi','Delhi',928497490,'unmarried','F','34017','352rx337'),
    ('4039','3025','Chandramukhi','Chennai',923847483,'married','F','34019','352kyy24');
    
insert into
    t14_office(t14_office_name,t14_office_leader,t14_contact_information,t14_address,t14_admin_cost,t14_staff,t14_department_name,t14_company_name)
values
    ("Astonish Office","gajala","9550459123","mumbai",3000,"8",'sales dept','canara insurance'),
    ("Officeporium","Tharun","8790448498","vijayawada ",5000,"4",'claims dept',"united india insurance"),
    ("Infinite Office","kumar","sing","delhi",6000,"9",'manuf dept','bajaj insurance'),
    ("Assured Office","srinu","97703418739","mumbai",10000,"9",'marketing dept','SBI insurance'),
    ("worstar","ram chandra","804279694613","mumbai",7000,"6",'admin dept','tataplus insurance'),
    ("infinity","mahesh","706214578","maharastra",7500,"5",'production dept','SBI insurance'),
    ("Officeprime","chandra sing","7321983420","maharastra",1500,"9",'operation dept','united india insurance'),
    ("Officebse","govind","6302693923","banglore",8500,"11",'marketing dept','SBI insurance'),
    ("directoffice","rahul","9857321892","gujarath",2000,"7",'manuf dept','bajaj insurance'),
    ("limitles","kaviraj","87735291298","rajasthan",5900,"5",'operation dept','united india insurance'),
    ("serviceoffice","singram","8231567212","tamilnadu",3000,"7",'accounts dept','hdfc insurance'),
    ("zipoffice","prasad","8245268916","jammu",500,"15",'finance dept','bajaj insurance'),
    ("unity","praveen","8541326893","jammu",3300,"11",'claims dept',"united india insurance"),
    ("ruleoffice","lokesh","7323456916","karnataka",5000,"14",'work dept','tataplus insurance'),
    ("demand","swaroop","95504234561","jammu",600,"11",'primary dept','SBI insurance');


insert into 
    t14_policy_renewable(t14_policy_renewable_id,t14_date_of_renewal,t14_type_of_renewal,t14_agreement_id,t14_cust_id,t14_application_id)
values
    ('101','2019-01-11','online','34005','3526x325','3019'),
    ('102','2018-02-01','offline','34004','35235324','3015'),
    ('103','2020-03-12','online','34002','352cg322','3017'),
    ('104','2020-04-02','online','34001','352bj321','3011'),
    ('105','2020-05-12','offline','34012','352k9332','3019'),
    ('106','2021-06-12','online','34003','352nj323','3016'),
    ('107','2020-07-12','online','34013','352le333','3016'),
    ('108','2020-08-12','online','34019','352kyy24','3025'),
    ('109','2016-09-12','online','34010','352q9330','3012'),
    ('110','2020-10-12','online','34017','352rx337','3020'),
    ('111','2021-11-12','offline','34015','352dm335','3015'),
    ('112','2020-12-07','online','34014','352t2334','3016'),
    ('113','2018-07-09','online','34008','352t2328','3013'),
    ('114','2020-09-03','offline','34018','352k9338','3018'),
    ('115','2021-12-01','online','34019','352kyy24','3025');

insert into 
    t14_premium_payment(t14_premium_payment_id,t14_cust_id,t14_policy_number,t14_premium_payment_schedule,t14_premium_payment_amount)
values
    ('101','3011','2001','2018-01-12 01:12:23',221000),
    ('102','3018','2004','2022-01-14 02:12:23',2000),
    ('103','3017','2009','2020-01-15 03:12:23',3000),
    ('104','3025','2013','2020-06-16 04:12:23',4000),
    ('105','3021','2015','2019-01-17 05:12:23',15000),
    ('106','3019','2019','2021-01-18 06:12:23',611000),
    ('107','3015','2022','2020-01-19 07:12:23',7000),
    ('108','3022','2025','2020-05-20 08:12:23',800110),
    ('109','3020','2029','2021-11-21 09:12:23',9000),
    ('110','3014','2033','2020-01-22 01:12:19',10000),
    ('111','3023','2037','2022-09-23 01:11:23',11000);

INSERT INTO 
	t14_Product(t14_product_number,t14_product_price,t14_product_type,t14_company_name) 
values
	('638001', '49000','Bike Insurance','united india insurance'),
	('638002', '220000','Car Insurance', "tataplus insurance"),
	('638003', '120000','Two Wheeler',"united india insurance" ),
	('638004', '980000','Car-Economy','united india insurance'),
	('638005', '190000','Two Wheeler', 'bajaj insurance'),
	('638006', '100000','Car-Luxury', 'canara insurance'),
	('638007', '456000','Two Wheeler', 'united india insurance'),
	('638008', '178000','Two Wheeler','citizen insurance' ),
	('638009', '120000','Car-Topup', 'hdfc insurance'),
	('638010', '410000','two wheeler', "tataplus insurance"),
	('638011', '120000','Two Wheeler','hdfc insurance' ),
	('638012', '430000','Two Wheeler', 'canara insurance'),
	('638013', '230000','Car-Economy','SBI insurance' ),
	('638014', '670000','Car/Bike', 'bajaj insurance'),
	('638015', '380000','Two Wheeler', 'citizen insurance');

INSERT INTO 
    t14_quote(t14_quote_id,t14_issue_date,t14_valid_from_date,t14_valid_till_date,t14_coverage_level,t14_application_id,t14_cust_id,t14_product_id,t14_description)
values
    (101,'2018-11-01','2018-11-01','2025-12-03',38,'352bj321','3011','638001','description about quote'),
    (102,'2018-12-03','2018-12-03','2026-11-03',23,'352cg322','3017','638002','description about quote'),
    (103,'2017-11-03','2017-12-03','2022-01-05',34,'352nj323','3016','638003','description about quote'),
    (104,'2016-01-05','2016-12-03','2023-02-05',56,'35235324','3015','638004','description about quote'),
    (105,'2018-07-05','2018-12-03','2024-03-07',76,'3526x325','3019','638005','description about quote'),
    (106,'2012-09-07','2012-12-03','2025-04-07',54,'352db326','3011','638006','description about quote'),
    (107,'2013-12-07','2013-12-13','2020-05-09',39,'352jk327','3014','638007','description about quote'),
    (108,'2011-09-09','2011-12-03','2019-06-09',59,'352t2328','3013','638008','description about quote'),
    (109,'2018-03-09','2018-07-03','2025-09-11',76,'352dm329','3011','638009','description about quote'),
    (110,'2013-11-11','2013-12-03','2018-11-11',59,'352q9330','3012','638010','description about quote'),
    (111,'2017-02-11','2017-12-03','2023-12-13',60,'352rx331','3015','638011','description about quote'),
    (112,'2015-04-13','2015-12-03','2021-05-13',40,'352k9332','3019','638012','description about quote'),
    (113,'2019-06-13','2019-12-03','2025-03-15',28,'352le333','3016','638013','description about quote'),
    (114,'2011-07-15','2011-07-23','2019-12-15',12,'352t2334','3016','638014','description about quote'),
    (115,'2015-12-15','2015-12-03','2022-07-17',19,'352dm335','3015','638015','description about quote'),
    (116,'2018-11-16','2019-11-09','2023-08-16',60,'352q9336','3012','638006','description about quote'),
    (117,'2019-06-13','2019-12-03','2025-03-15',28,'352rx337','3020','638013','description about quote'),
    (118,'2018-11-16','2019-11-09','2023-08-16',60,'352k9338','3018','638014','description about quote'),
    (119,'2019-06-13','2019-12-03','2025-03-15',28,'352kyy24','3025','638012','description about quote');

    INSERT INTO 
        t14_receipt (`t14_receipt_id`, `t14_cost`, `t14_time`,t14_premium_payment_id,t14_cust_id) 
    VALUES 
        ('201', '20000', '2018/10/20','101','3011'),
        ('202', '23000', '2018/11/10','111','3023'),
        ('203', '12000', '2008/01/20','103','3017'),
        ('204', '23450', '2020/12/10','102','3018'),
        ('205', '14000', '2014/07/23','104','3025'),
        ('206', '17500', '2018/03/20','105','3021'),
        ('207', '16400', '2021/11/24','107','3015'),
        ('208', '18350', '2019/06/30','108','3022'),
        -- ('209', '19000', '2018/08/20',NULL,NULL),
        ('210', '26000', '2013/09/28','109','3020'),
        ('211', '57400', '2018/12/19','110','3014');



insert into
    t14_staff(t14_staff_id,t14_staff_fname,t14_staff_lname,t14_staff_address,t14_staff_contact,
			t14_staff_gender,t14_staff_marital_status,t14_staff_nationality,
            t14_staff_qualification,t14_staff_allowance,t14_staff_pps_number,t14_company_name)
values
    ('1','ANAND','RAJ','VIZAG','987766543','M','MARRIED','INDIAN','PhD','100000','15','united india insurance'),
    ('2','ANKATHI','VIVEK','JOGIPET','945673108','M','MARRIED','INDIAN','BTech','80000','14','canara insurance'),
    ('3','PULLELA','GOPICHAND','HYDERABAD','890654231','M','SINGLE','INDIAN','MTech','85000','13','mordernusa'),
    ('4','RAMA','PRANATHI','DELHI','968734210','F','MARRIED','INDIAN','PhD','100000','12','united india insurance'),
    ('5','LAKSHMI','DEVI','ANDHERI','769125430','F','SINGLE','INDIAN','BTech','60000','11','bajaj insurance'),
    ('6','KASSE','LOKESH','LUCKNOW','791432650','M','SINGLE','INDIAN','PhD','90000','10','united india insurance'),
    ('7','MANJUSHA','KINI','SIDDHIPET','853421069','F','MARRIED','INDIAN','MBA','100000','9','tataplus insurance'),
    ('8','NIRMAL','SWAROOP','PUNE','607845213','M','MARRIED','INDIAN','BTech','85000','8','canara insurance'),
    ('9','PRIYANKA','MOHAN','CHENNAI','896751243','F','SINGLE','INDIAN','MTech','120000','7','bajaj insurance'),
    ('10','RAJA','TEJAM','KOCHI','93416707','M','MARRIED','INDIAN','PhD','70000','6','canara insurance'),
    ('11','SUNDAR','KUMAR','RAJAM','73561208','M','SINGLE','INDIAN','MTech','5000000','5','SBI insurance'),
    ('12','SAMUEL','PAUL','GOA','79862534','M','MARRIED','INDIAN','MBA','80000','4','hdfc insurance'),
    ('13','SAI','CHARAN','KRISHNA','98833651','M','SINGLE','INDIAN','BTech','200000','3','hdfc insurance'),
    ('14','SREE','BHAGYA','HUBLI','67126534','F','SINGLE','INDIAN','PhD','250000','2','tataplus insurance'),
    ('15','RAMYA','SRI','NAGPUR',879601243,'F','MARRIED','INDIAN','BTech','100000','1','SBI insurance');
    
insert into 
    t14_vehicle(t14_vehicle_id,t14_dependent_nok_id,t14_cust_id,t14_policy_id,t14_vehicle_registration_number,t14_vehicle_value,t14_vehicle_type,t14_vehicle_size,t14_vehicle_number_of_seat,
            t14_vehicle_manufacturer,t14_vehicle_chasis_number,t14_vehicle_number,t14_vehicle_model_number)
values
    ('2061','4026','3011','34001','VN301',500000,'SUV',520,7,'hyundai','5NPEB4AC1DH576656','AP23AL5079','HX250'),
    ('2062','4022','3017','34002','VN302',525000,'Seden',518,5,'maruti','JHMSZ542XDC028494','AP13KH5403','MS301'),
    ('2063','4023','3016','34003','VN303',700000,'Coupe',490,7,'hyundai','JH4DB1642PS001515','AP20FJ2405','HD15'),
    ('2064','4025','3015','34004','VN304',850000,'Convertable',495,4,'Toyota','WBAHD5313MBF95736','AP15ET8679','TK642'),
    ('2065','4031','3019','34005','VN305',1000000,'SUV',540,7,'Suzuki','1GCCS1956Y8235348','AP04AY4926','SG6353'),
    ('2066','4030','3011','34006','VN306',900000,'SUV',510,5,'maruti','KM8JN72DX7U587496','AP11RU8963','MK629'),
    ('2067','4027','3014','34007','VN307',700000,'Seden',534,5,'Toyota','1C4RJEBG8CC299381','AP14HK5632','TL462'),
    ('2068','4028','3013','34008','VN308',899000,'MUV',547,5,'Suzuki','JH4KA4650JC000403','AP07SR4519','SF978'),
    ('2069','4024','3011','34009','VN309',500000,'Hatchback',453,5,'hyundai','3C8FY68B72T322831','AP03WK0352','HI630'),
    ('2070','4036','3012','34010','VN310',650000,'Hatchback',470,5,'Suzuki','5XYKTDA60CG246250','AP22TH9273','RG549'),
    ('2071','4035','3015','34011','VN311',901000,'Seden',510,5,'Renault','JS1GR7JAX52104246','AP10BH6382','DW237'),
    ('2072','4021','3019','34012','VN312',800000,'SUV',570,7,'ford','JH4DA3340GS007428','AP38WI9358','FI927'),
    ('2073','4034','3016','34013','VN313',700000,'Hatchback',438,5,'Tata','5GZCZ63B93S896664','AP23SI9357','TL740'),
    ('2074','4033','3016','34014','VN314',789000,'Seden',510,5,'Toyota','JH4DB1550MS003978','AP13TP8253','TH529'),
    ('2075','4035','3015','34015','VN315',600000,'SUV',560,7,'maruti','SICXE25425A328687','AP09MT8245','MF7289'),
	('2076','4032','3012','34016','VN316',900000,'Hatchback',438,5,'Tata','5GZCZ63B93S896664','AP23SI9357','TL740'),
    ('2077','4038','3020','34017','VN317',189000,'Seden',510,5,'Toyota','JH4DB1550MS003978','AP13TP8253','TH529'),
    ('2078','4037','3018','34018','VN318',670000,'convertable',460,7,'hyndai','PXLAE25425A328687','AP19MT6245','MF1289'),
	('2079','4039','3025','34019','VM318',610000,'hatchback',560,7,'renault','PXLAE25425A32BB87','AP29MT6145','MM1239');

insert into
    t14_vehicle_service(t14_vehicle_service,t14_vehicle_id,t14_cust_id,t14_department_name,t14_vehicle_service_address,
					t14_vehicle_service_contact,t14_vehicle_service_incharge,t14_vehicle_service_type)
values
    ('111','2061','3011','engine','vizag','9874560123','JAYA PRAKASH','full car service'),
    ('112','2062','3017','oil','adilabad','8976450321','VINAY','regular bike service'),
    ('113','2067','3014','brakes','siddipet','8688109055','PRATYUSHA','major car service'),
    ('114','2064','3015','engine','jogipet','6758490348','SRIKANTH','full car service'),
    ('115','2061','3011','wheel alighnment','kolar','7654087932','KRISHNA','major bike service'),
    ('116','2066','3011','oil','malkpet','9609333222','TILAK','regular service'),
    ('117','2067','3014','engine','sattur','7689876453','MANJUNATH','regular car service'),
    ('118','2068','3013','brakes','amlai','8797657243','MOHIT','major car service'),
    ('119','2069','3011','engine','dharwad','6302693925','LOKESH','regular bike service'),
    ('120','2071','3015','oil','vijayawada','9846529376','VIVEK','major car service'),
    ('121','2062','3017','engine','srikakulam','7658798745','VIJAY','major service'),
    ('122','2064','3015','brakes','delhi','6709987645','RAM','major service'),
    ('123','2066','3011','oil','kochi','7689872345','BHEEM','regular bike service'),
    ('124','2064','3015','wheel alignment','gond','7659784567','LAKSHMAN','major car service'),
    ('125','2079','3025','engine','amritsar','9678765463','PARBRAHM','full bike service');
    