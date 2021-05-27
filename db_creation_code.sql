create database bus;

create table customer(name varchar(15),
			customer_id varchar(15),
			dob date,
			email varchar(25) not null,
			occupation varchar(15),
			gender varchar(15),
			primary key(customer_id));

create table discountdetails(discount_id varchar(15),
			discount_amount int,
			primary key(discount_id));

			
create table tickets(noof_tickets int,
			departuretime varchar(15) ,
			seatno varchar(15),
			pnr varchar(15),
			Route_no varchar(5), 
			cust_id varchar(15),	
			primary key(pnr),
			foreign key(cust_id) references customer(customer_id)
			
);
create table billing_details ( bill_id varchar(15),
			  bill_status varchar(15),
			bill_date date,
			totalamount float,

pnr_no varchar(15),
payment_mode varchar(15),
dis_id varchar(15),
primary key(bill_id),
foreign key(dis_id)references discountdetails(discount_id),
foreign key(pnr_no)references tickets(pnr)  on delete cascade on update cascade);

create table booking_details (book_id varchar(15),
		amount float,
		bookingstatus varchar(15),
		securitydeposit float,
		bill_id varchar(15),
	primary key(book_id),
	foreign key(bill_id) references billing_details(bill_id)
);

create table depot(
		depot_name varchar(15),
		depot_id varchar(15),
	        primary key(depot_id)

);

create table bus(
	bus_id varchar(15),
	buscompanyname varchar(15),
	depot_id varchar(15),
        bus_type varchar(50),
	primary key(bus_id)
	foreign key(depot_id) references depot(depot_id)  on delete cascade on update cascade

);

create table driver(
    driver_id varchar(15),name varchar(15),salary float,dob date,
    gender varchar(10),
    primary key(driver_id));

	create table route(
B_id varchar(15),R_no varchar(5),source varchar(15),destination varchar(15),distance float,date_of_journey date ,
foreign key(B_id) references bus(bus_id)
);
 

create table drives(
B_id varchar(15),
d_id varchar(15),
D_name varchar(20),
salary float,
dob date,
primary key(B_id,d_id),
foreign key(B_id) references bus(bus_id),foreign key(d_id) references driver(driver_id)
);


insert into customer values('lokesh','202001','1996-11-04','lokesh@gmail.com','business','male');
insert into customer values('sanjith','202002','1995-10-24','sanjith@gmail.com','painter','male');
insert into customer values('abdul','202003','1988-09-14','abdul@gmail.com','cab driver','male');
insert into customer values('adbullah','202004','1991-06-20','adbullah@gmail.com','engineer','male');
insert into customer values('sanjana','202005','1997-04-27','sanju@gmail.com','doctor','female');
insert into customer values('Aishwarya','202006','1997-05-27','aish@gmail.com','doctor','female');
insert into customer values('sanjay','202007','1995-11-24','sanjay@gmail.com','painter','male');
insert into customer values('abhijay','202008','1988-12-14','abdhiajy@gmail.com','cab driver','male');
insert into customer values('adbu','202009','1991-06-21','adbu@gmail.com','engineer','male');
insert into customer values('sanjana','202010','1997-04-22','sanjana@gmail.com','mechanic','female');
insert into customer values('Akanksha','202011','1996-05-17','akanksha@gmail.com','doctor','female');
insert into customer values('sandesh','202012','1999-11-24','sandseh@gmail.com','business','male');
insert into customer values('karan','202013','1988-09-10','karan@gmail.com','cab driver','male');
insert into customer values('adbullah','202014','1991-07-20','adbullah@gmail.com','engineer','male');
insert into customer values('sanjana','202015','2000-05-27','sanju@gmail.com','doctor','female');
insert into customer values('Aishwarya','202016','1997-05-27','aish@gmail.com','housewife','female');




insert into discountdetails values('101A',75);
insert into discountdetails values('101B',105);
insert into discountdetails values('101C',100);
insert into discountdetails values('101D',50);
insert into discountdetails values('101E',80.50);
insert into discountdetails values('101F',81.50);
insert into discountdetails values('101G',105);
insert into discountdetails values('101H',100);
insert into discountdetails values('101I',50);
insert into discountdetails values('101J',80.50);
insert into discountdetails values('101K',82.50);
insert into discountdetails values('101L',100);
insert into discountdetails values('101M',100);
insert into discountdetails values('101N',100);
insert into discountdetails values('101O',25.50);
insert into discountdetails values('101P',81.50);


