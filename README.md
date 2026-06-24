# EXAMEN RETO TÉCNICO

La presente prueba tendrá en consideración cualquier valor agregado sobre las respuestas a las preguntas, tales como diseño de la solución, complejidad en el uso del lenguaje de programación o tecnología seleccionada. El objetivo es medir su capacidad de solucionar problemas, toma de decisiones y conocimientos técnicos.

---

# 1. OPTIMIZACIÓN DE QUERY – TRANSACT SQL (5 PTS)

Se requiere que optimicen el Query adjunto, incorporando buenas prácticas. Se tomará en cuenta el uso de sintaxis de SQL versión 2019 o superior, al finalizar la optimización deberá sustentar el porqué optimizó el procedimiento de dicha forma.

**Archivo adjunto:**

- `QUERY ORIGINAL.sql` ( )

---

# 2. TRATAMIENTO DE DATOS Y APLICACIONES (10 PTS)

Usted se encuentra en un startup, cuyo servicio digital desea crear es una plataforma de streaming similar a Netflix o Disney+. Para ello, se necesita hacer un análisis de datos sobre la información libre que se encuentra en dichas plataformas para usarla como base técnica en la creación de su servicio.

Para fines de la prueba, utilizará el siguiente dataset libre:

- **Netflix Movies and TV Shows**

El motor de base de datos será:

- **SQL Server 2019 o superior**

---

## LIMPIEZA Y NORMALIZACIÓN DE DATOS (3 pts)

- Obtener datos libres de Netflix.
- Realizar la limpieza de datos para poder obtener mejores indicadores.
- Transformar y separar los datos para que tengan sentido con un Diagrama Físico e insertar la información de cada una de las tablas según corresponda con Python o SQL.

RESULTADO:

[📄 ETL PYTHON](/ETL.ipynb)

---

## BASE DE DATOS (3 pts)

- Diseñar y ejecutar un diagrama físico de datos, pensando en que pueda ser fácilmente alterado, sea escalable y use formas normales.
- El resultado no puede ser solo 1 tabla, deberán ser de 3 a más tablas.
- Crear una Query que cargue la base de datos y las tablas respectivas, según su diagrama físico (SQL Server).

<img width="1121" height="783" alt="image" src="https://github.com/user-attachments/assets/a7a723ca-cd26-4bc0-a9e5-82474adaf8df" />

SQL
```
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
```
<img width="1150" height="748" alt="image" src="https://github.com/user-attachments/assets/7b9ae272-59f3-4475-b117-a5fab160fd38" />




---



# 3. POWER BI (4 pts)

- Cargue un reporte base en Power BI Desktop o Power BI Service.
- Compártalo para que cualquier persona pueda verlo.


<img width="992" height="720" alt="image" src="https://github.com/user-attachments/assets/779cae26-2690-476d-b1c7-92804377aafe" />

---

# 4. CASO DE NEGOCIO (3 PTS)

Teniendo en cuenta el giro de negocio de cualquier institución financiera y en base a su experiencia personal y profesional, de las 11 áreas clave para la gestión de datos del **DAMA-DMBOK**, ¿por cuál de estos principios recomendaría usted iniciar un proceso de incorporación de gobierno de datos?

Teniendo como supuesto que la institución a evaluar tiene actualmente un nivel 0 de gobernanza, justifique y explique su recomendación.
```
considero que primero se necesita ordenar la forma en que se manejan los datos. Luego la institución debe definir quien es responsable de la información, como se debe usar e implementar reglas. Esto ayydaria tomar mejores desiciones ya que los datos son muy importantes en estas instituciones.
```
---

# 5. TEÓRICO (2 PTS)

Con sus propias palabras, brinde una definición de los siguientes términos:

- DAMA-DMBOK
```
Es una guía que ayuda a manejar mejor los datos y establecer buenas prácticas para su uso.
```
- Power BI
```
Es un software que permite crear reportes y gráficos para analizar información y tomar decisiones.
```
- SSRS
```
Es una herramienta para crear reportes con información obtenida de una bases de datos.
```
- Gobierno de datos
```
Es la forma de organizar y controlar el manejo de los datos dentro de una empresa.
```
- Python
```
Es un lenguaje de programacion que sirve para transformar datos, crear programas y optimizar tareas.
```
- Transact SQL
```
Es un lenguaje utilizado para consultar y administrar información en bases de datos de SQL Server.
```
- MVVM
```
es una manera de organizar el desarrollo de aplicaciones de la parte visual y la lógica.
```
- Depuración de código
```
Es revisar codigo erroneas y corregirlos para que funcione correctamente.
```


# 6. INDICACIONES

- Cree una carpeta con el primer nombre y primer apellido separado por `_`.

Ejemplo:

```
nombre_apellido
```

- Incluya todo el desarrollo en la carpeta, por cada una de las preguntas.

- Al finalizar, remitir sus soluciones mediante correo electrónico a su examinador o publicarlo en un repositorio público y adjuntar la URL para poder ser consumido.

---

# 7. RECOMENDACIONES

Procure realizar los análisis que sean convenientes y documentarlos.

Cada comentario o diccionario sobre su solución será valorado.
