-- Creacion de BD
--Create database dbregistro
--go

use dbregistro
go
  
  -- Crear Table ciudades 
create table ciudades  (
  id int  primary key identity (1,1)
  ,nombre nvarchar (60) not null
  , estado bit  default 1
)
go 
   

-- create tablas personas 
create table personas(
id int primary key identity (1,1)
,nombre nvarchar (40) not null
,apellido nvarchar (40) not null
,ciudad_id int foreign key references  
ciudades (id) not null 
,activo bit default 1
)
go

/*consultas de insertar */
insert into ciudades (nombre) values ('masaya')
,('granada')
 ,('jinotepe')
 ,('managua')
 ,('león')
 go 
 insert into personas (nombre ,apellido,ciudad_id )values
 ('Belen' ,'Acuña', 4)
  ,('Erick' ,'Martinez', 4)
   ,('sergio' ,'Rivas', 1)
    ,('Elmer' ,'Martinez', 3)
	 ,('Cesar' ,'Gallardo', 5)
	 go

/*CRUD*/
/*visualizar datos*/
select*from ciudades 
go 
select*from personas 
select id as 'codigo',nombre as 'ciudad',estado as 'Est'from ciudades
go

select personas.id as  codigo ,personas.nombre +' '+ personas.apellido as 'Nombre completo',
ciudades.nombre as ciudad from personas inner join ciudades on personas.ciudad_id
=ciudades.id


/*variable */
declare @nombre nvarchar (40)

set @nombre= '%s%'
select *from personas where nombre like @nombre