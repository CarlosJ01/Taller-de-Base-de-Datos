-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BD_Facebook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_Facebook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_Facebook` DEFAULT CHARACTER SET utf8 ;
USE `BD_Facebook` ;

-- -----------------------------------------------------
-- Table `BD_Facebook`.`Titulos_Acacdemicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Titulos_Acacdemicos` (
  `ID_TITULO` INT NOT NULL AUTO_INCREMENT,
  `TITULO` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_TITULO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Lugar_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Lugar_Trabajo` (
  `ID_LUGAR-TRABAJO` INT NOT NULL AUTO_INCREMENT,
  `TRABAJO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_LUGAR-TRABAJO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Certificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Certificacion` (
  `ID_CERTIFICACION` INT NOT NULL AUTO_INCREMENT,
  `CERTIFICACION` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_CERTIFICACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Peliculas` (
  `ID-PELICULA` INT NOT NULL AUTO_INCREMENT,
  `PELICULA` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID-PELICULA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Cantante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Cantante` (
  `ID_CANTANTE` INT NOT NULL AUTO_INCREMENT,
  `CANTANTE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_CANTANTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Libro` (
  `ID_LIBRO` INT NOT NULL AUTO_INCREMENT,
  `LIBRO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_LIBRO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Perfil` (
  `ID_PERFIL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `CORREO` VARCHAR(45) NOT NULL,
  `FECH_NACI` DATE NOT NULL,
  PRIMARY KEY (`ID_PERFIL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Estado` (
  `ID_ESTADO` INT NOT NULL AUTO_INCREMENT,
  `ESTADO` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`ID_ESTADO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Ubicacion` (
  `ID_UBICACION` INT NOT NULL AUTO_INCREMENT,
  `UBICACION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_UBICACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Perfil-Titulos_Acacdemicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Perfil-Titulos_Acacdemicos` (
  `ID_PERFIL` INT NOT NULL,
  `ID_TITULO` INT NOT NULL,
  INDEX `fk_Perfil_has_Titulos_Acacdemicos_Titulos_Acacdemicos1_idx` (`ID_TITULO` ASC),
  INDEX `fk_Perfil_has_Titulos_Acacdemicos_Perfil_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Titulos_Acacdemicos_Perfil`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Titulos_Acacdemicos_Titulos_Acacdemicos1`
    FOREIGN KEY (`ID_TITULO`)
    REFERENCES `BD_Facebook`.`Titulos_Acacdemicos` (`ID_TITULO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Perfil-Lugar_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Perfil-Lugar_Trabajo` (
  `ID_PERFIL` INT NOT NULL,
  `ID_LUGAR-TRABAJO` INT NOT NULL,
  `FECHA-FIN` DATE NOT NULL,
  `FECHA-INI` DATE NOT NULL,
  INDEX `fk_Perfil_has_Lugar_Trabajo_Lugar_Trabajo1_idx` (`ID_LUGAR-TRABAJO` ASC),
  INDEX `fk_Perfil_has_Lugar_Trabajo_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Lugar_Trabajo_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Lugar_Trabajo_Lugar_Trabajo1`
    FOREIGN KEY (`ID_LUGAR-TRABAJO`)
    REFERENCES `BD_Facebook`.`Lugar_Trabajo` (`ID_LUGAR-TRABAJO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Perfil-Certificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Perfil-Certificacion` (
  `ID_PERFIL` INT NOT NULL,
  `ID_CERTIFICACION` INT NOT NULL,
  INDEX `fk_Perfil_has_Certificacion_Certificacion1_idx` (`ID_CERTIFICACION` ASC),
  INDEX `fk_Perfil_has_Certificacion_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Certificacion_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Certificacion_Certificacion1`
    FOREIGN KEY (`ID_CERTIFICACION`)
    REFERENCES `BD_Facebook`.`Certificacion` (`ID_CERTIFICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Fav-Peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Fav-Peliculas` (
  `ID_PERFIL` INT NOT NULL,
  `ID-PELICULA` INT NOT NULL,
  INDEX `fk_Perfil_has_Peliculas_Peliculas1_idx` (`ID-PELICULA` ASC),
  INDEX `fk_Perfil_has_Peliculas_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Peliculas_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Peliculas_Peliculas1`
    FOREIGN KEY (`ID-PELICULA`)
    REFERENCES `BD_Facebook`.`Peliculas` (`ID-PELICULA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Fav-Cantante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Fav-Cantante` (
  `ID_PERFIL` INT NOT NULL,
  `ID_CANTANTE` INT NOT NULL,
  INDEX `fk_Perfil_has_Cantante_Cantante1_idx` (`ID_CANTANTE` ASC),
  INDEX `fk_Perfil_has_Cantante_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Cantante_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Cantante_Cantante1`
    FOREIGN KEY (`ID_CANTANTE`)
    REFERENCES `BD_Facebook`.`Cantante` (`ID_CANTANTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Fav-Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Fav-Libro` (
  `ID_PERFIL` INT NOT NULL,
  `ID_LIBRO` INT NOT NULL,
  INDEX `fk_Perfil_has_Libro_Libro1_idx` (`ID_LIBRO` ASC),
  INDEX `fk_Perfil_has_Libro_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Libro_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Libro_Libro1`
    FOREIGN KEY (`ID_LIBRO`)
    REFERENCES `BD_Facebook`.`Libro` (`ID_LIBRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Album` (
  `ID_ALBUM` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `Perfil_ID_PERFIL` INT NOT NULL,
  PRIMARY KEY (`ID_ALBUM`),
  INDEX `fk_Album_Perfil1_idx` (`Perfil_ID_PERFIL` ASC),
  CONSTRAINT `fk_Album_Perfil1`
    FOREIGN KEY (`Perfil_ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Hitorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Hitorial` (
  `ID_HISTORIAL` INT NOT NULL AUTO_INCREMENT,
  `ID_PERFIL` INT NOT NULL,
  `TEXT` TEXT NOT NULL,
  `IMAGEN` LONGBLOB NOT NULL,
  `LIGA` VARCHAR(45) NOT NULL,
  INDEX `fk_Perfil_has_Publicacion_Perfil1_idx` (`ID_PERFIL` ASC),
  PRIMARY KEY (`ID_HISTORIAL`),
  CONSTRAINT `fk_Perfil_has_Publicacion_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Publicacion` (
  `ID_PUBLICACION` INT NOT NULL AUTO_INCREMENT,
  `ID_HISTORIAL` INT NOT NULL,
  `TEXTO` LONGTEXT NOT NULL,
  `DIA-HORA` DATETIME NOT NULL,
  `FOTO` BLOB NOT NULL,
  `ID_UBICACION` INT NOT NULL,
  `ID_ESTADO` INT NOT NULL,
  PRIMARY KEY (`ID_PUBLICACION`),
  INDEX `fk_Publicacion_Hitorial1_idx` (`ID_HISTORIAL` ASC),
  INDEX `fk_Publicacion_Ubicacion1_idx` (`ID_UBICACION` ASC),
  INDEX `fk_Publicacion_Estado1_idx` (`ID_ESTADO` ASC),
  CONSTRAINT `fk_Publicacion_Hitorial1`
    FOREIGN KEY (`ID_HISTORIAL`)
    REFERENCES `BD_Facebook`.`Hitorial` (`ID_HISTORIAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicacion_Ubicacion1`
    FOREIGN KEY (`ID_UBICACION`)
    REFERENCES `BD_Facebook`.`Ubicacion` (`ID_UBICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publicacion_Estado1`
    FOREIGN KEY (`ID_ESTADO`)
    REFERENCES `BD_Facebook`.`Estado` (`ID_ESTADO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Amigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Amigo` (
  `ID_PERFIL` INT NOT NULL,
  `ID_AMIGO` INT NOT NULL,
  INDEX `fk_Perfil_has_Perfil_Perfil2_idx` (`ID_AMIGO` ASC),
  INDEX `fk_Perfil_has_Perfil_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Perfil_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Perfil_Perfil2`
    FOREIGN KEY (`ID_AMIGO`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Etiquetado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Etiquetado` (
  `ID_PERFIL` INT NOT NULL,
  `ID_PUBLICACION` INT NOT NULL,
  INDEX `fk_Perfil_has_Publicacion_Publicacion2_idx` (`ID_PUBLICACION` ASC),
  INDEX `fk_Perfil_has_Publicacion_Perfil2_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Publicacion_Perfil2`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Publicacion_Publicacion2`
    FOREIGN KEY (`ID_PUBLICACION`)
    REFERENCES `BD_Facebook`.`Publicacion` (`ID_PUBLICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Facebook`.`Me_Gusta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Facebook`.`Me_Gusta` (
  `ID_PERFIL` INT NOT NULL,
  `ID_PUBLICACION` INT NOT NULL,
  INDEX `fk_Perfil_has_Publicacion1_Publicacion1_idx` (`ID_PUBLICACION` ASC),
  INDEX `fk_Perfil_has_Publicacion1_Perfil1_idx` (`ID_PERFIL` ASC),
  CONSTRAINT `fk_Perfil_has_Publicacion1_Perfil1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `BD_Facebook`.`Perfil` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Publicacion1_Publicacion1`
    FOREIGN KEY (`ID_PUBLICACION`)
    REFERENCES `BD_Facebook`.`Publicacion` (`ID_PUBLICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
