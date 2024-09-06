CREATE TABLE `AblisBuilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
