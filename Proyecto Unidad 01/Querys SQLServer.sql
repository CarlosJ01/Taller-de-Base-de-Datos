USE BD_Facebook;

-- -----------------------------------------------------
-- Table Titulos_Acacdemicos
-- -----------------------------------------------------
CREATE TABLE Titulos_Acacdemicos(
	ID_TITULO INT NOT NULL IDENTITY(1,1),
	TITULO VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID_TITULO));

-- -----------------------------------------------------
-- Table Lugar_Trabajo
-- ----------------------------------------------------
CREATE TABLE Lugar_Trabajo(
	ID_LUGAR_TRABAJO INT NOT NULL IDENTITY(1,1),
	TRABAJO VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID_LUGAR_TRABAJO));

-- -----------------------------------------------------
-- Table Certificacion
-- -----------------------------------------------------
CREATE TABLE Certificacion(
	ID_CERTIFICACION INT NOT NULL IDENTITY(1,1),
	CERTIFICACION VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID_CERTIFICACION));

-- -----------------------------------------------------
-- Table Peliculas
-- -----------------------------------------------------
CREATE TABLE Peliculas(
	ID_PELICULA INT NOT NULL IDENTITY(1,1),
	PELICULA VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID_PELICULA));

-- -----------------------------------------------------
-- Table Cantante
-- -----------------------------------------------------
CREATE TABLE Cantante(
	ID_CANTANTE INT NOT NULL IDENTITY(1,1),
	CANTANTE VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID_CANTANTE));

-- -----------------------------------------------------
-- Table Libro
-- -----------------------------------------------------
CREATE TABLE Libro(
	ID_LIBRO INT NOT NULL IDENTITY(1,1),
	LIBRO VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID_LIBRO));

-- -----------------------------------------------------
-- Table Perfil
-- -----------------------------------------------------
CREATE TABLE Perfil(
	ID_PERFIL INT NOT NULL IDENTITY(1,1),
	NOMBRE VARCHAR(45) NOT NULL,
	CORREO VARCHAR(45) NOT NULL,
	FECH_NACI DATE NOT NULL,
	PRIMARY KEY (ID_PERFIL));

-- -----------------------------------------------------
-- Table Estado
-- -----------------------------------------------------
CREATE TABLE Estado(
	ID_ESTADO INT NOT NULL IDENTITY(1,1),
	ESTADO VARCHAR(40) NOT NULL,
	PRIMARY KEY (ID_ESTADO));

-- -----------------------------------------------------
-- Table Ubicacion
-- -----------------------------------------------------
CREATE TABLE Ubicacion(
	ID_UBICACION INT NOT NULL IDENTITY(1,1),
	UBICACION VARCHAR(45) NOT NULL,
	PRIMARY KEY (ID_UBICACION));