insert into tickets values(3,'21:57:00','l5','PNR005','R8','202004');
insert into tickets values(4,'21:55:00','l4','PNR004','R7','202001');
insert into tickets values(2,'21:49:00','l3','PNR001','R6','202002');
insert into tickets values(1,'21:05:00','l2','PNR002','R5','202004');
insert into tickets values(4,'21:42:00','l7','PNR011','R4','202005');
insert into tickets values(6,'21:43:00','l6','PNR091','R4','202006');
insert into tickets values(1,'21:05:00','l2','PNR025','R5','202004');
insert into tickets values(1,'21:42:00','l1','PNR035','R4','202005');
insert into tickets values(1,'21:43:00','l6','PNR045','R4','202006');
insert into tickets values(2,'21:49:00','l3','PNR046','R6','202002');
insert into tickets values(1,'21:05:00','l2','PNR047','R5','202014');
insert into tickets values(4,'21:42:00','l4','PNR048','R4','202009');
insert into tickets values(6,'21:43:00','l9','PNR049','R2','202016');
insert into tickets values(1,'21:05:00','l2','PNR050','R5','202004');
insert into tickets values(1,'21:42:00','l5','PNR052','R1','202005');
insert into tickets values(7,'21:43:00','l6','PNR051','R4','202012');




insert into billing_details values('B01','paid','2020-05-14','700.50','PNR004','credit','101A');
insert into billing_details values('B02','due=500', '2020-06-24','600.50','PNR011','paytm','101B');
insert into billing_details values('B03','paid','2020-07-22','750','PNR002','credit','101C');
insert into billing_details values('B04','paid','2020-08-04','700','PNR001','paytm','101D');
insert into billing_details values('B05','due=700','2020-12-04','800.50','PNR004','credit','101E');
insert into billing_details values('B06','paid','2020-05-24','750.50','PNR005','debit','101F');
insert into billing_details values('B07','due=500', '2020-06-24','600.50','PNR035','paytm','101G');
insert into billing_details values('B08','paid','2020-07-22','750','PNR045','credit','101H');
insert into billing_details values('B09','paid','2020-08-04','700','PNR046','paytm','101I');
insert into billing_details values('B10','due=700','2020-12-14','800.50','PNR004','credit','101J');
insert into billing_details values('B11','paid','2020-05-04','750.50','PNR005','debit','101K');
insert into billing_details values('B12','due=500', '2020-04-24','600.50','PNR011','paytm','101L');
insert into billing_details values('B13','paid','2020-07-23','750','PNR047','credit','101M');
insert into billing_details values('B14','paid','2020-08-04','700','PNR001','paytm','101N');
insert into billing_details values('B15','due=700','2020-12-04','800.50','PNR004','credit','101O');
insert into billing_details values('B16','paid','2020-05-24','750.50','PNR048','debit','101P');




insert into booking_details values('BK01','700.50','confirmed','500','B01');
insert into booking_details values('BK02','600.50','confirmed','500','B02');
insert into booking_details values('BK03','700.00','no','750','B01');
insert into booking_details values('BK04','800.50','confirmed','1000','B04');
insert into booking_details values('BK05','750.00','no','500','B03');
insert into booking_details values('BK06','800.50','confirmed','450','B05');
insert into booking_details values('BK07','600.50','confirmed','500','B02');
insert into booking_details values('BK08','700.00','no','750','B01');
insert into booking_details values('BK09','800.50','confirmed','1000','B04');
insert into booking_details values('BK10','750.00','no','500','B03');
insert into booking_details values('BK11','800.50','confirmed','450','B15');
insert into booking_details values('BK12','600.50','confirmed','500','B16');
insert into booking_details values('BK13','600.00','no','755','B01');
insert into booking_details values('BK14','800.50','confirmed','1000','B04');
insert into booking_details values('BK15','750.00','no','500','B03');
insert into booking_details values('BK16','800.50','confirmed','450','B05');

insert into depot values('VRL','D01');
insert into depot values('VRL','D02');
insert into depot values('SUGAMA','D03');
insert into depot values('DURGAMBA','D04');
insert into depot values('VRL','D05');
insert into depot values('SRS','D06');
insert into depot values('VRL','D07');
insert into depot values('SUGAMA','D08');
insert into depot values('DURGAMBA','D09');
insert into depot values('SUMUKHA','D10');
insert into depot values('SRS','D11');
insert into depot values('SOWMYA','D12');
insert into depot values('SUGAMA','D13');
insert into depot values('DURGAMBA','D14');
insert into depot values('BHARATHI','D15');
insert into depot values('SRS','D16');
			

