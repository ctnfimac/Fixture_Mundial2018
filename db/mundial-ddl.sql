/*
 * @brief: Base de datos 1 - TPO
 * @detalils: archivo que contiene la creacion de la base de datos - tablas e insersión de datos
 * @alumnos: Peralta Christian 
 * @fecha: 15-07-2018
 */
 

DROP DATABASE IF EXISTS mundialDB;

/**************************************************************************************************
 *
 * Creo la base de datos
 *
 **************************************************************************************************/
CREATE DATABASE IF NOT EXISTS mundialDB;

USE mundialDB;
	
/**************************************************************************************************
 *
 * Creacion de las tablas
 *
 **************************************************************************************************/
CREATE TABLE grupo(
	cod_grupo tinyint unsigned auto_increment PRIMARY KEY,
	descripcion varchar(10) NOT NULL
);


CREATE TABLE integrante(
	cod_integrante smallint unsigned auto_increment PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	fecha_nacimiento DATE
);


CREATE TABLE equipo(
	cod_equipo tinyint unsigned auto_increment PRIMARY  KEY,
	nombre varchar(30) NOT NULL,
	cod_grupo tinyint unsigned NOT NULL,
	foreign key(cod_grupo) references grupo(cod_grupo)
);

CREATE TABLE nacionalidad(
	cod_nacionalidad tinyint unsigned auto_increment PRIMARY KEY,
	descripcion varchar(30)	NOT NULL
);

CREATE TABLE dt(
	cod_integrante smallint unsigned,
	anios_experiencia tinyint unsigned default 0,
	cod_nacionalidad tinyint unsigned not null,
	cod_equipo tinyint unsigned NOT NULL,
	PRIMARY KEY(cod_integrante),
	FOREIGN KEY(cod_nacionalidad) REFERENCES nacionalidad(cod_nacionalidad),
	FOREIGN KEY(cod_integrante) REFERENCES integrante(cod_integrante),
	FOREIGN KEY(cod_equipo) REFERENCES equipo(cod_equipo)
);

CREATE TABLE posicion(
	cod_posicion tinyint unsigned auto_increment PRIMARY KEY,
	descripcion varchar(20) default 'sin posicion'
);

CREATE TABLE jugador(
	cod_integrante smallint unsigned,
	cant_goles tinyint unsigned default 0,
	fecha_debut DATETIME,
	cod_posicion tinyint unsigned NOT NULL,
	cod_equipo tinyint unsigned NOT NULL,
	PRIMARY KEY(cod_integrante),
	FOREIGN KEY(cod_integrante) REFERENCES integrante(cod_integrante),
    FOREIGN KEY(cod_posicion) REFERENCES posicion(cod_posicion),
    FOREIGN KEY(cod_equipo) REFERENCES equipo(cod_equipo)
);

CREATE TABLE ronda(
	cod_ronda tinyint unsigned auto_increment PRIMARY KEY,
    descripcion varchar(20) not null
);

CREATE TABLE provincia(
	cod_provincia tinyint unsigned auto_increment PRIMARY KEY,
    descripcion varchar(25) NOT NULL
);

CREATE TABLE localidad(
	cod_localidad tinyint unsigned primary key auto_increment,
    descripcion varchar(30) NOT NULL,
    cod_provincia tinyint unsigned NOT NULL,
    FOREIGN KEY(cod_provincia) REFERENCES provincia(cod_provincia)
);

CREATE TABLE estadio(
	cod_estadio tinyint unsigned auto_increment PRIMARY KEY,
    nombre varchar(30) not null,
    capacidad mediumint,
    cod_localidad tinyint unsigned NOT NULL,
    FOREIGN KEY(cod_localidad) REFERENCES localidad(cod_localidad)
);

CREATE TABLE partido(
	cod_partido tinyint unsigned auto_increment PRIMARY KEY,
    fecha_hora DATETIME,
    cod_equipo_local tinyint unsigned NOT NULL,
    cod_equipo_visitante tinyint unsigned NOT NULL,
    goles_visitante tinyint unsigned default 0,
    goles_local tinyint unsigned default 0,
    cod_estadio tinyint unsigned NOT NULL,
    cod_ronda tinyint unsigned NOT NULL,
    FOREIGN KEY(cod_equipo_local) REFERENCES equipo(cod_equipo),
    FOREIGN KEY(cod_equipo_visitante) REFERENCES equipo(cod_equipo),
    FOREIGN KEY(cod_estadio) REFERENCES estadio(cod_estadio),
    FOREIGN KEY(cod_ronda) REFERENCES ronda(cod_ronda)
);

CREATE TABLE tipo_autoridad(
	cod_tipo_autoridad tinyint unsigned auto_increment PRIMARY KEY,
    descripcion varchar(30) NOT NULL		
);

CREATE TABLE autoridad(
	cod_autoridad tinyint unsigned auto_increment PRIMARY KEY,
    nombre varchar(30) not null,
	cod_tipo_autoridad tinyint unsigned not null,
	FOREIGN KEY(cod_tipo_autoridad) REFERENCES tipo_autoridad(cod_tipo_autoridad)
);

CREATE TABLE partido_autoridad(
	cod_partido tinyint unsigned not null,
    cod_autoridad tinyint unsigned not null,
    PRIMARY KEY (cod_partido, cod_autoridad),
    FOREIGN KEY(cod_partido) REFERENCES partido(cod_partido),
    FOREIGN KEY(cod_autoridad) REFERENCES autoridad(cod_autoridad)
);


