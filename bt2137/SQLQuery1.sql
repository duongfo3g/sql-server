create database music_store
go

use music_store
go

create table music_type (
	type_id int primary key identity(1,1),
	name nvarchar(50) not null,
	description nvarchar(100)
)
go

create table album (
	album_id varchar(20) primary key,
	title nvarchar(100) not null,
	type_id int,
	artists nvarchar(100),
	rate int default 0 check (rate >= 0 and rate <= 5),
	constraint fk_album_music_type foreign key (type_id) references music_type (type_id)
)
go

create table song (
	song_id int primary key identity(1,1),
	album_id varchar(20),
	song_title nvarchar(200) not null,
	artists nvarchar(50),
	author nvarchar(50),
	hits int check (hits >= 0),
	constraint fk_song_album foreign key (album_id) references album (album_id)
)
go

create index IX_SongTitle
on song (song_title)
go

create index IX_Artists
on song (artists)
go

insert into music_type (name, description)
values
('POP', N'Nhạc đương đại'),
('BALLAD', N'Nhạc nhẹ nhàng, trữ tình'),
('ROCK', N'Nhạc quần chúng') 
go

insert into album (album_id, title, type_id, artists, rate)
values
('A1', N'Buồn', 2, N'Tăng Duy Tân', 5),
('A2', N'Yêu', 1, N'Phương Ly', 4),
('A3', N'Goodbye Swallow', 3, 'Binz', 3)
go

insert into song (album_id, song_title, artists, author, hits)
values
('A2', N'Anh là ngoại lệ của em', N'Phương Ly', N'Justatee', 100),
('A1', N'Cắt đôi nỗi sầu', N'Tăng Duy Tân', N'Natha Lee', 200),
('A3', N'Hit me up', N'Binz', N'1977 Vlog', 300)
go

select * from album
where rate = 5
go

delete song
go

dbcc checkident ('song', reseed, 0)
go

select song.song_title, album.title
from album
join song on album.album_id = song.album_id
where album.title = 'Goodbye Swallow'
go

--album - music_type
create view v_Albums
as
select album.album_id, album.title, music_type.name, album.rate
from music_type
join album on music_type.type_id = album.type_id
go

select * from v_Albums
go

--top 10 (2)
create view view_Top2Song
as
select top(2) song.song_title, song.hits
from song
order by hits desc
go

select * from view_Top2Song
go


select * from music_type
select * from album
select * from song
go
