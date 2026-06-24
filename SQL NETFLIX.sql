CREATE DATABASE NETFLIX;

USE NETFLIX;

CREATE TABLE TIPO (
    tipo_id   INT           NOT NULL,
    type      NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_TIPO PRIMARY KEY (tipo_id)
);
go

CREATE TABLE CLASIFICACION (
    cla_id    INT           NOT NULL,
    rating    NVARCHAR(20)  NOT NULL,
    CONSTRAINT PK_CLASIFICACION PRIMARY KEY (cla_id)
);
Go

CREATE TABLE GENERO (
    gen_id    INT            NOT NULL,
    listed_in NVARCHAR(200)  NOT NULL,
    CONSTRAINT PK_GENERO PRIMARY KEY (gen_id)
);
GO


CREATE TABLE PAIS (
    pais_id INT           NOT NULL,
    country NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_PAIS PRIMARY KEY (pais_id)
);
GO

CREATE TABLE ACTOR (
    actor_id INT           NOT NULL,
    nom_cast NVARCHAR(200) NOT NULL,
    CONSTRAINT PK_ACTOR PRIMARY KEY (actor_id)
);
GO

CREATE TABLE DIRECTOR (
    direc_id INT           NOT NULL,
    director NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_DIRECTOR PRIMARY KEY (direc_id)
);
GO

CREATE TABLE FECHA (
    fe_id      INT          NOT NULL,
    date_added DATE         NOT NULL,
    year       SMALLINT     NOT NULL,
    month      TINYINT      NOT NULL,
    day        TINYINT      NOT NULL,
    nom_month  VARCHAR(20)  NOT NULL,
    nom_day    VARCHAR(20)  NOT NULL,
    CONSTRAINT PK_FECHA PRIMARY KEY (fe_id)
);
GO

CREATE TABLE PELICULA (
    peli_id        INT           NOT NULL,
    show_id        NVARCHAR(20)  NOT NULL,
    title          NVARCHAR(300) NOT NULL,
    duration_value SMALLINT      NOT NULL,
    duration_unit  NVARCHAR(10)  NOT NULL,
    release_year   SMALLINT      NOT NULL,
    tipo_id        INT           NOT NULL,
    cla_id         INT           NOT NULL,
    fe_id          INT           NOT NULL,
    CONSTRAINT PK_PELICULA     PRIMARY KEY (peli_id),
    CONSTRAINT FK_PEL_TIPO     FOREIGN KEY (tipo_id) REFERENCES TIPO (tipo_id),
    CONSTRAINT FK_PEL_CLAS   FOREIGN KEY (cla_id)  REFERENCES CLASIFICACION (cla_id),
    CONSTRAINT FK_PEL_FECHA    FOREIGN KEY (fe_id)   REFERENCES FECHA (fe_id)
);
GO

-- MIS TABLAS PUENTES
CREATE TABLE PEL_PAS (
    pelpas_id INT NOT NULL,
    pais_id   INT NOT NULL,
    peli_id   INT NOT NULL,
    CONSTRAINT PK_PEL_PAS      PRIMARY KEY (pelpas_id),
    CONSTRAINT FK_PELPAS_PAIS  FOREIGN KEY (pais_id)  REFERENCES PAIS (pais_id),
    CONSTRAINT FK_PELPAS_PEL   FOREIGN KEY (peli_id)  REFERENCES PELICULA (peli_id)
);
GO

CREATE TABLE PEL_GEN (
    pelgen_id INT NOT NULL,
    gen_id    INT NOT NULL,
    peli_id   INT NOT NULL,
    CONSTRAINT PK_PEL_GEN      PRIMARY KEY (pelgen_id),
    CONSTRAINT FK_PELGEN_GEN   FOREIGN KEY (gen_id)   REFERENCES GENERO (gen_id),
    CONSTRAINT FK_PELGEN_PEL   FOREIGN KEY (peli_id)  REFERENCES PELICULA (peli_id)
);
GO

CREATE TABLE PEL_ACT (
    pelact_id INT NOT NULL,
    actor_id  INT NOT NULL,
    peli_id   INT NOT NULL,
    CONSTRAINT PK_PEL_ACT      PRIMARY KEY (pelact_id),
    CONSTRAINT FK_PELACT_ACTOR FOREIGN KEY (actor_id) REFERENCES ACTOR (actor_id),
    CONSTRAINT FK_PELACT_PEL   FOREIGN KEY (peli_id)  REFERENCES PELICULA (peli_id)
);
GO

CREATE TABLE PEL_DIR (
    peldir_id INT NOT NULL,
    peli_id   INT NOT NULL,
    direc_id  INT NOT NULL,
    CONSTRAINT PK_PEL_DIR      PRIMARY KEY (peldir_id),
    CONSTRAINT FK_PELDIR_PEL   FOREIGN KEY (peli_id)  REFERENCES PELICULA (peli_id),
    CONSTRAINT FK_PELDIR_DIR   FOREIGN KEY (direc_id) REFERENCES DIRECTOR (direc_id)
);
GO
