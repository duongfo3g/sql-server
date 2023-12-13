create table BaiDoXe (
	ten_bai nvarchar(50),
	ma_bai_do_xe int primary key identity(1,1),
	dia_chi nvarchar(200),
);
go

create table ThongTinGui (
	id int primary key identity(1,1),
	ten_xe nvarchar(50),
	bien_so_xe nvarchar(20),
	ma_bai_do_xe int,
	id_chu_so_huu int,
	foreign key (ma_bai_do_xe) references BaiDoXe(ma_bai_do_xe),
	foreign key (id_chu_so_huu) references ChuSoHuu(id_chu_so_huu),
);
go

create table ChuSoHuu (
	id_chu_so_huu int primary key identity(1,1),
	ten nvarchar(50),
	so_cmtnd nvarchar(20),
	dia_chi nvarchar(200),
);
go

insert into BaiDoXe (ten_bai, ma_bai_do_xe,	dia_chi)
values
('Park1', 101, 'HN1')
go

insert into BaiDoXe (ten_bai, ma_bai_do_xe,	dia_chi)
values
('Park2', 102, 'HN2')
go

insert into BaiDoXe (ten_bai, dia_chi)
values
('Park3','HN3')
go

insert into BaiDoXe (ten_bai, dia_chi)
values
('Park4','HN4')
go

insert into BaiDoXe (ten_bai, dia_chi)
values
('Park5', 'HN5')
go


select * from BaiDoXe;

drop table BaiDoXe;