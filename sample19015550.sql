-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SAMPLE19015550
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SAMPLE19015550
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SAMPLE19015550` DEFAULT CHARACTER SET utf8 ;
USE `SAMPLE19015550` ;

-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`PUBLISHER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`PUBLISHER` (
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`BOOK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`BOOK` (
  `BookId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `PublisherName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BookId`),
  UNIQUE INDEX `BookId_UNIQUE` (`BookId` ASC) VISIBLE,
  INDEX `PublisherName_idx` (`PublisherName` ASC) VISIBLE,
  CONSTRAINT `PublisherName`
    FOREIGN KEY (`PublisherName`)
    REFERENCES `SAMPLE19015550`.`PUBLISHER` (`Name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`BOOK_AUTHORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`BOOK_AUTHORS` (
  `BookId` INT UNSIGNED NOT NULL,
  `AuthorName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BookId`, `AuthorName`),
  CONSTRAINT `BookId`
    FOREIGN KEY (`BookId`)
    REFERENCES `SAMPLE19015550`.`BOOK` (`BookId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`LIBRARY_BRANCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`LIBRARY_BRANCH` (
  `BranchId` INT UNSIGNED NOT NULL,
  `BranchName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BranchId`),
  UNIQUE INDEX `BranchId_UNIQUE` (`BranchId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`BOOK_COPIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`BOOK_COPIES` (
  `BookId` INT UNSIGNED NOT NULL,
  `BranchId` INT UNSIGNED NOT NULL,
  `No_Of_Copies` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`BookId`, `BranchId`),
  INDEX `BranchId_idx` (`BranchId` ASC) VISIBLE,
  CONSTRAINT `BOOK_COPIES_BookId`
    FOREIGN KEY (`BookId`)
    REFERENCES `SAMPLE19015550`.`BOOK` (`BookId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `BOOK_COPIES_BranchId`
    FOREIGN KEY (`BranchId`)
    REFERENCES `SAMPLE19015550`.`LIBRARY_BRANCH` (`BranchId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`BORROWER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`BORROWER` (
  `CardNo` INT UNSIGNED NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CardNo`),
  UNIQUE INDEX `CardNo_UNIQUE` (`CardNo` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SAMPLE19015550`.`BOOK_LOANS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SAMPLE19015550`.`BOOK_LOANS` (
  `BookId` INT UNSIGNED NOT NULL,
  `BranchId` INT UNSIGNED NOT NULL,
  `CardNo` INT UNSIGNED NOT NULL,
  `DateOut` DATE NOT NULL,
  `DueDate` DATE NOT NULL,
  PRIMARY KEY (`BookId`, `BranchId`, `CardNo`),
  INDEX `CardNo_idx` (`CardNo` ASC) VISIBLE,
  INDEX `BranchId_idx` (`BranchId` ASC) VISIBLE,
  CONSTRAINT `BOOK_LOANS_BookId`
    FOREIGN KEY (`BookId`)
    REFERENCES `SAMPLE19015550`.`BOOK` (`BookId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CardNo`
    FOREIGN KEY (`CardNo`)
    REFERENCES `SAMPLE19015550`.`BORROWER` (`CardNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `BOOK_LOANS_BranchId`
    FOREIGN KEY (`BranchId`)
    REFERENCES `SAMPLE19015550`.`LIBRARY_BRANCH` (`BranchId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;