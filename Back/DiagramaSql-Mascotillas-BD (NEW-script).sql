-- MySQL Script generated by MySQL Workbench
-- Sun May  7 20:53:42 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mascotillas-ecomerce-bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mascotillas-ecomerce-bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mascotillas-ecomerce-bd` DEFAULT CHARACTER SET utf8 ;
USE `Mascotillas-ecomerce-bd` ;

-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Mail` VARCHAR(45) NULL,
  `Nro_Celular` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Tipo_de_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Tipo_de_producto` (
  `idTipo_de_producto` INT NOT NULL,
  `Nombre` VARCHAR(120) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idTipo_de_producto`, `Usuario_idUsuario`),
  INDEX `fk_Tipo_de_producto_Usuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Tipo_de_producto_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `NombredeCategoria` VARCHAR(120) NULL,
  `Tipo_de_producto_idTipo_de_producto` INT NOT NULL,
  `Tipo_de_producto_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCategoria`, `Tipo_de_producto_idTipo_de_producto`, `Tipo_de_producto_Usuario_idUsuario`),
  INDEX `fk_Categoria_Tipo_de_producto1_idx` (`Tipo_de_producto_idTipo_de_producto` ASC, `Tipo_de_producto_Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Tipo_de_producto1`
    FOREIGN KEY (`Tipo_de_producto_idTipo_de_producto` , `Tipo_de_producto_Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Tipo_de_producto` (`idTipo_de_producto` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Metodo de Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Metodo de Pago` (
  `idMetodo_Pago` INT NOT NULL,
  `Tipo_pago` VARCHAR(45) NULL,
  `Nrodecuenta` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idMetodo_Pago`, `Usuario_idUsuario`),
  INDEX `fk_Metodo de Pago_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Metodo de Pago_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Factura` (
  `idFactura` INT NOT NULL,
  `Fecha` VARCHAR(45) NULL,
  `TipodeFactura` VARCHAR(45) NULL,
  `Descripcion_prod` VARCHAR(60) NULL,
  `Subtotal` VARCHAR(45) NULL,
  `Total` VARCHAR(45) NULL,
  `Metodo de Pago_idMetodo_Pago` INT NOT NULL,
  `Metodo de Pago_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idFactura`, `Metodo de Pago_idMetodo_Pago`, `Metodo de Pago_Usuario_idUsuario`),
  INDEX `fk_Factura_Metodo de Pago1_idx` (`Metodo de Pago_idMetodo_Pago` ASC, `Metodo de Pago_Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Metodo de Pago1`
    FOREIGN KEY (`Metodo de Pago_idMetodo_Pago` , `Metodo de Pago_Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Metodo de Pago` (`idMetodo_Pago` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Producto` (
  `idProducto` INT NOT NULL,
  `IdCategoria` VARCHAR(45) NULL,
  `Nombre` VARCHAR(60) NULL,
  `Cantidad` INT NULL,
  `Precio` VARCHAR(45) NULL,
  `Categoria_idCategoria` INT NOT NULL,
  `Categoria_Tipo_de_producto_idTipo_de_producto` INT NOT NULL,
  `Categoria_Tipo_de_producto_Usuario_idUsuario` INT NOT NULL,
  `Factura_idFactura` INT NOT NULL,
  `Factura_Metodo de Pago_idMetodo_Pago` INT NOT NULL,
  `Factura_Metodo de Pago_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `Categoria_idCategoria`, `Categoria_Tipo_de_producto_idTipo_de_producto`, `Categoria_Tipo_de_producto_Usuario_idUsuario`, `Factura_idFactura`, `Factura_Metodo de Pago_idMetodo_Pago`, `Factura_Metodo de Pago_Usuario_idUsuario`),
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_idCategoria` ASC, `Categoria_Tipo_de_producto_idTipo_de_producto` ASC, `Categoria_Tipo_de_producto_Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Producto_Factura1_idx` (`Factura_idFactura` ASC, `Factura_Metodo de Pago_idMetodo_Pago` ASC, `Factura_Metodo de Pago_Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria` , `Categoria_Tipo_de_producto_idTipo_de_producto` , `Categoria_Tipo_de_producto_Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Categoria` (`idCategoria` , `Tipo_de_producto_idTipo_de_producto` , `Tipo_de_producto_Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Factura1`
    FOREIGN KEY (`Factura_idFactura` , `Factura_Metodo de Pago_idMetodo_Pago` , `Factura_Metodo de Pago_Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Factura` (`idFactura` , `Metodo de Pago_idMetodo_Pago` , `Metodo de Pago_Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Factura_has_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Factura_has_Usuario` (
  `Factura_idFactura` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`Factura_idFactura`, `Usuario_idUsuario`),
  INDEX `fk_Factura_has_Usuario_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Factura_has_Usuario_Factura1_idx` (`Factura_idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_has_Usuario_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mascotillas-ecomerce-bd`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mascotillas-ecomerce-bd`.`Direccion` (
  `idDireccion` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Pais` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Calle` VARCHAR(45) NULL,
  `Nro` VARCHAR(45) NULL,
  PRIMARY KEY (`Usuario_idUsuario`),
  CONSTRAINT `fk_Direccion_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Mascotillas-ecomerce-bd`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
