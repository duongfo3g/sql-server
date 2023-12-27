-- 1. Database creation
create database QuanLyNhanKhau
go

use QuanLyNhanKhau
go

-- 2. Table creation
create table QuanHuyen (
	MaQH int identity(1,1) not null,
	TenQH nvarchar(100)
)
go

create table DuongPho (
	DuongID int not null,
	MaQH int not null,
	TenDuong nvarchar(max) not null,
	NgayDuyetTen datetime null
)
go

create table NhaTrenPho (
	NhaID int not null,
	DuongID int not null,
	ChuHo nvarchar(50) null,
	DienTich money null
)
go


-- 3. Index and table alternation
create clustered index CI_NhaTrenPho_NhaID on QuanHuyen (TenQH)
go

create unique nonclustered index UI_QuanHuyen_TenQH on QuanHuyen (TenQH)
go

alter table NhaTrenPho
add SoNhanKhau int
go

-- 4. Constraint

alter table QuanHuyen
add constraint PK_QuanHuyen primary key (MaQH)
go

alter table DuongPho
add constraint PK_DuongPho primary key (DuongID)
go

alter table NhaTrenPho
add constraint PK_NhaTrenPho primary key (NhaID)
go

alter table NhaTrenPho
add constraint FK_NhaTrenPho_DuongPho foreign key (DuongID) references DuongPho (DuongID)
go

alter table DuongPho
add constraint FK_DuongPho_QuanHuyen foreign key (MaQH) references QuanHuyen (MaQH)
go

alter table DuongPho
add constraint CK_DuongPho_NgayDuyetTen check (NgayDuyetTen between '1945-09-02' and getdate())
go

-- 5. Inserting data
insert into QuanHuyen (TenQH)
values
(N'Ba Đình'),
(N'Hoàng Mai')
go

insert into DuongPho (DuongID, MaQH, TenDuong, NgayDuyetTen)
values
(1, 1, N'Đội Cấn', '1946-10-19'),
(2, 1, N'Vạn Phúc', '1998-12-30'),
(3, 2, N'Giải Tỏa', '1975-09-21')
go

insert into NhaTrenPho (NhaID, DuongID, ChuHo, DienTich, SoNhanKhau)
values
(1, 1, N'Hà Khánh Toàn', 100, 4),
(2, 1, N'Lê Hồng Hải', 20, 12),
(3, 2, N'Trần Khánh', 40, 1)
go

-- 6. Query operation

update DuongPho
set TenDuong = N'Giải Phóng'
where TenDuong = N'Giải Tỏa'
go

-- 7. Views

create view vw_all_Nha_Tren_Pho
as
select QuanHuyen.TenQH, DuongPho.TenDuong, DuongPho.NgayDuyetTen,NhaTrenPho.ChuHo, NhaTrenPho.DienTich, NhaTrenPho.SoNhanKhau
from DuongPho
join QuanHuyen on DuongPho.MaQH = QuanHuyen.MaQH
join NhaTrenPho on DuongPho.DuongID = NhaTrenPho.DuongID
go

select * from vw_all_Nha_Tren_Pho
go

-- 8. Views

create view vw_AVG_Nha_Tren_Pho
as
select DuongPho.TenDuong, AVG(NhaTrenPho.DienTich), AVG(NhaTrenPho.SoNhanKhau)
from DuongPho
join NhaTrenPho on DuongPho.DuongID = NhaTrenPho.DuongID
group by DuongPho.TenDuong
order by AVG(NhaTrenPho.DienTich) asc, AVG(NhaTrenPho.SoNhanKhau) asc
go

select * from vw_AVG_Nha_Tren_Pho
go


select * from QuanHuyen
select * from DuongPho
select * from NhaTrenPho
go