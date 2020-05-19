-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema nba
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Basketball
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Basketball
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Basketball` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Basketball` ;

-- -----------------------------------------------------
-- Table `Basketball`.`teamnames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`teamnames` (
  `Team_Name` TEXT NULL DEFAULT NULL,
  `Team` TEXT NOT NULL,
  PRIMARY KEY (`Team`(255)))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`nba_twitter_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`nba_twitter_accounts` (
  `Abbr` TEXT NULL DEFAULT NULL,
  `Name` TEXT NULL DEFAULT NULL,
  `Account` TEXT NOT NULL,
  PRIMARY KEY (`Account`),
  INDEX `fk_abbr_idx` (`Abbr` ASC) VISIBLE,
  CONSTRAINT `fk_abbr`
    FOREIGN KEY (`Abbr`)
    REFERENCES `Basketball`.`teamnames` (`Team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`NBA_Twitter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`NBA_Twitter` (
  `Tweets` TEXT NULL DEFAULT NULL,
  `team` TEXT NULL DEFAULT NULL,
  `id` BIGINT(20) NOT NULL,
  `account` TEXT NULL DEFAULT NULL,
  `len` INT(11) NULL DEFAULT NULL,
  `date` TEXT NULL DEFAULT NULL,
  `likes` INT(11) NULL DEFAULT NULL,
  `retweets` INT(11) NULL DEFAULT NULL,
  `#hashtag` INT(11) NULL DEFAULT NULL,
  `1` TEXT NULL DEFAULT NULL,
  `2` TEXT NULL DEFAULT NULL,
  `3` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_account_idx` (`account` ASC) VISIBLE,
  CONSTRAINT `fk_account`
    FOREIGN KEY (`account`)
    REFERENCES `Basketball`.`nba_twitter_accounts` (`Account`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`hashtags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`hashtags` (
  `id` BIGINT(20) NULL DEFAULT NULL,
  `1` TEXT NULL DEFAULT NULL,
  `2` TEXT NULL DEFAULT NULL,
  `3` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`nba_salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`nba_salary` (
  `Player` TEXT NOT NULL,
  `Team` TEXT NULL DEFAULT NULL,
  `Salary` DOUBLE NULL DEFAULT NULL,
  `AllStar` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Player`),
  INDEX `fk_team_idx` (`Team` ASC) VISIBLE,
  CONSTRAINT `fk_team`
    FOREIGN KEY (`Team`)
    REFERENCES `Basketball`.`teamnames` (`Team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`nba_tweets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`nba_tweets` (
  `Tweets` TEXT NULL DEFAULT NULL,
  `team` TEXT NULL DEFAULT NULL,
  `id` BIGINT(20) NULL DEFAULT NULL,
  `account` TEXT NULL DEFAULT NULL,
  `len` INT(11) NULL DEFAULT NULL,
  `date` TEXT NULL DEFAULT NULL,
  `likes` INT(11) NULL DEFAULT NULL,
  `retweets` INT(11) NULL DEFAULT NULL,
  `#hashtag` INT(11) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`player_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`player_stats` (
  `Player` TEXT NOT NULL,
  `Team` TEXT NULL DEFAULT NULL,
  `GP` INT(11) NULL DEFAULT NULL,
  `MPG` DOUBLE NULL DEFAULT NULL,
  `FGM` DOUBLE NULL DEFAULT NULL,
  `FGA` DOUBLE NULL DEFAULT NULL,
  `FG%` DOUBLE NULL DEFAULT NULL,
  `3PM` DOUBLE NULL DEFAULT NULL,
  `3PA` DOUBLE NULL DEFAULT NULL,
  `3P%` DOUBLE NULL DEFAULT NULL,
  `FTM` DOUBLE NULL DEFAULT NULL,
  `FTA` DOUBLE NULL DEFAULT NULL,
  `FT%` DOUBLE NULL DEFAULT NULL,
  `TOV` DOUBLE NULL DEFAULT NULL,
  `PF` DOUBLE NULL DEFAULT NULL,
  `ORB` DOUBLE NULL DEFAULT NULL,
  `DRB` DOUBLE NULL DEFAULT NULL,
  `RPG` DOUBLE NULL DEFAULT NULL,
  `APG` DOUBLE NULL DEFAULT NULL,
  `SPG` DOUBLE NULL DEFAULT NULL,
  `BPG` DOUBLE NULL DEFAULT NULL,
  `PPG` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`Player`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`player_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`player_details` (
  `PlayerName` TEXT NOT NULL,
  `Team` TEXT NULL DEFAULT NULL,
  `BirthDate` TEXT NULL DEFAULT NULL,
  `BirthCity` TEXT NULL DEFAULT NULL,
  `College` TEXT NULL DEFAULT NULL,
  `Height` INT(11) NULL DEFAULT NULL,
  `Weight` INT(11) NULL DEFAULT NULL,
  `PhotoUrl` TEXT NULL DEFAULT NULL,
  `Position` TEXT NULL DEFAULT NULL,
  `JerseyNo` INT(11) NULL DEFAULT NULL,
  `ExperienceYear` INT(11) NULL DEFAULT NULL,
  `player_stats_Player` TEXT NOT NULL,
  PRIMARY KEY (`PlayerName`),
  INDEX `fk_team_idx` (`Team` ASC) VISIBLE,
  INDEX `fk_player_details_player_stats1_idx` (`player_stats_Player` ASC) VISIBLE,
  CONSTRAINT `fk_team`
    FOREIGN KEY (`Team`)
    REFERENCES `Basketball`.`teamnames` (`Team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_details_player_stats1`
    FOREIGN KEY (`player_stats_Player`)
    REFERENCES `Basketball`.`player_stats` (`Player`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Basketball`.`teamstats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Basketball`.`teamstats` (
  `Team_Name` TEXT NULL DEFAULT NULL,
  `Team` TEXT NOT NULL,
  `Wins` INT(11) NULL DEFAULT NULL,
  `Losses` INT(11) NULL DEFAULT NULL,
  `Minutes` INT(11) NULL DEFAULT NULL,
  `Points` DOUBLE NULL DEFAULT NULL,
  `FieldGoalsAttempted` DOUBLE NULL DEFAULT NULL,
  `FieldGoalsMade` DOUBLE NULL DEFAULT NULL,
  `FieldGoalsPercentage` DOUBLE NULL DEFAULT NULL,
  `TwoPointersAttempted` DOUBLE NULL DEFAULT NULL,
  `TwoPointersMade` DOUBLE NULL DEFAULT NULL,
  `TwoPointersPercentage` DOUBLE NULL DEFAULT NULL,
  `ThreePointersAttempted` DOUBLE NULL DEFAULT NULL,
  `ThreePointersMade` DOUBLE NULL DEFAULT NULL,
  `ThreePointersPercentage` DOUBLE NULL DEFAULT NULL,
  `FreeThrowsAttempted` DOUBLE NULL DEFAULT NULL,
  `FreeThrowsMade` DOUBLE NULL DEFAULT NULL,
  `FreeThrowsPercentage` DOUBLE NULL DEFAULT NULL,
  `Rebounds` DOUBLE NULL DEFAULT NULL,
  `OffensiveRebounds` DOUBLE NULL DEFAULT NULL,
  `DefensiveRebounds` DOUBLE NULL DEFAULT NULL,
  `Assists` DOUBLE NULL DEFAULT NULL,
  `Blocks` DOUBLE NULL DEFAULT NULL,
  `Steals` DOUBLE NULL DEFAULT NULL,
  `Turnovers` DOUBLE NULL DEFAULT NULL,
  `Fouls` DOUBLE NULL DEFAULT NULL,
  `teamnames_Team` TEXT NOT NULL,
  PRIMARY KEY (`Team`),
  INDEX `fk_teamstats_teamnames1_idx` (`teamnames_Team` ASC) VISIBLE,
  CONSTRAINT `fk_teamstats_teamnames1`
    FOREIGN KEY (`teamnames_Team`)
    REFERENCES `Basketball`.`teamnames` (`Team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
