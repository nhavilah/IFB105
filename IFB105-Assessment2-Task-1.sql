CREATE DATABASE IF NOT EXISTS `supplier`;
USE `supplier`;

CREATE TABLE Supplier(
	supplierNr INT NOT NULL,
    supplierName VARCHAR(60) NOT NULL,
    countryLocation VARCHAR(200) NOT NULL,
    faxNr INT(10) DEFAULT NULL,
    PRIMARY KEY (supplierNr),
    UNIQUE(countryLocation,faxNr)
    );

CREATE TABLE Item(
	itemNr INT NOT NULL,
    itemName VARCHAR(60),
    countryMade VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY(itemNr)
    );
    
CREATE TABLE Supply(
	supplierNr INT NOT NULL,
    itemNr INT NOT NULL,
    quantity INT,
    UNIQUE(supplierNr,itemNr),
    FOREIGN KEY(itemNr)
    REFERENCES Item(itemNr)
    );

CREATE TABLE UsedBy(
	itemNr INT NOT NULL,
    deptCode VARCHAR(10) NOT NULL,
    FOREIGN KEY(itemNr)
    REFERENCES Item(itemNr)
    );