-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------
drop database twitter;
CREATE SCHEMA IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `twitter` ;

-- -----------------------------------------------------
-- Table `twitter`.`interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`interest` (
  `interest_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`interest_id`));

-- -----------------------------------------------------
-- Table `twitter`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`region` (
  `region_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`region_id`));


-- -----------------------------------------------------
-- Table `twitter`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`user` (
  `user_num` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(20) NOT NULL,
  `pwd` VARCHAR(30) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `interest_id` VARCHAR(15) NOT NULL,
  `region_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`user_num`, `id`, `interest_id`, `region_id`),
  INDEX `interest_id_idx` (`interest_id` ASC) VISIBLE,
  INDEX `region_id_idx` (`region_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `interest_id`
    FOREIGN KEY (`interest_id`)
    REFERENCES `twitter`.`interest` (`interest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `twitter`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `twitter`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL DEFAULT NULL,
  `writer_id` VARCHAR(20) NOT NULL,
  `post_id` INT NOT NULL,
  `num_of_likes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`, `post_id`, `writer_id`),
  INDEX `id_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `id`
    FOREIGN KEY (`writer_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `twitter`.`child_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`child_comment` (
  `child_id` INT NOT NULL AUTO_INCREMENT,
  `comment_id` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`child_id`, `comment_id`),
  INDEX `comment_id_idx` (`comment_id` ASC) VISIBLE,
  CONSTRAINT `comment_id`
    FOREIGN KEY (`comment_id`)
    REFERENCES `twitter`.`comment` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `twitter`.`follower`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`follower` (
  `user_id` VARCHAR(20) NOT NULL,
  `follower_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`, `follower_id`),
  CONSTRAINT `user_follow_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `twitter`.`following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`following` (
  `user_id` VARCHAR(20) NOT NULL,
  `follower_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`, `follower_id`),
  CONSTRAINT `user_following_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `twitter`.`like_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`like_comment` (
  `user_id` VARCHAR(20) NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`),
  CONSTRAINT `comment_comment_id`
    FOREIGN KEY (`comment_id`)
    REFERENCES `twitter`.`comment` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `twitter`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`post` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL DEFAULT NULL,
  `writer_id` VARCHAR(20) NOT NULL,
  `num_of_likes` INT NULL DEFAULT NULL,
  `retweet_num` INT NULL DEFAULT NULL,
  `retweet_post` INT NULL DEFAULT NULL,
  `written_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`, `writer_id`),
  INDEX `id_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `user_writer_id`
    FOREIGN KEY (`writer_id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `twitter`.`like_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`like_post` (
  `user_id` VARCHAR(20) NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`post_id`),
  CONSTRAINT `post_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `twitter`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `twitter`.`login_signup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`login_signup` (
  `id` VARCHAR(20) NOT NULL,
  `pwd` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_login_id`
    FOREIGN KEY (`id`)
    REFERENCES `twitter`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `twitter`.`recommend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`recommend` (
  `recommend_id` VARCHAR(20) NOT NULL,
  `post_id` INT NOT NULL,
  `written_date` DATETIME NOT NULL,
  PRIMARY KEY (`post_id`),
  CONSTRAINT `post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `twitter`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);