-- -----------------------------------------------------
-- Table Perfil-Titulos_Acacdemicos
-- -----------------------------------------------------
CREATE TABLE Perfil_Titulos_Acacdemicos(
  ID_PERFIL INT NOT NULL,
  ID_TITULO INT NOT NULL,
  INDEX fk_Perfil_has_Titulos_Acacdemicos_Titulos_Acacdemicos1_idx (ID_TITULO ASC),
  INDEX fk_Perfil_has_Titulos_Acacdemicos_Perfil_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Titulos_Acacdemicos_Perfil
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Titulos_Acacdemicos_Titulos_Acacdemicos1
    FOREIGN KEY (ID_TITULO)
    REFERENCES Titulos_Acacdemicos (ID_TITULO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Perfil-Lugar_Trabajo
-- -----------------------------------------------------
CREATE TABLE Perfil_Lugar_Trabajo (
  ID_PERFIL INT NOT NULL,
  ID_LUGAR_TRABAJO INT NOT NULL,
  FECHA_FIN DATE NOT NULL,
  FECHA_INI DATE NOT NULL,
  INDEX fk_Perfil_has_Lugar_Trabajo_Lugar_Trabajo1_idx (ID_LUGAR_TRABAJO ASC),
  INDEX fk_Perfil_has_Lugar_Trabajo_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Lugar_Trabajo_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Lugar_Trabajo_Lugar_Trabajo1
    FOREIGN KEY (ID_LUGAR_TRABAJO)
    REFERENCES Lugar_Trabajo (ID_LUGAR_TRABAJO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Perfil-Certificacion
-- -----------------------------------------------------
CREATE TABLE Perfil_Certificacion (
  ID_PERFIL INT NOT NULL,
  ID_CERTIFICACION INT NOT NULL,
  INDEX fk_Perfil_has_Certificacion_Certificacion1_idx (ID_CERTIFICACION ASC),
  INDEX fk_Perfil_has_Certificacion_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Certificacion_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Certificacion_Certificacion1
    FOREIGN KEY (ID_CERTIFICACION)
    REFERENCES Certificacion (ID_CERTIFICACION)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Fav-Peliculas
-- -----------------------------------------------------
CREATE TABLE Fav_Peliculas (
  ID_PERFIL INT NOT NULL,
  ID_PELICULA INT NOT NULL,
  INDEX fk_Perfil_has_Peliculas_Peliculas1_idx (ID_PELICULA ASC),
  INDEX fk_Perfil_has_Peliculas_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Peliculas_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Peliculas_Peliculas1
    FOREIGN KEY (ID_PELICULA)
    REFERENCES Peliculas (ID_PELICULA)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Fav-Cantante
-- -----------------------------------------------------
CREATE TABLE Fav_Cantante (
  ID_PERFIL INT NOT NULL,
  ID_CANTANTE INT NOT NULL,
  INDEX fk_Perfil_has_Cantante_Cantante1_idx (ID_CANTANTE ASC),
  INDEX fk_Perfil_has_Cantante_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Cantante_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Cantante_Cantante1
    FOREIGN KEY (ID_CANTANTE)
    REFERENCES Cantante (ID_CANTANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table Fav-Libro
-- -----------------------------------------------------
CREATE TABLE Fav_Libro (
  ID_PERFIL INT NOT NULL,
  ID_LIBRO INT NOT NULL,
  INDEX fk_Perfil_has_Libro_Libro1_idx (ID_LIBRO ASC),
  INDEX fk_Perfil_has_Libro_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Libro_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Libro_Libro1
    FOREIGN KEY (ID_LIBRO)
    REFERENCES Libro (ID_LIBRO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table Album
-- -----------------------------------------------------
CREATE TABLE Album (
  ID_ALBUM INT NOT NULL IDENTITY,
  NOMBRE VARCHAR(45) NOT NULL,
  Perfil_ID_PERFIL INT NOT NULL,
  PRIMARY KEY (ID_ALBUM),
  INDEX fk_Album_Perfil1_idx (Perfil_ID_PERFIL ASC),
  CONSTRAINT fk_Album_Perfil1
    FOREIGN KEY (Perfil_ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table Hitorial
-- -----------------------------------------------------
CREATE TABLE Hitorial(
	ID_HISTORIAL INT NOT NULL IDENTITY(1,1),
	ID_PERFIL INT NOT NULL,
	TEXT TEXT NOT NULL,
	IMAGEN IMAGE NOT NULL,
	LIGA VARCHAR(45) NOT NULL,
 INDEX fk_Perfil_has_Publicacion_Perfil1_idx (ID_PERFIL ASC),
 PRIMARY KEY (ID_HISTORIAL),
 CONSTRAINT fk_Perfil_has_Publicacion_Perfil1
	FOREIGN KEY (ID_PERFIL)
	REFERENCES Perfil (ID_PERFIL)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table Publicacion
-- -----------------------------------------------------
CREATE TABLE Publicacion(
	ID_PUBLICACION INT NOT NULL IDENTITY(1,1),
	ID_HISTORIAL INT NOT NULL,
	TEXTO TEXT NOT NULL,
	DIA_HORA DATETIME NOT NULL,
	FOTO IMAGE NOT NULL,
	ID_UBICACION INT NOT NULL,
	ID_ESTADO INT NOT NULL,
  PRIMARY KEY (ID_PUBLICACION),
  INDEX fk_Publicacion_Hitorial1_idx (ID_HISTORIAL ASC),
  INDEX fk_Publicacion_Ubicacion1_idx (ID_UBICACION ASC),
  INDEX fk_Publicacion_Estado1_idx (ID_ESTADO ASC),
  CONSTRAINT fk_Publicacion_Hitorial1
    FOREIGN KEY (ID_HISTORIAL)
    REFERENCES Hitorial (ID_HISTORIAL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Publicacion_Ubicacion1
    FOREIGN KEY (ID_UBICACION)
    REFERENCES Ubicacion (ID_UBICACION)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Publicacion_Estado1
    FOREIGN KEY (ID_ESTADO)
    REFERENCES Estado (ID_ESTADO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table Amigo
-- -----------------------------------------------------
CREATE TABLE Amigo (
  ID_PERFIL INT NOT NULL,
  ID_AMIGO INT NOT NULL,
  INDEX fk_Perfil_has_Perfil_Perfil2_idx (ID_AMIGO ASC),
  INDEX fk_Perfil_has_Perfil_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Perfil_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Perfil_Perfil2
    FOREIGN KEY (ID_AMIGO)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Etiquetado
-- -----------------------------------------------------
CREATE TABLE Etiquetado (
  ID_PERFIL INT NOT NULL,
  ID_PUBLICACION INT NOT NULL,
  INDEX fk_Perfil_has_Publicacion_Publicacion2_idx (ID_PUBLICACION ASC),
  INDEX fk_Perfil_has_Publicacion_Perfil2_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Publicacion_Perfil2
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Publicacion_Publicacion2
    FOREIGN KEY (ID_PUBLICACION)
    REFERENCES Publicacion (ID_PUBLICACION)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Me_Gusta
-- -----------------------------------------------------
CREATE TABLE Me_Gusta (
  ID_PERFIL INT NOT NULL,
  ID_PUBLICACION INT NOT NULL,
  INDEX fk_Perfil_has_Publicacion1_Publicacion1_idx (ID_PUBLICACION ASC),
  INDEX fk_Perfil_has_Publicacion1_Perfil1_idx (ID_PERFIL ASC),
  CONSTRAINT fk_Perfil_has_Publicacion1_Perfil1
    FOREIGN KEY (ID_PERFIL)
    REFERENCES Perfil (ID_PERFIL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Perfil_has_Publicacion1_Publicacion1
    FOREIGN KEY (ID_PUBLICACION)
    REFERENCES Publicacion (ID_PUBLICACION)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);