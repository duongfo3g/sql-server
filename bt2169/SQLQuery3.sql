create table customer (
	cust_no nvarchar(10) primary key,
	cust_name nvarchar(50),
	phone_no nvarchar(20),
);
go

insert into customer (cust_no, cust_name, phone_no)
values
('1', 'David Gordon', '0231-5466356')
go

insert into customer (cust_no, cust_name, phone_no)
values
('2', 'Prince Fernandes', '0221-5762382')
go

insert into customer (cust_no, cust_name, phone_no)
values
('3', 'Charles Yale', '0321-8734723')
go

insert into customer (cust_no, cust_name, phone_no)
values
('4', 'Ryan Ford', '0241-2343444')
go

insert into customer (cust_no, cust_name, phone_no)
values
('5', 'Bruce Smith', '0241-8472198')
go

create table items (
	item_no nvarchar(10) primary key,
	description nvarchar(50),
	price int,
);
go

insert into items (item_no, description, price)
values
('HW1', 'Power Supply', 4000)
go

insert into items (item_no, description, price)
values
('HW2', 'Keyboard', 2000)
go

insert into items (item_no, description, price)
values
('HW3', 'Mouse', 800)
go

insert into items (item_no, description, price)
values
('SW1', 'Office Suite', 15000)
go

insert into items (item_no, description, price)
values
('SW2', 'Payrroll Software', 8000)
go

create table order_details (
	ord_no nvarchar(10),
	item_no nvarchar(10),
	qty int,
);
go

insert into order_details (ord_no, item_no, qty)
values
('101', 'HW3', 50)
go

insert into order_details (ord_no, item_no, qty)
values
('101', 'SW1', 150)
go

insert into order_details (ord_no, item_no, qty)
values
('102', 'HW2', 10)
go

insert into order_details (ord_no, item_no, qty)
values
('103', 'HW3', 50)
go

insert into order_details (ord_no, item_no, qty)
values
('104', 'HW2', 25)
go

insert into order_details (ord_no, item_no, qty)
values
('104', 'HW3', 100)
go

insert into order_details (ord_no, item_no, qty)
values
('104', 'HW3', 100)
go

insert into order_details (ord_no, item_no, qty)
values
('105', 'SW1', 100)
go

create table order_august (
	ord_no nvarchar(10),
	ord_date nvarchar(10),
	cust_no nvarchar(10),
);
go

insert into order_august (ord_no, ord_date, cust_no)
values
('101', '02-08-12', '002')
go

insert into order_august (ord_no, ord_date, cust_no)
values
('102', '11-08-12', '003')
go

insert into order_august (ord_no, ord_date, cust_no)
values
('103', '21-08-12', '003')
go

insert into order_august (ord_no, ord_date, cust_no)
values
('104', '28-08-12', '002')
go

insert into order_august (ord_no, ord_date, cust_no)
values
('105', '30-08-12', '005')
go

select * from customer;
select * from items;
select * from order_details;
select * from order_august;