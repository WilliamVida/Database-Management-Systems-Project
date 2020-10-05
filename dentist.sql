Drop database if exists Dentist;
Show databases;
create database Dentist CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;
Use Dentist;
Show tables;

-- -----------------------------------------------------
-- Patient Table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Patient (
	patientId Int(5) unsigned zerofill auto_increment,
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	dob DATE NOT NULL,
	townOrCity VARCHAR(30) NOT NULL,
	county VARCHAR(30) NOT NULL,
	phoneNumber INT(15) NOT NULL,
	email VARCHAR(30) NOT NULL,
	picture LONGBLOB DEFAULT NULL,
	picture_path varchar(20) DEFAULT NULL,
	PRIMARY KEY (patientId)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Appointment Table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Appointment (
	appointmentId INT(5) NOT NULL AUTO_INCREMENT,
	appointmentDate DATE NOT NULL,
	appointmentTime TIME NOT NULL,
	patientId INT(5) unsigned not NULL,
	PRIMARY KEY (appointmentId),
	FOREIGN KEY (patientId) REFERENCES Patient (patientId)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Payment Table	
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Payment (
	paymentId INT(5) NOT NULL AUTO_INCREMENT,
	method ENUM('Online', 'Cheque', 'Credit Card', 'Cash') NOT NULL,
	fee FLOAT(6,2) NOT NULL,
	paymentCode varbinary(20),
	hasPaid BOOLEAN NOT NULL,
	patientId INT(5) unsigned not NULL,
	PRIMARY KEY (paymentId),
	FOREIGN KEY (patientId) REFERENCES Patient (patientId)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Bill Table
-- -----------------------------------------------------
CREATE TABLE Bill (
	billId INT(5) NOT NULL AUTO_INCREMENT,
	fee FLOAT(6,2) NOT NULL,
	patientId INT(5) unsigned not NULL,
	PRIMARY KEY (billId),
	FOREIGN KEY (patientId) REFERENCES Patient (patientId)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Specialist Table
-- -----------------------------------------------------
CREATE TABLE Specialist (
	specialistId Int(5) NOT NULL AUTO_INCREMENT,
	patientId INT(5) unsigned not NULL,
	PRIMARY KEY (specialistId),
	FOREIGN KEY (patientId) REFERENCES Patient (patientId)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Treatment Table
-- -----------------------------------------------------
CREATE TABLE Treatment (
	treatmentId INT(5) NOT NULL AUTO_INCREMENT,
	patientId INT(5) unsigned not NULL,
	PRIMARY KEY (treatmentId),
	FOREIGN KEY (patientId) REFERENCES Patient (patientId)
) ENGINE = InnoDB;

use Dentist;
show tables;
-- select * from patient;
select * from appointment;
select * from payment;
select * from bill;
select * from specialist;
select * from treatment;
