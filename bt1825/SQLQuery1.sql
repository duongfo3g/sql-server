create database quan_ly_bai_do_xe
go

use quan_ly_bai_do_xe
go


create table bai_do_xe (
	ma_bai_do_xe int identity(1,1) primary key,
	ten_bai nvarchar(50),
	dia_chi nvarchar(200)
)
go

create table thong_tin_gui (
	ten_xe nvarchar(50),
	bien_so_xe nvarchar(50),
	ma_bai_do_xe int,
	ngay_gui_xe date,
	ngay_lay_xe date,
	chi_phi money,
	id_chu_so_huu int,
	constraint fk_thong_tin_gui_bai_do_xe foreign key (ma_bai_do_xe) references bai_do_xe (ma_bai_do_xe),
	constraint fk_thong_tin_gui_chu_so_huu foreign key (id_chu_so_huu) references chu_so_huu (id_chu_so_huu)
)
go

create table chu_so_huu (
	id_chu_so_huu int identity(1,1) primary key,
	ten_chu_so_huu nvarchar(50),
	so_cmtnd nvarchar(50),
	dia_chi nvarchar(200)
)
go

insert into bai_do_xe (ten_bai, dia_chi)
values
('Old Trafford', 'England'),
('Santiago Bernabeu', 'Spain'),
('Alianz Arena', 'Germany')
go

insert into chu_so_huu (ten_chu_so_huu, so_cmtnd, dia_chi)
values
('Ronaldo', '026200001234', 'Portugal'),
('Messi', '02620004321', 'Argentina'),
('Benzema', '02620000654', 'France')
go

insert into	thong_tin_gui (ten_xe, bien_so_xe, ma_bai_do_xe, ngay_gui_xe, ngay_lay_xe, chi_phi, id_chu_so_huu)
values
('G63', '29A-1234', 1, '2023-12-20', '2023-12-21', 1000000, 2),
('Kia Morning', '29A-1235', 2, '2023-12-19', '2023-12-22', 2000000, 3),
('Maybach', '29A-1235', 3, '2023-12-19', '2023-12-22', 2000000, 1)
go


select * from thong_tin_gui
select * from chu_so_huu
select * from bai_do_xe

drop table thong_tin_gui
drop table chu_so_huu
drop table bai_do_xe