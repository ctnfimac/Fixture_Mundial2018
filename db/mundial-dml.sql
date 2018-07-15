USE mundialDB;
/**************************************************************************************************
 *
 * Ingreso los datos a las tablas
 *
 **************************************************************************************************/

INSERT INTO grupo(cod_grupo, descripcion) 
VALUES  (1,'GRUPO A'),
		(2,'GRUPO B'),
        (3,'GRUPO C'),
        (4,'GRUPO D'),
        (5,'GRUPO E'),
        (6,'GRUPO F'),
        (7,'GRUPO G'),
        (8,'GRUPO H');
        


INSERT INTO integrante(cod_integrante, nombre, fecha_nacimiento) VALUES
(1,'Sergio Romero', '19950120'),
(2,'Sergio Agüero', '19960121'),
(3,'Javier Mascherano', '19970122'),
(4,'Marcos Acuña', '19980123'),
(5,'Nicolás Otamendi', '19990124'),
(6,'Marcos Rojo', '20000125'),
(7,'nombre 7', '19870126'),
(8,'nombre 8', '19880127'),
(9,'nombre 9', '19890128'),
(10,'nombre 10', '19900129'),
(11,'nombre 11', '19910130');

INSERT INTO equipo(cod_equipo, nombre, cod_grupo) VALUES
(1,'Argentina',4),
(2,'Nigeria',4),
(3,'Brasil',5),
(4,'Uruguay',1),
(5,'Rusia',1),
(6,'Portugal',2),
(7,'Irán',2),
(8,'España',2),
(9, 'Perú',3);

INSERT INTO nacionalidad(cod_nacionalidad, descripcion) VALUES
(1, 'Argentino'),
(2, 'Ruso'),
(3, 'Uruguayo'),
(4, 'Peruano'),
(5, 'Brasilero'),
(6, 'Aleman'),
(7, 'Mexicano'),
(8, 'Colombiano');

INSERT INTO DT(cod_integrante, anios_experiencia, cod_nacionalidad, cod_equipo) VALUES
(1, 5 , 1 , 1),
(2, 10 , 2 , 2),
(3, 8 , 3 , 2),
(4, 15 , 4 , 4);

INSERT INTO posicion(cod_posicion, descripcion) VALUES
(1, 'arquero'),
(2, 'defensa'),
(3, 'volante'),
(4, 'delantero');


INSERT INTO jugador(cod_integrante, cant_goles, fecha_debut, cod_posicion, cod_equipo) 
VALUES  (1, 1, '20100410', 4 , 1),
		(2, 0, '20100411', 1 , 1),
		(3, 2, '20100412', 2 , 1),
		(4, 0, '20100413', 3 , 1),
        (5, 1, '20100414', 2 , 1),
        (6, 3, '20100415', 4 , 1),
        (7, 0, '20100416', 2 , 2),
        (8, 1, '20100417', 3 , 3),
        (9, 1, '20100418', 3 , 4),
        (10, 0, '20100419', 1 , 5),
        (11, 2, '20100420', 4 , 6);

INSERT INTO ronda(cod_ronda, descripcion) 
VALUES  (1,'Primera Fase'),
		(2,'Octavos'),
		(3,'Cuartos'),
		(4,'Semi Final'),
		(5,'Final');

INSERT INTO provincia(cod_provincia, descripcion) 
VALUES  (1,'Moscú'),
		(2,'Kazán'),
        (3,'Saransk'),
        (4,'Samara'),
        (5,'Ekaterimburgo'),
        (6,'Volgogrado'),
        (7,'Rostov Del Don'),
        (8,'Soshi'),
        (9,'Nizhny Novgorod'),
        (10,'San Petesburgo'),
        (11,'Kaliningrado');


INSERT INTO localidad(cod_localidad, descripcion, cod_provincia) 
VALUES  (1,'localidad 1',1),
		(2,'localidad 2',2),
		(3,'localidad 3',2),
        (4,'localidad 4',3),
        (5,'localidad 5',6),
        (6,'localidad 6',10);

INSERT INTO estadio(cod_estadio, nombre, capacidad, cod_localidad) 
VALUES  (1,'Fysht Olympic Stadium',10000,1),
		(2,'Kazan Arena',20000,6),
		(3,'Otkrytie Arena',85000,1),
		(4,'Mordovia Arena',90000,5);
   
        
INSERT INTO partido(cod_partido, fecha_hora, cod_equipo_local, cod_equipo_visitante, goles_visitante, goles_local, cod_estadio, cod_ronda) 
VALUES  (1,'2018-06-14 12:00:00',1,2,5,4,1,1),
		(2,'2018-06-22 09:00:00',3,4,1,3,3,1),
		(3,'2018-06-19 15:00:00',1,6,1,1,4,1),
		(4,'2018-06-22 11:00:00',5,4,1,5,2,2),
        (5,'2018-07-07 10:00:00',3,4,3,1,3,3),
        (6,'2018-07-12 20:00:00',2,3,4,3,2,4);
        

INSERT INTO tipo_autoridad(cod_tipo_autoridad, descripcion) 
VALUES  (1,'arbitro principal'),
		(2,'juez de linea'),
        (3,'arbitro asistente');


INSERT INTO autoridad(cod_autoridad, nombre, cod_tipo_autoridad) 
VALUES  (1, 'arbitro 1',1),
		(2, 'arbitro 2',2),
		(3, 'arbitro 3',2),
		(4, 'arbitro 4',3),
		(5, 'arbitro 5',3),
		(6, 'arbitro 6',1);

INSERT INTO partido_autoridad(cod_partido, cod_autoridad) 
VALUES  (1,1),
		(1,2),
		(1,3),
		(2,1),
		(2,2),
        (3,6),
        (3,3),
        (3,2),
        (3,1);


