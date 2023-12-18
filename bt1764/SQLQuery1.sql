create database quan_ly_sinh_vien_nang_cao_phan_2
go

use quan_ly_sinh_vien_nang_cao_phan_2
go

create table sinh_vien (
	rollno nvarchar(50) primary key,
	fullname nvarchar(50),
	age int,
	address nvarchar(50),
	email nvarchar(50),
	phoneNumber nvarchar(50),
	gender nvarchar(50)
)
go

create table mon_hoc (
	ma_mon_hoc nvarchar(50) primary key,
	ten_mon_hoc nvarchar(50)
)
go

create table diem (
	diem int,
	rollno nvarchar(50),
	ma_mon_hoc nvarchar(50),
	constraint fk_diem_sinh_vien foreign key (rollno) references sinh_vien (rollno),
	constraint fk_diem_mon_hoc foreign key (ma_mon_hoc) references mon_hoc (ma_mon_hoc)
)
go

create table lop_hoc (
	ma_lop_hoc nvarchar(50) primary key,
	ten_lop_hoc nvarchar(50)
)
go

create table quan_ly_lop_hoc (
	ma_lop_hoc nvarchar(50),
	rollno nvarchar(50),
	primary key (ma_lop_hoc, rollno),
	constraint fk_quan_ly_lop_hoc_lop_hoc foreign key (ma_lop_hoc) references lop_hoc (ma_lop_hoc),
	constraint fk_quan_ly_lop_hoc_sinh_vien foreign key (rollno) references sinh_vien (rollno)
)
go

create table phong_hoc (
	ten_phong_hoc nvarchar(50),
	ma_phong_hoc nvarchar(50),
	so_ban_hoc int,
	so_ghe_hoc int,
	dia_chi_lop_hoc nvarchar(50),
	ma_lop_hoc nvarchar(50),
	constraint fk_phong_hoc_lop_hoc foreign key (ma_lop_hoc) references lop_hoc (ma_lop_hoc),
	primary key (ma_phong_hoc)
)
go


create table book_gio_day (
	ma_mon_hoc nvarchar(50),
	ma_lop_hoc nvarchar(50),
	ma_phong_hoc nvarchar(50),
	gio_bat_dau_day smalldatetime,
	gio_tra_lop smalldatetime
	constraint fk_book_gio_day_lop_hoc foreign key (ma_lop_hoc) references lop_hoc (ma_lop_hoc),
	constraint fk_book_gio_phong_hoc foreign key (ma_phong_hoc) references phong_hoc (ma_phong_hoc),
	primary key (ma_mon_hoc, ma_lop_hoc)
)
go

insert into sinh_vien (rollno, fullname, age, address, email, phoneNumber, gender)
values
('2301001', 'Tran Van A', 20, N'Thái Bình', 'trangvana@gmail.com', '0912345678', 'nam'),
('2301002', 'Tran Van B', 20, N'Nam Định', 'trangvanb@gmail.com', '0912345679', N'nữ'),
('2301003', 'Tran Van C', 20, N'Vĩnh Phúc', 'trangvanc@gmail.com', '0912345677', 'nam'),
('2301004', 'Tran Van D', 20, N'Nam Định', 'trangvand@gmail.com', '0912345676', N'nữ'),
('2301005', 'Tran Van E', 20, N'Phú Thọ', 'trangvane@gmail.com', '0912345675', 'nam')
go


insert into mon_hoc (ma_mon_hoc, ten_mon_hoc)
values
('C2307A', 'Reactjs'),
('C2307B', 'HTML'),
('C2307C', 'UX UI'),
('C2307D', 'PHP'),
('C2307E', 'JS')
go


insert into diem (rollno, ma_mon_hoc, diem)
values
('2301001', 'C2307A', 5),
('2301001', 'C2307B', 6),
('2301001', 'C2307C', 7),
('2301001', 'C2307D', 8),
('2301001', 'C2307E', 9),
('2301002', 'C2307A', 5),
('2301002', 'C2307B', 4),
('2301002', 'C2307C', 3),
('2301002', 'C2307D', 2),
('2301002', 'C2307E', 1),
('2301003', 'C2307A', 2),
('2301003', 'C2307B', 3),
('2301003', 'C2307C', 4),
('2301003', 'C2307D', 5),
('2301003', 'C2307E', 6),
('2301004', 'C2307A', 1),
('2301004', 'C2307B', 2),
('2301004', 'C2307C', 3),
('2301004', 'C2307D', 4),
('2301004', 'C2307E', 5),
('2301005', 'C2307A', 3),
('2301005', 'C2307B', 4),
('2301005', 'C2307C', 5),
('2301005', 'C2307D', 6),
('2301005', 'C2307E', 7)
go

insert into lop_hoc (ma_lop_hoc, ten_lop_hoc)
values 
('APTECH1', 'A8A'),
('APTECH2', 'A7A'),
('APTECH3', 'A8B'),
('APTECH4', 'A6A'),
('APTECH5', 'A6D')
go

insert into quan_ly_lop_hoc (rollno, ma_lop_hoc)
values
('2301001', 'APTECH1'),
('2301002', 'APTECH5'),
('2301003', 'APTECH4'),
('2301004', 'APTECH3'),
('2301005', 'APTECH2')
go

select * from sinh_vien
go

select * from mon_hoc
go

select * from diem
go

select * from lop_hoc
go

select * from quan_ly_lop_hoc
go

select * from phong_hoc
go

select * from book_gio_day
go

select * from sinh_vien
where address = N'Nam Định'
go

select sinh_vien.rollno N'Mã sinh viên', sinh_vien.fullname N'Họ và tên', diem.diem N'Điểm'
from sinh_vien, diem
where sinh_vien.rollno = diem.rollno and sinh_vien.fullname = 'Tran Van A'
go

select sinh_vien.rollno N'Mã sinh viên', sinh_vien.fullname N'Họ và tên', diem.diem N'Điểm'
from sinh_vien, diem
where sinh_vien.rollno = diem.rollno
go

select sinh_vien.rollno N'Mã sinh viên', sinh_vien.fullname N'Họ và tên', diem.diem N'Điểm', mon_hoc.ten_mon_hoc N'Tên môn học'
from sinh_vien, diem, mon_hoc
where sinh_vien.rollno = diem.rollno and diem.ma_mon_hoc = mon_hoc.ma_mon_hoc
go