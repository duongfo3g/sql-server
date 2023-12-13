create database quan_ly_sinh_vien
go

use quan_ly_sinh_vien
go

create table sinh_vien (
	rollno nvarchar(50) primary key,
	fullname nvarchar(50),
	age int,
	address nvarchar(50),
	email nvarchar(50),
	phoneNumber nvarchar(50),
	gender nvarchar(50)
);
go

create table mon_hoc (
	ma_mon_hoc int identity(1,1),
	ten_mon_hoc nvarchar(50)
);
go

create table diem (
	diem int,
	rollno nvarchar(50),
	ma_mon_hoc int,
	primary key(rollno, ma_mon_hoc)
);
go

create table lop_hoc (
	ma_lop_hoc int primary key identity(1,1),
	ten_lop_hoc nvarchar(50)
);
go

create table phong_hoc (
	ten_phong_hoc nvarchar(50),
	ma_phong_hoc int primary key identity(1,1),
	so_ban_hoc int,
	so_ghe_hoc int,
	dia_chi_lop_hoc nvarchar(50)
);
go

insert into sinh_vien (rollno, fullname, age, address, email, phoneNumber, gender)
values
('1001', 'Nguyen Van A', 20, 'HN1', 'nguyenvana@gmail.com', '0912345678', 'Nam'),
('1002', 'Nguyen Van B', 21, 'HN2', 'nguyenvanb@gmail.com', '0912345679', 'Nu'),
('1003', 'Nguyen Van C', 22, 'HN3', 'nguyenvanc@gmail.com', '0912345670', 'Nam'),
('1004', 'Nguyen Van D', 23, 'HN4', 'nguyenvand@gmail.com', '0912345671', 'Nu'),
('1005', 'Nguyen Van E', 23, 'HN5', 'nguyenvane@gmail.com', '0912345672', 'Nam')
go

insert into mon_hoc (ten_mon_hoc)
values
('Toan'),
('Van'),
('Hoa'),
('Vat Ly'),
('Sinh hoc')
go

insert into diem (diem, rollno, ma_mon_hoc)
values
(6, '1001', 1),
(7, '1002', 2),
(8, '1003', 3),
(9, '1004', 4),
(10, '1005', 5)
go


insert into lop_hoc (ten_lop_hoc)
values
('M1K73'),
('N1K73'),
('O1K73'),
('P1K73'),
('Q1K73')
go

insert into phong_hoc (ten_phong_hoc, so_ban_hoc, so_ghe_hoc, dia_chi_lop_hoc)
values
('Mark', 20, 30, '19 Le Thanh Nghi'),
('Bill', 40, 50, '20 Le Thanh Nghi'),
('Gates', 60, 70, '21 Le Thanh Nghi'),
('Donald', 80, 90, '22 Le Thanh Nghi'),
('Trump', 100, 10, '23 Le Thanh Nghi')
go

select * from sinh_vien
go

select * from mon_hoc
go

select * from diem
go

select * from lop_hoc
go

select * from phong_hoc
go

select * from phong_hoc
where so_ban_hoc > 5 and so_ghe_hoc > 5
go

select * from phong_hoc
where (so_ban_hoc between 5 and 20)  and (so_ghe_hoc between 5 and 20)
go

select * from phong_hoc
update phong_hoc set so_ban_hoc = 1
where ma_phong_hoc = 1 
go

select * from phong_hoc
update phong_hoc set so_ban_hoc = 6
where ma_phong_hoc = 2 
go

select * from phong_hoc
update phong_hoc set so_ban_hoc = 8
where ma_phong_hoc = 3 
go

select * from phong_hoc
update phong_hoc set so_ban_hoc = 21
where ma_phong_hoc = 4 
go

select * from phong_hoc
update phong_hoc set so_ban_hoc = 15
where ma_phong_hoc = 5
go

select * from phong_hoc
update phong_hoc set so_ghe_hoc = 6
where ma_phong_hoc = 1
go

select * from phong_hoc
update phong_hoc set so_ghe_hoc = 4
where ma_phong_hoc = 2
go

select * from phong_hoc
update phong_hoc set so_ghe_hoc = 10
where ma_phong_hoc = 3
go

select * from phong_hoc
update phong_hoc set so_ghe_hoc = 21
where ma_phong_hoc = 4
go

select * from phong_hoc
update phong_hoc set so_ghe_hoc = 15
where ma_phong_hoc = 5
go