insert into bus values('BUS01','VRL','D01','AC_sleeper');
insert into bus values('BUS03','SUGAMA','D04','AC_seater');
insert into bus values('BUS02','VRL','D02','NON_AC_sleeper');
insert into bus values('BUS05','SOWMYA','D04','AC_sleeper');
insert into bus values('BUS04','SRS','D03','NON_AC_sleeper');
insert into bus values('BUS06','VRL','D02','AC_sleeper');
insert into bus values('BUS07','SUGAMA','D04','AC_seater');
insert into bus values('BUS08','VRL','D02','NON_AC_sleeper');
insert into bus values('BUS09','Subha','D04','AC_sleeper');
insert into bus values('BUS10','SRS','D03','NON_AC_sleeper');
insert into bus values('BUS11','VRL','D02','AC_sleeper');
insert into bus values('BUS12','SUGAMA','D14','AC_seater');
insert into bus values('BUS13','VRL','D02','NON_AC_sleeper');
insert into bus values('BUS15','SOWMYA','D04','AC_sleeper');
insert into bus values('BUS14','SRS','D13','NON_AC_sleeper');
insert into bus values('BUS16','VRL','D12','AC_sleeper');

insert into driver values('DR01','Deva','30000','1988-03-02','male');
insert into driver values('DR03','Beva','30000','1987-06-03','male');
insert into driver values('DR02','Rama','20000','1965-05-13','male');
insert into driver values('DR05','Soma','22000','1988-06-24','male');
insert into driver values('DR04','Bhima','30000','1966-04-03','male');
insert into driver values('DR06','Krishna','25000','1988-06-30','male');
insert into driver values('DR13','Beva','30000','1987-06-03','male');
insert into driver values('DR12','Rama','20000','1986-05-13','male');
insert into driver values('DR15','Soma','22000','1988-06-24','male');
insert into driver values('DR14','shyama','30000','1985-04-03','male');
insert into driver values('DR16','Krishna','25000','1958-05-30','male');
insert into driver values('DR11','Beemanna','30000','1988-06-03','male');
insert into driver values('DR10','Rama','20000','1986-05-13','male');
insert into driver values('DR09','Somanna','22000','1990-06-24','male');
insert into driver values('DR08','Bhima','30000','1991-04-03','male');
insert into driver values('DR07','Krishna','25000','1988-06-30','male');


insert into drives values('BUS02','DR01','Deva','30000','1988-03-02');
insert into drives values('BUS01','DR03','Beva','30000','1987-06-03');
insert into drives values('BUS05','DR02','Rama','20000','1986-05-13');
insert into drives values('BUS04','DR05','Soma','22000','1988-06-24');
insert into drives values('BUS03','DR04','Bhima','30000','1985-04-03');
insert into drives values('BUS06','DR06','Krishna','25000','1988-06-30');
insert into drives values('BUS07','DR13','Beema','30000','1987-06-03');
insert into drives values('BUS15','DR16','Rama','20000','1986-05-13');
insert into drives values('BUS12','DR15','Soma','22000','1988-06-24');
insert into drives values('BUS13','DR14','Bhima','30000','1985-04-03');
insert into drives values('BUS16','DR12','Krishna','25000','1988-06-30');
insert into drives values('BUS11','DR11','Beva','30000','1987-06-03');
insert into drives values('BUS14','DR10','Rama','20000','1986-05-13');
insert into drives values('BUS10','DR09','Somanna','22000','1988-06-24');
insert into drives values('BUS09','DR08','Bhima','30000','1989-03-03');
insert into drives values('BUS08','DR07','Krishna','25000','1989-06-30');

insert into   route values('BUS01','R8','kundapur','thirupathi',1234,'2020-04-07');
insert into route values('BUS05','R4','bangalore','thirupathi',234,'2020-04-08');
insert into route values('BUS04','R9','kundapur','thirupathi',1423,'2020-04-07');
insert into   route values('BUS06','R2','kundapur','gulbarga',1234,'2020-04-09');
insert into   route values('BUS03','R6','kundapur','thirupathi',1034,'2020-04-10');
insert into   route values('BUS02','R1','Raichur','thirupathi',1204,'2020-04-07');
insert into route values('BUS15','R4','bangalore','thirupathi',234,'2020-04-09');
insert into route values('BUS04','R9','kundapur','thirupathi',1234,'2020-04-07');
insert into   route values('BUS16','R2','kundapur','gulbarga',1234,'2020-04-11');
insert into   route values('BUS03','R6','kundapur','shimoga',1034,'2020-04-12');
insert into   route values('BUS12','R1','Raichur','thirupathi',1204,'2020-04-08');
insert into route values('BUS05','R4','bangalore','thirupathi',234,'2020-04-11');
insert into route values('BUS04','R9','kundapur','gadag',1234,'2020-04-13');
insert into   route values('BUS06','R2','kundapur','gulbarga',1243,'2020-04-12');
insert into   route values('BUS03','R6','kundapur','thirupathi',1043,'2020-04-09');
insert into   route values('BUS02','R1','Raichur','thirupathi',1204,'2020-04-12');
