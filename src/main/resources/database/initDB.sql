USE test;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(`id` INT(8) NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(25) NOT NULL ,
 `age` INT NOT NULL,
 `isAdmin` BIT(1),
 `createdDate` TIMESTAMP,
 PRIMARY KEY  (`id`))
 ENGINE =innodb;