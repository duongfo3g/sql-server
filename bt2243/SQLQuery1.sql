create database fifa
go

use fifa
go

create table trong_tai (
	id int primary key identity(1,1),
	fullname nvarchar(50) not null,
	address nvarchar(200) not null,
	level float,
	exp date
)
go

create table lich_su_bat (
	id int primary key identity(1,1),
	id_trong_tai int,
	giai_dau nvarchar(100) not null,
	ngay_bat date,
	rate float,
	id_club_1 int,
	id_club_2 int,
	note nvarchar(500),
	constraint fk_lich_su_bat_trong_tai foreign key (id_trong_tai) references trong_tai (id),
	constraint fk_lich_su_bat_doi_bong_1 foreign key (id_club_1) references doi_bong (id),
	constraint fk_lich_su_bat_doi_bong_2 foreign key (id_club_2) references doi_bong (id),
)
go

create table doi_bong (
	id int primary key identity(1,1),
	ten_doi_bong nvarchar(50),
	san_chu_nha nvarchar(100),
	huan_luyen_vien nvarchar(50)
)
go

create table cau_thu (
	id int primary key identity(1,1),
	fullname nvarchar(50),
	birthday date,
	salary money,
	ngay_bat_dau_da date
)
go

create table team (
	id_club int,
	id_player int,
	ngay_tham_gia_doi_bong date,
	constraint fk_team_doi_bong foreign key (id_club) references doi_bong (id),
	constraint fk_team_cau_thu foreign key (id_player) references cau_thu (id),
)
go


insert into trong_tai (fullname, address, level, exp)
values
('Szymon Marciniak', 'Ba Lan', 8, '2015-12-20'),
('Anthony Taylor', 'Anh', 7, '2016-12-20'),
('Claudio Circhetta', N'Thụy Sĩ', 9, '2014-12-20'),
('Antonio Mateu Lahoz', N'Tây Ban Nha', 10, '2013-12-20'),
('Clement Turpin', 'Nga', 12, '2011-12-20')
go


insert into doi_bong (ten_doi_bong, san_chu_nha, huan_luyen_vien)
values
('Real Madrid', 'Santiago Bernabeu', 'Carlo Ancelotti'),
('Chelsea', 'Stamford Bridge', 'Thomas Tuchel'),
('Manchester United', 'Old Trafford', 'Sir Alex'),
('Barcelona', 'Nou Camp', 'Valverde'),
('Arsenal', 'Emirates', 'Mikel Arteta')
go


insert into lich_su_bat (id_trong_tai, giai_dau, ngay_bat, rate, id_club_1, id_club_2, note)
values
(1, 'UEFA Champions Leaguage', '2019-09-18', 5, 1, 5, N'2 thẻ đỏ'),
(2, 'UEFA Champions Leaguage', '2019-10-01', 4, 2, 3, N'3 thẻ đỏ'),
(3, 'UEFA Champions Leaguage', '2019-10-22', 3, 3, 4, N'3 thẻ vàng'),
(4, 'UEFA Champions Leaguage', '2019-01-22', 2, 4, 2, N'5 thẻ đỏ'),
(5, 'UEFA Champions Leaguage', '2019-11-06', 1, 4, 1, N'2 thẻ vàng')
go

insert into cau_thu (fullname, birthday, salary, ngay_bat_dau_da)
values
('Mohamed Salah', '1992-6-15', 200000, '2005-09-01'),
('Cristiano Ronaldo', '1985-2-5', 600000, '2003-09-01'),
('Lionel Messi', '1987-5-5', 500000, '2004-09-01'),
('Gareth Bale', '1987-6-25', 400000, '2005-09-01'),
('Jude Bellingham', '2003-5-25', 300000, '2005-09-01')
go

insert into team (id_club, id_player, ngay_tham_gia_doi_bong)
values
(1, 2, '2009-09-01'),
(2, 1, '2008-06-01'),
(3, 4, '2006-04-01'),
(4, 3, '2012-07-01'),
(5, 5, '2014-05-01')
go

select * from trong_tai
select * from doi_bong
select * from lich_su_bat
select * from cau_thu
go

-- Xem thông tin lịch sử bắt của trọng tài - tên trọng tài, level, exp, giải bóng, đội 1, đội 2

create view referee
as
select trong_tai.fullname, trong_tai.level, trong_tai.exp, lich_su_bat.giai_dau, doi_bong.ten_doi_bong, doi_bong.ten_doi_bong
from trong_tai, lich_su_bat, doi_bong
where trong_tai.id = lich_su_bat.id_trong_tai
	

