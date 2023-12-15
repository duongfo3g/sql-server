create database cua_hang_thoi_trang
go

use cua_hang_thoi_trang
go

create table product (
	id int primary key identity(1,1),
	title nvarchar(50),
	thumbnail nvarchar(100),
	content ntext
)
go

create table product_category (
	id int primary key identity(1,1),
	name nvarchar(50)
)
go

alter table product
add price money, 
	num int, 
	created_at date, 
	updated_at date,
	id_cat int not null,
	constraint fk_product_product_cat foreign key (id_cat) references product_category(id)
go

alter table product
alter column thumbnail nvarchar(100)
go

insert into product_category (name)
values
('JACKET'),
('SHORTS'),
('HOODIES')
go

insert into product (title, thumbnail, content, price, num, created_at, updated_at, id_cat)
values
('S CROSS POLO', 'https://cdn.ssstutter.com/products/66z6ao28eNQDG839/122023/1702569661474.webp', N'Phiên bản giới hạn 2024 - Polo hình thêu chữ S đỏ', 999, 1000, '2023-10-11', '2023-12-15', 1),
('ITALY SUIT JACKET', 'https://cdn.ssstutter.com/products/66z6ao28eNQDG839/122023/1702625688362.webp', N'Chưa có mô tả cho sản phẩm này', 1999, 2000, '2023-09-12', '2023-12-15', 2),
('ITALY TROUSERS', 'https://cdn.ssstutter.com/products/66z6ao28eNQDG839/122023/1702625864680.jpeg', N'Chưa có mô tả cho sản phẩm này', 2999, 3000, '2023-08-13', '2023-12-15', 3),
('SMART POCKET SHIRT', 'https://cdn.ssstutter.com/products/66z6ao28eNQDG839/122023/1702563353283.jpeg', N'Áo thông minh có túi, 2 cổ linh hoạt và hình thêu Thỏ', 3999, 4000, '2023-10-19', '2023-12-15', 1),
('S CROSS TEE', 'https://cdn.ssstutter.com/products/66z6ao28eNQDG839/122023/1702376846277.jpeg', N'Phiên bản giới hạn 2024 - Áo thun hình thêu chữ S đỏ', 4999, 5000, '2023-05-05', '2023-12-15', 2)
go

select * from product
go 

select * from product_category
go

update product
set price = 0
where price = 1999 or price = 3999
go

update product
set price = 5000
where price = 0 or price = null
go

update product
set created_at = '2020-01-01'
where created_at = '2023-10-11'
go

update product
set price = price * 0.9
where created_at < '2020-06-06' 
go

update product
set created_at = '2015-08-13'
where created_at = '2023-10-19'
go

delete from product
where created_at < '2016-12-31'
go