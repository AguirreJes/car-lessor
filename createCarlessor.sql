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
  `modelo` VARCHAR(12) NULL,
  `año` VARCHAR(4) NULL,
  `tarifadia` FLOAT NULL,
  `stock` INT(4) NULL,
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
  `diaalquilado` INT NOT NULL,
  `cantidadauto` VARCHAR(45) NULL,
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
INSERT INTO `carlessor`.`autos`(`modelo`,`año`,`tarifadia`,`stock`) VALUES('BMW','2020',100,5);
INSERT INTO `carlessor`.`autos`(`modelo`,`año`,`tarifadia`,`stock`) VALUES('HONDA','2020',75,10);
INSERT INTO `carlessor`.`autos`(`modelo`,`año`,`tarifadia`,`stock`) VALUES('TOYOTA','2018',68.78,3);
INSERT INTO `carlessor`.`autos`(`modelo`,`año`,`tarifadia`,`stock`) VALUES('MITSUBISHI','2017',45.65,2);
INSERT INTO `carlessor`.`autos`(`modelo`,`año`,`tarifadia`,`stock`) VALUES('LEXUS','2019',259.98,3);

show tables;
select * from carlessor.login;
select * from carlessor.autos;