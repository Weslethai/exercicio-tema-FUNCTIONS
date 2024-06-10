-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema af
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema af
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `af` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `af` ;

-- -----------------------------------------------------
-- Table `af`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af`.`cursos` (
  `idCurso` INT NOT NULL,
  `nomeCurso` VARCHAR(30) NULL DEFAULT NULL,
  `numeroAlunos` INT NULL DEFAULT NULL,
  `duracaoSemestre` INT NULL DEFAULT NULL,
  `area` VARCHAR(30) NULL DEFAULT NULL,
  `alunos_idAluno` INT NOT NULL,
  `alunos_cursos_idCurso` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `fk_cursos_alunos1_idx` (`alunos_idAluno` ASC, `alunos_cursos_idCurso` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `af`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af`.`alunos` (
  `idAluno` INT NOT NULL,
  `nome` VARCHAR(20) NULL DEFAULT NULL,
  `sobrenome` VARCHAR(20) NULL DEFAULT NULL,
  `curso` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `cursos_idCurso` INT NOT NULL,
  PRIMARY KEY (`idAluno`, `cursos_idCurso`),
  INDEX `fk_alunos_cursos_idx` (`cursos_idCurso` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;