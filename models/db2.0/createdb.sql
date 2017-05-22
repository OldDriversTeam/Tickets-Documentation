-- MySQL Script generated by MySQL Workbench
-- Mon May 22 11:49:40 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ticketsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ticketsdb` ;

-- -----------------------------------------------------
-- Schema ticketsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ticketsdb` DEFAULT CHARACTER SET utf8 ;
USE `ticketsdb` ;

-- -----------------------------------------------------
-- Table `ticketsdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`user` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`user` (
  `user_id` VARCHAR(100) NOT NULL,
  `user_name` VARCHAR(100) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `user_phone` VARCHAR(100) NOT NULL,
  `user_gender` VARCHAR(10) NULL,
  `user_age` INT NULL,
  `user_email` VARCHAR(30) NULL,
  `user_avatar` VARCHAR(9999) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_phone_UNIQUE` (`user_phone` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`order` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`order` (
  `order_id` INT NOT NULL,
  `order_date` VARCHAR(100) NOT NULL,
  `order_payment_method` VARCHAR(100) NULL,
  `order_ispaid` TINYINT(1) NULL,
  `user_user_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_user_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_order_user`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `ticketsdb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`city` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`city` (
  `city_id` VARCHAR(100) NOT NULL,
  `city_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`cinema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`cinema` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`cinema` (
  `cinema_id` VARCHAR(100) NOT NULL,
  `cinema_name` VARCHAR(100) NOT NULL,
  `cinema_address` VARCHAR(100) NULL,
  `cinema_phone` VARCHAR(100) NULL,
  `city_city_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cinema_id`),
  INDEX `fk_cinema_city1_idx` (`city_city_id` ASC),
  CONSTRAINT `fk_cinema_city1`
    FOREIGN KEY (`city_city_id`)
    REFERENCES `ticketsdb`.`city` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`room` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`room` (
  `room_id` VARCHAR(100) NOT NULL,
  `room_name` VARCHAR(100) NOT NULL,
  `room_type` VARCHAR(100) NULL,
  `room_col` INT NOT NULL,
  `room_row` INT NOT NULL,
  `cinema_cinema_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `fk_room_cinema1_idx` (`cinema_cinema_id` ASC),
  CONSTRAINT `fk_room_cinema1`
    FOREIGN KEY (`cinema_cinema_id`)
    REFERENCES `ticketsdb`.`cinema` (`cinema_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`movieType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`movieType` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`movieType` (
  `movieType_id` VARCHAR(100) NOT NULL,
  `movieType_detail` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`movieType_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`movie` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`movie` (
  `movie_id` VARCHAR(100) NOT NULL,
  `movie_name` VARCHAR(100) NOT NULL,
  `movie_release_date` VARCHAR(100) NULL,
  `movie_storyline` VARCHAR(1000) NULL,
  `movie_cast` VARCHAR(1000) NULL,
  `movie_detail` VARCHAR(999) NULL,
  `movie_poster` VARCHAR(9999) NULL,
  `movie_avgScore` FLOAT NULL,
  `movie_isshow` TINYINT(1) NULL,
  `movieType_movieType_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `fk_movie_movieType1_idx` (`movieType_movieType_id` ASC),
  CONSTRAINT `fk_movie_movieType1`
    FOREIGN KEY (`movieType_movieType_id`)
    REFERENCES `ticketsdb`.`movieType` (`movieType_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`show` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`show` (
  `show_id` VARCHAR(100) NOT NULL,
  `show_date` VARCHAR(100) NOT NULL,
  `room_room_id` VARCHAR(100) NOT NULL,
  `movie_movie_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`show_id`),
  INDEX `fk_show_room1_idx` (`room_room_id` ASC),
  INDEX `fk_show_movie1_idx` (`movie_movie_id` ASC),
  CONSTRAINT `fk_show_room1`
    FOREIGN KEY (`room_room_id`)
    REFERENCES `ticketsdb`.`room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_movie1`
    FOREIGN KEY (`movie_movie_id`)
    REFERENCES `ticketsdb`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`ticket` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`ticket` (
  `ticket_id` VARCHAR(100) NOT NULL,
  `ticket_seat` INT NOT NULL,
  `ticket_price` FLOAT NOT NULL,
  `ticket_issold` TINYINT(1) NOT NULL,
  `show_show_id` VARCHAR(100) NOT NULL,
  `order_order_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_ticket_show1_idx` (`show_show_id` ASC),
  INDEX `fk_ticket_order1_idx` (`order_order_id` ASC),
  CONSTRAINT `fk_ticket_show1`
    FOREIGN KEY (`show_show_id`)
    REFERENCES `ticketsdb`.`show` (`show_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `ticketsdb`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`cinema_show_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`cinema_show_movie` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`cinema_show_movie` (
  `cinema_cinema_id` VARCHAR(100) NOT NULL,
  `movie_movie_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cinema_cinema_id`, `movie_movie_id`),
  INDEX `fk_cinema_has_movie_movie1_idx` (`movie_movie_id` ASC),
  INDEX `fk_cinema_has_movie_cinema1_idx` (`cinema_cinema_id` ASC),
  CONSTRAINT `fk_cinema_has_movie_cinema1`
    FOREIGN KEY (`cinema_cinema_id`)
    REFERENCES `ticketsdb`.`cinema` (`cinema_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cinema_has_movie_movie1`
    FOREIGN KEY (`movie_movie_id`)
    REFERENCES `ticketsdb`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`review` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`review` (
  `review_id` VARCHAR(100) NOT NULL,
  `review_content` VARCHAR(9999) NULL,
  `review_score` FLOAT NULL,
  `review_title` VARCHAR(100) NULL,
  `review_date` VARCHAR(100) NULL,
  `user_user_id` VARCHAR(100) NOT NULL,
  `movie_movie_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_review_user1_idx` (`user_user_id` ASC),
  INDEX `fk_review_movie1_idx` (`movie_movie_id` ASC),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `ticketsdb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_movie1`
    FOREIGN KEY (`movie_movie_id`)
    REFERENCES `ticketsdb`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticketsdb`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticketsdb`.`comment` ;

CREATE TABLE IF NOT EXISTS `ticketsdb`.`comment` (
  `comment_id` VARCHAR(100) NOT NULL,
  `comment_title` VARCHAR(100) NULL,
  `comment_content` VARCHAR(1000) NULL,
  `comment_date` VARCHAR(100) NULL,
  `cinema_cinema_id` VARCHAR(100) NOT NULL,
  `user_user_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_comment_cinema1_idx` (`cinema_cinema_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_comment_cinema1`
    FOREIGN KEY (`cinema_cinema_id`)
    REFERENCES `ticketsdb`.`cinema` (`cinema_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `ticketsdb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
