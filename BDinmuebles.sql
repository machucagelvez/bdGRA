create DATABASE bdGRA
USE bdGRA
CREATE TABLE inmueble(
codigoInmueble int,    
ciudad VARCHAR (30),    
tipoInmueble VARCHAR(30),
tipoNegocio VARCHAR(30),
precio bigint,
alcobas int,
ba�os int,
garajePuestos int,
a�oDeConstrucci�n int,
area int
CONSTRAINT pkInmueble PRIMARY KEY (codigoInmueble))
	

create TABLE cliente(
codigoCliente int,
estadoCliente VARCHAR(30),
nombresApellidos VARCHAR(50),
celular bigint,
telefonoFijo int,
correoElectronico VARCHAR(50),
tipoCliente VARCHAR(30)
CONSTRAINT pkcliente PRIMARY KEY (codigoCliente))


CREATE TABLE captacion(
codigoInmuebleCaptacion int,
tipoInmuebleCaptacion VARCHAR(30),
telefonoCaptacion int,
direccionCaptacion VARCHAR(50),
sectorCaptacion VARCHAR(30),
estadoCaptacion VARCHAR(30)
CONSTRAINT pkCaptacion PRIMARY KEY (codigoInmuebleCaptacion))

CREATE TABLE inmueble_cliente(
codigoInmueble1 int,
codigoCliente1 int
CONSTRAINT fkCI FOREIGN KEY (codigoInmueble1) REFERENCES inmueble(codigoInmueble),
CONSTRAINT fkCC FOREIGN KEY (codigoCliente1) REFERENCES cliente(codigoCliente))

create TABLE captacion_cliente(
codigoCliente2 int,
codigoInmuebleCaptacion1 int,
CONSTRAINT fkCapCliente FOREIGN KEY (codigoCliente2) REFERENCES cliente(codigoCliente),
CONSTRAINT fkCliIn FOREIGN KEY (codigoInmuebleCaptacion1) REFERENCES captacion(codigoInmuebleCaptacion))

select * from inmueble
insert into inmueble values(20201, 'Bogot�', 'Casa', 'Venta', 300000000, 3, 2, 1, 2000, 100)
insert into inmueble values(20202, 'Medell�n', 'Apartamento', 'Arriendo',1000000, 2, 2, 1, 1995, 80)
insert into inmueble values(20203, 'Bucaramanga', 'Casa', 'Arriendo', 1500000, 3, 2, 2, 2010, 120)
insert into inmueble values(20204, 'Bogot�', 'Finca', 'Venta', 800000000, 5, 4, 3, 2000, 1000)
insert into inmueble values(20205, 'Medell�n', 'Casa', 'Arriendo', 1200000, 2, 2, 0, 1980, 85)
insert into inmueble values(20206, 'Cali', 'Apartamento', 'Venta', 150000000, 2, 1, 0, 1994, 60)
insert into inmueble values(20207, 'Medell�n', 'Finca', 'Venta', 1500000000, 6, 4, 5, 1987, 1500)

select * from cliente
insert into cliente values(1, 'Activo','Taborda Martinez Jes�s',3012049123,2636883,'jesus@gmail.com','Comprador')
insert into cliente values(2,'Activo','Restrepo Arenas Javier',3024958345,2636883,'gloria@gmail.com','Arrendador')
insert into cliente values(3,'Activo','Jaramillo Sara',3029580897,2632883,'sara@gmail.com','Arrendador')
insert into cliente values(4,'Inactivo','P�rez Benito',3056356785,2631209,'benito@gmail.com','Comprador')

select * from captacion
insert into captacion values(101, 'Casa', 4563217, 'Cll 1 # 2-3', 'Norte', 'Por contactar')
insert into captacion values(102, 'Finca', 9872345, 'Cll 4 # 5-6', 'Sur', 'Contactado')
insert into captacion values(103, 'Apartamento', 5436788, 'Cll 7 # 8-9', 'Occidente', 'Por contactar')

select * from inmueble_cliente
insert into inmueble_cliente values(20201, 3)
insert into inmueble_cliente values(20201, 2)
insert into inmueble_cliente values(20202, 3)
insert into inmueble_cliente values(20203, 1)
insert into inmueble_cliente values(20203, 3)
insert into inmueble_cliente values(20201, 4)
insert into inmueble_cliente values(20204, 2)
insert into inmueble_cliente values(20205, 1)
insert into inmueble_cliente values(20206, 2)
insert into inmueble_cliente values(20207, 3)

select * from captacion_cliente
insert into captacion_cliente values(1, 101)
insert into captacion_cliente values(1, 103)
insert into captacion_cliente values(2, 101)
insert into captacion_cliente values(3, 103)
insert into captacion_cliente values(3, 102)

---------------------Consultas---------------------

--Mostrar todos los inmuebles que est�n en venta y con precio menor a $200.000.000
select codigoInmueble, tipoInmueble, ciudad, precio from inmueble where tipoNegocio='Venta' and precio<200000000

--Mostrar los inmuebles (casas) que est�n en arriendo y el costo
select codigoInmueble, precio, ciudad, tipoNegocio from inmueble where tipoNegocio='Arriendo' and tipoInmueble='Casa'

--Mostrar los inmuebles que est�n en arriendo y que tengan parqueadero
select codigoInmueble, tipoInmueble, tipoNegocio, garajePuestos, ciudad from inmueble where tipoNegocio='Arriendo' and garajePuestos!=0

--Mostrar los inmuebles en los que est� interesado el cliente Jaramillo Sara
select codigoInmueble1 from cliente inner join inmueble_cliente on cliente.codigoCliente = inmueble_cliente.codigoCliente1 where nombresApellidos='Jaramillo Sara'

select * from inmueble

--Realizar una consulta que comience con la letra B
select * from inmueble where ciudad like 'B%'

--Realizar una consulta que termine con la letra n
select * from inmueble where ciudad like '%n'

--Realizar una consulta que muestre un nombre en particular
select * from inmueble where ciudad like 'Medell�n'

--Realizar una consulta que ordene en forma ascendente
select * from inmueble order by ciudad asc

--Realizar una consulta que ordene en forma descendente
select * from inmueble order by ciudad desc

--Empleo de la cl�usula count (contar y agrupar)
select tipoInmueble, count(tipoInmueble) as cantidad from inmueble group by tipoInmueble

--Filtrar el count
select tipoInmueble, count(tipoInmueble) as cantidad from inmueble group by tipoInmueble having count(*)>2

--Sumas
select sum(precio) as suma from inmueble

--between
--Sin between
select codigoInmueble, tipoInmueble, precio from inmueble where precio>=200000000 and precio<=1000000000 order by precio

--Con between
select codigoInmueble, tipoInmueble, precio from inmueble where precio between 200000000 and 1000000000 order by precio

--Mostrar informaci�n particular
select * from inmueble where (tipoNegocio in ('Venta'))

--No mostrar informaci�n particular
select * from inmueble where (tipoNegocio not in ('Venta'))

--Mostrar un n�mero determinado de registros
select top 3 * from inmueble

--Mostar campos sin repetir
select distinct ciudad from inmueble order by ciudad

--Promedio
select avg (precio) as promedio from inmueble where tipoNegocio='Arriendo'

--M�nimo y m�ximo
select min (precio) as m�nimo from inmueble where tipoNegocio='Arriendo'
select max (precio) as m�nimo from inmueble where tipoNegocio='Arriendo'