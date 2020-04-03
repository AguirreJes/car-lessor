-- Create Database carlessor and inserts
-- Thu Apr  2 23:04:15 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema carlessor
-- -----------------------------------------------------
-- Alquiler de autos
DROP SCHEMA IF EXISTS `carlessor` ;

-- -----------------------------------------------------
-- Schema carlessor
--
-- Alquiler de autos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carlessor` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `carlessor` ;

-- -----------------------------------------------------
-- Table `carlessor`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carlessor`.`login` ;

CREATE TABLE IF NOT EXISTS `carlessor`.`login` (
  `idlogin` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(13) NOT NULL,
  `password` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idlogin`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `carlessor`.`autos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carlessor`.`autos` ;

CREATE TABLE IF NOT EXISTS `carlessor`.`autos` (
  `idautos` INT NOT NULL AUTO_INCREMENT,
  `imagen` VARCHAR(60) NULL,
  `modelo` VARCHAR(12) NULL,
  `año` VARCHAR(4) NULL,
  `tarifadia` FLOAT NULL,
  `descripcion` VARCHAR(300) NULL,
  `stock` INT(4) NULL,
  `diaalquilado` INT NULL,
  `cantidadauto` INT NULL,
  PRIMARY KEY (`idautos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carlessor`.`compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carlessor`.`compra` ;

CREATE TABLE IF NOT EXISTS `carlessor`.`compra` (
  `idcompra` INT NOT NULL AUTO_INCREMENT,
  `sexo` CHAR(1) NOT NULL,
  `scobertura` VARCHAR(10) NOT NULL,
  `descuento` FLOAT NULL,
  `total` FLOAT NULL,
  `autos_idautos` INT NOT NULL,
  PRIMARY KEY (`idcompra`, `autos_idautos`),
  INDEX `fk_compra_autos_idx` (`autos_idautos` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data
-- -----------------------------------------------------

truncate table carlessor.login;
truncate table carlessor.autos;

-- -----------------------------------------------------
-- Data `carlessor`.`login`
-- -----------------------------------------------------
INSERT INTO `carlessor`.`login` (`username`,`password`) VALUES ('Administrador','Carros2019.');

-- -----------------------------------------------------
-- Data `carlessor`.`autos`
-- -----------------------------------------------------
INSERT INTO `carlessor`.`autos`(`imagen`,`modelo`,`año`,`tarifadia`,`descripcion`,`stock`, `cantidadauto`,`diaalquilado`) VALUES('C:/Proyectos/CarLessor/images/honda.jpg','BMW','2020',100,'Cuenta con 5 asientos de cuero en negro, cámara de visión trasera multiángulo con directrices, pantalla táctil de audio y bolsas de aire delanteras y laterales tipo cortina.',5,null,null);
INSERT INTO `carlessor`.`autos`(`imagen`,`modelo`,`año`,`tarifadia`,`descripcion`,`stock`,`cantidadauto`,`diaalquilado`)  VALUES('C:/Proyectos/CarLessor/images/bmw.jpg','HONDA','2020',75,'Cuenta con 5 asientos deportivos de cuero en negro con moldura decorativa, cámara de visión trasera multiángulo con directrices, pantalla táctil de audio, bolsas de aire delanteras y laterales tipo cortina y techo de cristal panorámico.',10,null,null);
INSERT INTO `carlessor`.`autos`(`imagen`,`modelo`,`año`,`tarifadia`,`descripcion`,`stock`,`cantidadauto`,`diaalquilado`)  VALUES('C:/Proyectos/CarLessor/images/toyota.jpg','TOYOTA','2018',68.78,'Cuenta con 5 asiento y el sistema Toyota Safety Sense, que reduce el riesgo de colisiones, acompañado de sensores de proximidad y 7 bolsas de aire para proteger a todos los pasajeros de posibles lesiones',3,null,null);
INSERT INTO `carlessor`.`autos`(`imagen`,`modelo`,`año`,`tarifadia`,`descripcion`,`stock`,`cantidadauto`,`diaalquilado`) VALUES('C:/Proyectos/CarLessor/images/mitsubishi.jpg','MITSUBISHI','2017',45.65,'Neumáticos 175/65R14 + ruedas de acero de 14” con tapa central de rueda, material de los 4 asientos (cuero) y  Airbag SRS (pasajero delantero',2,null,null);
INSERT INTO `carlessor`.`autos`(`imagen`,`modelo`,`año`,`tarifadia`,`descripcion`,`stock`,`cantidadauto`,`diaalquilado`)  VALUES('C:/Proyectos/CarLessor/images/lexus.jpg','LEXUS','2019',259.98,'Cuenta con 5 asientos de diseño ergonómico, si tiene un teléfono compatible con Qi, el RX 350 puede cargarlo de forma inalámbrica mediante la bandeja de carga disponible,luces de giro de ángulo amplio, pantalla en parabrisas y más lujos',3,null,null);


show tables;
select * from carlessor.login;
select * from carlessor.autos;