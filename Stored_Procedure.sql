Create database rh
use rh
create table category(id int primary key identity,name varchar(30))
create table product(id int primary key identity,name varchar(43),price int,quantity int,
cat_id int foreign key references category(id))
create proc sp_category
@action varchar(23),
@id int=0,
@name varchar(34)=null
as 
begin
if(@action='create')
begin
insert into category(name)values(@name)
select 1 as result
end

else if(@action='delete')
begin
delete from category where id=@id
select 1 as result
end

else if(@action='update')
begin
update category set name=@name where id=@id
select 1 as result
end

else if(@action='select')
begin
select * from category 
end
end

exec sp_category 'select'
exec sp_category 'create',0,'fashion'
exec sp_category 'update',0,'electronic'
exec sp_category 'delete',1


create proc sp_product
@action varchar(45),
@id int=0,
@name varchar(30)=null,
@price int=null,
@quantity int=null,
@cat_id int=0
as 
begin

if(@action='create')
begin
 
insert into product(name,price,quantity,cat_id)
values(@name,@price,@quantity,@cat_id)
select 1 as result
end


else if (@action='delete')
begin
delete from product where id=@id
select 1 as  result
end

else if(@action='select')
begin
select * from product 
end

else if(@action='update')
begin
update product set name=@name,price=@price,quantity=@quantity,cat_id=@cat_id where id=@id
select 1 as result
end
end

exec sp_product 'create',1,'t-shirt',5675,786, 1
exec sp_product 'select'







