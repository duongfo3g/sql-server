create table student (
	roll_number nvarchar(10),
	first_name nvarchar(50),
	last_name nvarchar(50),
	subject nvarchar(50),
	marks int,
);
go
insert into student (roll_number, first_name, last_name, subject, marks)
values
('45', 'Jones', 'Bill', 'Maths', 84)
go
insert into student (roll_number, first_name, last_name, subject, marks)
values
('45', 'Jones', 'Bill', 'Science', 75)
insert into student (roll_number, first_name, last_name, subject, marks)
values
('50', 'Mary', 'Mathew', 'Science', 80)