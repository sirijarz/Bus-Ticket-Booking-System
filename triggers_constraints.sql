/*CHECK AND FOREIGN KEY CONSTRAINTS IN DDL*/

alter table tickets add constraint FK_custid foreign key(cust_id) references customer(customer_id) on delete cascade on update cascade

alter table booking_details add constraint FK_billid foreign key(bill_id) references billing_details(bill_id) on delete cascade on update cascade

alter table driver add constraint FK_busid foreign key(B_id) references bus(bus_id) on delete cascade on update cascade

alter table customer add constraint gender_check check(gender='male' or gender='female')

alter table discountdetails add constraint disc_check check(discount_amount < 200)

/*TRIGGER 1 - AFTER UPDATE TRIGGER for driver table*/

CREATE TABLE driver_Test_Audit
(
driver_id varchar(15),
name varchar(15),
salary float,
dob date,
gender varchar(10),
Audit_Action varchar(100),
Audit_Timestamp datetime
)

CREATE TRIGGER trgAfterUpdate 
ON driver
for UPDATE
AS
begin
	declare @empid varchar(15);
	declare @empname varchar(100);
	declare @empsal decimal(10,2);
	declare @empdob date;
	declare @empgender varchar(10);
	declare @audit_action varchar(100);

	select @empid=i.driver_ID from inserted i;	
	select @empname=i.name from inserted i;	
	select @empsal=i.salary from inserted i;	
	select @empdob=i.dob from inserted i;
	select @empgender=i.gender from inserted i;
	
	if update(name)
		set @audit_action='Updated Record -- After Update Trigger.';
	if update(salary)
		set @audit_action='Updated Record -- After Update Trigger.';

	insert into driver_Test_Audit(driver_ID,name,salary,Audit_Action,Audit_Timestamp) 
	values(@empid,@empname,@empsal,@audit_action,getdate());

	PRINT 'AFTER UPDATE Trigger fired.'
end
GO

update driver set salary= 12000 where driver_id= 'DR04'


/*TRIGGER 2 - AFTER INSERT TRIGGER for security deposit in booking details*/

CREATE TABLE bookDetails_Test_Audit
(
prompt varchar(30),
book_id varchar(15),
amount float,
bookingstatus varchar(15),
securitydeposit float,
bill_id varchar(15),
Audit_Action varchar(100),
Audit_Timestamp datetime
)


CREATE TRIGGER violateAfterInsert 
ON booking_details 
FOR INSERT
AS
	declare @bookid varchar(15);
	declare @billamount float;
	declare @bookstatus varchar(15);
	declare @secudeposit float;
	declare @bill_id varchar(15);
	declare @audit_action varchar(100);

	select @bookid= i.book_id from inserted i;
	select @billamount= i.amount from inserted i;
	select @bookstatus =i.bookingstatus from inserted i;	
	select @secudeposit=i.securitydeposit from inserted i;
	select @bill_id=i.bill_id from inserted i;	
	set @audit_action='Inserted Record -- After Insert Trigger.';

	if(@secudeposit > 400)

	insert into bookDetails_Test_Audit
           (prompt,book_id,amount,bookingstatus,securitydeposit,bill_id,Audit_Action,Audit_Timestamp) 
	values('insertion done',@bookid,@billamount,@bookstatus,@secudeposit,@bill_id,@audit_action,getdate());

	else
	insert into bookDetails_Test_Audit
           (prompt,book_id,amount,bookingstatus,securitydeposit,bill_id,Audit_Action,Audit_Timestamp) 
	values('security deposit less',@bookid,@billamount,@bookstatus,@secudeposit,@bill_id,@audit_action,getdate());

	PRINT 'AFTER INSERT trigger fired.'
GO


insert into booking_details values('BK17','700.50','confirmed','500','B01');
insert into booking_details values('BK18','650.50','no','300','B03');
insert into booking_details values('BK19','600.00','confirmed','500','B07');

/*delete from booking_details where book_id='BK26';*/


/*QUERIES*/

/*query1*/
/*List all the available buses from kundapur to thirupathi on 7th April.*/
	select buscompanyname,bus_type
from bus
where bus_id in(select B_id
from route
where source='kundapur' and destination='thirupathi' and date_of_journey = '2020-04-07' );

/*query2*/
/* List all the driver names who drive a “VRL”.*/
	select distinct d.D_name
from drives as d
where exists(select b.bus_id
		from bus as b
		where (d.B_id=b.bus_id and b.buscompanyname= 'VRL'))

/*query3*/
/*Select all the names of customers who have more than 2 bookings for the same bill */
	select c.customer_id,c.name
from customer c
where exists (select bd.bill_id
       from booking_details bd,billing_details bbd ,tickets t
      where bd.bill_id = bbd.bill_id and bbd.pnr_no = t.pnr  and t.cust_id = c.customer_id
       group by bd.bill_id
       having count(*)>2);



/*aggregate queries*/

/*query4*/
/*Display  the total amount of discount given to all the customers*/
	select SUM(discount_amount)
from discountdetails

/*query5*/
/*Display the number of drivers having salary more than 25,000.*/

/*outer join queries*/

/*query6*/
select distinct c.name as cust_name, c.customer_id, t.cust_id, t.seatno as seat
from customer as c full outer join tickets as t
on c.customer_id= t.cust_id;

/*query7*/
select distinct r.B_id, r.R_no, b.bus_id, b.buscompanyname as bus_company
from route as r full outer join bus as b
on r.B_id= b.bus_id
where r.R_no ='R2';


