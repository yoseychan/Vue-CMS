-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table peterinardb.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `image` varchar(60) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table peterinardb.clients: ~4 rows (approximately)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `firstName`, `lastName`, `phone`, `image`, `street`, `city`, `zip`) VALUES
	(1, 'James', 'Bond', '077123123', NULL, 'Frying Pan road 35a', 'Nis', '87343'),
	(2, 'Justin', 'Case', '112998383', NULL, 'Narnia Boulevard 55-4', 'Beograd', '11000'),
	(3, 'Annie', 'Witmaster', '123456789', NULL, 'Hammertime lane 62', 'Novi Sad', '12312'),
	(4, 'Ryan', 'Reynolds', '666666666', NULL, 'Sesame street 123', 'Subotica', '32132');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table peterinardb.pets
CREATE TABLE IF NOT EXISTS `pets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `animal` varchar(12) DEFAULT NULL,
  `breed` varchar(20) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `image` varchar(60) DEFAULT NULL,
  `clients_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`clients_id`),
  KEY `fk_pets_clients_idx` (`clients_id`),
  CONSTRAINT `fk_pets_clients` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table peterinardb.pets: ~6 rows (approximately)
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` (`id`, `name`, `age`, `animal`, `breed`, `gender`, `image`, `clients_id`) VALUES
	(1, 'Nickolas', 1, 'Dog', 'Husky', 'Male', NULL, 4),
	(2, 'Lora', 2, 'Cat', 'Russian Blue', 'Female', NULL, 3),
	(3, 'Mimi', 4, 'Bird', 'Canarian Parrot', 'Female', NULL, 4),
	(4, 'Berry', 14, 'Dog', 'Shiht zu', 'Male', NULL, 3),
	(5, 'Max', 3, 'Cat', 'Scottish fold', 'Male', NULL, 1),
	(6, 'Snickers', 2, 'Bunny', 'Mix', 'Male', NULL, 2),
	(7, 'Donald', 5, 'Bird', 'Duck', 'Male', NULL, 4);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;

-- Dumping structure for table peterinardb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  `permission` varchar(15) DEFAULT NULL,
  `image` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table peterinardb.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `firstName`, `lastName`, `username`, `password`, `role`, `permission`, `image`) VALUES
	(1, 'Al', 'Yankovic', 'admin', 'admin1234', 'Head Doctor', 'admin', NULL),
	(2, 'Dave', 'Puffling', 'puffling.staff', '1234', 'Nurse', 'Staff', NULL),
	(3, 'Macy', 'Williams', 'arya.staff', 'whitewalkerdead', 'Front Desk', 'Staff', NULL),
	(4, 'Holly', 'Molly', 'molly.staff', 'password123', 'Nurse', 'Staff', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table peterinardb.visits
CREATE TABLE IF NOT EXISTS `visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `time` varchar(5) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `pets_id` int(10) unsigned NOT NULL,
  `clients_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `fulldescription` text,
  `file` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`,`pets_id`,`clients_id`,`users_id`),
  KEY `fk_visits_clients1_idx` (`clients_id`),
  KEY `fk_visits_users1_idx` (`users_id`),
  KEY `fk_visits_pets1_idx` (`pets_id`),
  CONSTRAINT `fk_visits_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_visits_pets1` FOREIGN KEY (`pets_id`) REFERENCES `pets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_visits_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table peterinardb.visits: ~7 rows (approximately)
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` (`id`, `description`, `time`, `date`, `pets_id`, `clients_id`, `users_id`, `fulldescription`, `file`) VALUES
	(1, 'Regular checkup', '15:00', '22/07/2019', 1, 4, 1, NULL, NULL),
	(2, 'Medical Surgery', '16:00', '23/07/2019', 3, 4, 1, 'Surgery on left hind leg on a lump.', NULL),
	(3, 'Regular checkup', '12:00', '24/07/2019', 2, 3, 1, NULL, NULL),
	(4, 'Regular checkup', '13:00', '24/07/2019', 5, 1, 4, NULL, NULL),
	(5, 'Chipping', '14:00', '25/07/2019', 4, 3, 1, NULL, NULL),
	(6, 'Regular checkup', '14:00', '27/07/2019', 7, 4, 2, NULL, NULL),
	(7, 'Medical Surgery', '11:00', '28/07/2019', 6, 2, 1, NULL, NULL),
	(8, 'Post-surgery Checkup', '14:00', '31/07/2019', 3, 4, 1, 'No complications, heart rate is normal, temperature is normal, recovery going well', NULL);
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
