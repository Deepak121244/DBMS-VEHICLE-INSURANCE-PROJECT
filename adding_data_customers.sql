use t14_vehical_insurance;
show tables;

describe customer;

select * from customer;

-- customer data
-- delete from customer;

insert into 
    customer(cust_id,cust_fname,cust_lname,cust_dob,cust_mob_number,cust_gender,cust_email,cust_martial_status,cust_pps_number,cust_passport_number) 
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
    
