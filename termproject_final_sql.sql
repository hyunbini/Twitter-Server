-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `twitter` ;

-- -----------------------------------------------------
-- Table `twitter`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`region` (
  `region_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `age` INT NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `interest_id` VARCHAR(15) NOT NULL,
  `region_region_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`user_id`, `id`, `pwd`),
  INDEX `fk_user_region1_idx` (`region_region_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_region1`
    FOREIGN KEY (`region_region_id`)
    REFERENCES `twitter`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`post` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `writer_id` VARCHAR(45) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `num_of_likes` INT NULL DEFAULT NULL,
  `written_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`, `writer_id`),
  INDEX `fk_post_user1_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`writer_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `post_post_id` INT NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `writer_id` VARCHAR(45) NOT NULL,
  `num_of_likes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`, `post_post_id`, `writer_id`),
  INDEX `fk_comment_post1_idx` (`post_post_id` ASC) VISIBLE,
  INDEX `id_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_post_id`)
    REFERENCES `twitter`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`writer_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`child_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`child_comment` (
  `child_id` INT NOT NULL AUTO_INCREMENT,
  `comment_comment_id` INT NOT NULL,
  `writer_id` VARCHAR(45) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`child_id`, `writer_id`, `comment_comment_id`),
  INDEX `fk_child_comment_comment1_idx` (`comment_comment_id` ASC) VISIBLE,
  INDEX `id_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_child_comment_comment1`
    FOREIGN KEY (`comment_comment_id`)
    REFERENCES `twitter`.`comment` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`writer_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`follower`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`follower` (
  `follower_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  INDEX `fk_follower_user1_idx` (`user_user_id` ASC) VISIBLE,
  PRIMARY KEY (`follower_id`, `user_user_id`),
  UNIQUE INDEX `user_user_id_UNIQUE` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_follower_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `twitter`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`following` (
  `following_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  INDEX `fk_following_user1_idx` (`user_user_id` ASC) VISIBLE,
  PRIMARY KEY (`following_id`, `user_user_id`),
  CONSTRAINT `fk_following_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `twitter`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`interest` (
  `interest_id` VARCHAR(15) NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`interest_id`),
  INDEX `fk_interest_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_interest_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `twitter`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`login_signup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`login_signup` (
  `id` VARCHAR(20) NOT NULL,
  `pwd` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`, `pwd`),
  INDEX `pwd_idx` (`pwd` ASC) VISIBLE,
  CONSTRAINT `fk_login_signup_user1`
    FOREIGN KEY (`id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pwd`
    FOREIGN KEY (`pwd`)
    REFERENCES `twitter`.`user` (`pwd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `twitter`.`allow_follower`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`allow_follower` (
  `state` TINYINT NOT NULL,
  `user_user_id` INT NULL,
  PRIMARY KEY (`state`, `user_user_id`),
  INDEX `user_id_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `twitter`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;