DROP SCHEMA IF EXISTS A2 CASCADE;
CREATE SCHEMA A2;
SET search_path TO A2;

DROP TABLE IF EXISTS country CASCADE;
DROP TABLE IF EXISTS language CASCADE;
DROP TABLE IF EXISTS religion CASCADE;
DROP TABLE IF EXISTS hdi CASCADE;
DROP TABLE IF EXISTS ocean CASCADE;
DROP TABLE IF EXISTS neighbour CASCADE;
DROP TABLE IF EXISTS oceanAccess CASCADE;
DROP TABLE IF EXISTS Query1 CASCADE;
DROP TABLE IF EXISTS Query2 CASCADE;
DROP TABLE IF EXISTS Query3 CASCADE;
DROP TABLE IF EXISTS Query4 CASCADE;
DROP TABLE IF EXISTS Query5 CASCADE;
DROP TABLE IF EXISTS Query6 CASCADE;
DROP TABLE IF EXISTS Query7 CASCADE;
DROP TABLE IF EXISTS Query8 CASCADE;
DROP TABLE IF EXISTS Query9 CASCADE;
DROP TABLE IF EXISTS Query10 CASCADE;


-- The country table contains all the countries in the world and their facts.
-- 'cid' is the id of the country.
-- 'name' is the name of the country.
-- 'height' is the highest elevation point of the country.
-- 'population' is the population of the country.
CREATE TABLE country (
    cid 		INTEGER 	PRIMARY KEY,
    cname 		VARCHAR(20)	NOT NULL,
    height 		INTEGER 	NOT NULL,
    population	INTEGER 	NOT NULL);

INSERT INTO country VALUES(1, 'Prax', 1000, 259000);
INSERT INTO country VALUES(2, 'Lourd', 3333, 200000);
INSERT INTO country VALUES(3, 'Mali', 500, 352500);
INSERT INTO country VALUES(4, 'Maica', 100, 150000);
INSERT INTO country VALUES(5, 'Ogo', 3333, 475000);    
INSERT INTO country VALUES(6, 'Sep', 200, 318001);
INSERT INTO country VALUES(7, 'Heit', 25, 59000);
INSERT INTO country VALUES(8, 'Shof', 55, 61000);
INSERT INTO country VALUES(9, 'Xini', 1001, 400000);
INSERT INTO country VALUES(10, 'Mimim', 5000, 300000);
INSERT INTO country VALUES(11, 'Craig', 9090, 150125); 


-- The language table contains information about the languages and the percentage of the speakers of the language for each country.
-- 'cid' is the id of the country.
-- 'lid' is the id of the language.
-- 'lname' is the name of the language.
-- 'lpercentage' is the percentage of the population in the country who speak the language.
CREATE TABLE language (
    cid 		INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    lid 		INTEGER 	NOT NULL,
    lname 		VARCHAR(20) NOT NULL,
    lpercentage	REAL 		NOT NULL,
	PRIMARY KEY(cid, lid));

INSERT INTO language VALUES(1, 2, 'Popo', 0.55);
INSERT INTO language VALUES(1, 3, 'Kazen', 0.45);
INSERT INTO language VALUES(2, 4, 'Meelo', 0.9);
INSERT INTO language VALUES(2, 1, 'Javanese', 0.1);
INSERT INTO language VALUES(3, 1, 'Javanese', 1);
INSERT INTO language VALUES(4, 5, 'Lolish', 1);
INSERT INTO language VALUES(5, 3, 'Kazen', 0.75);
INSERT INTO language VALUES(5, 2, 'Popo', 0.2);
INSERT INTO language VALUES(5, 1, 'Javanese', 0.05);
INSERT INTO language VALUES(6, 2, 'Popo', 1);
INSERT INTO language VALUES(7, 4, 'Meelo', 0.5);
INSERT INTO language VALUES(7, 3, 'Kazen', 0.5);
INSERT INTO language VALUES(8, 4, 'Meelo', 1);
INSERT INTO language VALUES(9, 1, 'Javanese', 1);
INSERT INTO language VALUES(10, 2, 'Popo', 0.8);
INSERT INTO language VALUES(10, 1, 'Javanese', 0.2);
INSERT INTO language VALUES(11, 2, 'Popo', 1);


-- The religion table contains information about the religions and the percentage of the population in each country that follow the religion.
-- 'cid' is the id of the country.
-- 'rid' is the id of the religion.
-- 'rname' is the name of the religion.
-- 'rpercentage' is the percentage of the population in the country who follows the religion.
CREATE TABLE religion (
    cid 		INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    rid 		INTEGER 	NOT NULL,
    rname 		VARCHAR(20) NOT NULL,
    rpercentage	REAL 		NOT NULL,
	PRIMARY KEY(cid, rid));

INSERT INTO religion VALUES(1, 4, 'Holanity', 0.65);
INSERT INTO religion VALUES(1, 3, 'Cosmology', 0.35);
INSERT INTO religion VALUES(2, 1, 'Leagism', 1);
INSERT INTO religion VALUES(3, 3, 'Cosmology', 0.95);
INSERT INTO religion VALUES(4, 3, 'Cosmology', 0.5);
INSERT INTO religion VALUES(5, 1, 'Leagism', 0.8);
INSERT INTO religion VALUES(5, 2, 'Totemism', 0.155);
INSERT INTO religion VALUES(6, 2, 'Totemism', 0.255);
INSERT INTO relIgion VALUES(6, 3, 'Cosmology', 0.225);
INSERT INTO religion VALUES(6, 4, 'Holanity', 0.1795);
INSERT INTO religion VALUES(7, 4, 'Holanity', 0.3);
INSERT INTO religion VALUES(9, 3, 'Cosmology', 0.99999);
INSERT INTO religion VALUES(10, 1, 'Leagism', 0.055);
INSERT INTO religion VALUES(11, 1, 'Leagism', 0.6695);
INSERT INTO religion VALUES(11, 2, 'Totemism', 0.1531);


-- The hdi table contains the human development index of each country per year. (http://en.wikipedia.org/wiki/Human_Development_Index)
-- 'cid' is the id of the country.
-- 'year' is the year when the hdi score has been estimated.
-- 'hdi_score' is the Human Development Index score of the country that year. It takes values [0, 1] with a larger number representing a higher HDI.

CREATE TABLE hdi (
    cid 		INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    year 		INTEGER 	NOT NULL,
    hdi_score 	REAL 		NOT NULL,
	PRIMARY KEY(cid, year));

INSERT INTO hdi VALUES(1, 2009, 0.25);
INSERT INTO hdi VALUES(1, 2010, 0.24);
INSERT INTO hdi VALUES(1, 2011, 0.19);
INSERT INTO hdi VALUES(1, 2012, 0.23);
INSERT INTO hdi VALUES(1, 2013, 0.24);
INSERT INTO hdi VALUES(2, 2009, 0.66);
INSERT INTO hdi VALUES(2, 2010, 0.7);
INSERT INTO hdi VALUES(2, 2011, 0.71);
INSERT INTO hdi VALUES(2, 2012, 0.69);
INSERT INTO hdi VALUES(2, 2013, 0.84);
INSERT INTO hdi VALUES(3, 2009, 0.5);
INSERT INTO hdi VALUES(3, 2010, 0.5);
INSERT INTO hdi VALUES(3, 2011, 0.5);
INSERT INTO hdi VALUES(3, 2012, 0.5);
INSERT INTO hdi VALUES(3, 2013, 0.5);
INSERT INTO hdi VALUES(3, 2014, 0.9999999);
INSERT INTO hdi VALUES(4, 2009, 0.9);
INSERT INTO hdi VALUES(4, 2010, 0.88);
INSERT INTO hdi VALUES(4, 2011, 0.99);
INSERT INTO hdi VALUES(4, 2012, 1);
INSERT INTO hdi VALUES(4, 2013, 0.95);
INSERT INTO hdi VALUES(5, 2009, 0.33);
INSERT INTO hdi VALUES(5, 2010, 0.3);
INSERT INTO hdi VALUES(5, 2011, 0.34);
INSERT INTO hdi VALUES(5, 2012, 0.37);
INSERT INTO hdi VALUES(5, 2013, 0.36);
INSERT INTO hdi VALUES(6, 2009, 0.445);
INSERT INTO hdi VALUES(6, 2010, 0.446);
INSERT INTO hdi VALUES(6, 2011, 0.441);
INSERT INTO hdi VALUES(6, 2012, 0.444);
INSERT INTO hdi VALUES(6, 2013, 0.4454);
INSERT INTO hdi VALUES(7, 2009, 0.5);
INSERT INTO hdi VALUES(7, 2010, 0.5);
INSERT INTO hdi VALUES(7, 2011, 0.5);
INSERT INTO hdi VALUES(7, 2012, 0.5);
INSERT INTO hdi VALUES(7, 2013, 0.5);
INSERT INTO hdi VALUES(8, 2009, 0.5001);
INSERT INTO hdi VALUES(8, 2010, 0.5000001);
INSERT INTO hdi VALUES(8, 2011, 0.50001);
INSERT INTO hdi VALUES(8, 2012, 0.500012);
INSERT INTO hdi VALUES(8, 2013, 0.50000001);
INSERT INTO hdi VALUES(9, 2009, 0.75);
INSERT INTO hdi VALUES(9, 2010, 0.77);
INSERT INTO hdi VALUES(9, 2011, 0.79);
INSERT INTO hdi VALUES(9, 2012, 0.81);
INSERT INTO hdi VALUES(9, 2013, 0.83);
INSERT INTO hdi VALUES(10, 2009, 0.844);
INSERT INTO hdi VALUES(10, 2010, 0.2856);
INSERT INTO hdi VALUES(10, 2011, 0.6446);
INSERT INTO hdi VALUES(10, 2012, 0.345076);
INSERT INTO hdi VALUES(10, 2013, 0.8577);
INSERT INTO hdi VALUES(11, 2009, 0.85);
INSERT INTO hdi VALUES(11, 2010, 0.84);
INSERT INTO hdi VALUES(11, 2011, 0.66);
INSERT INTO hdi VALUES(11, 2012, 0.65);
INSERT INTO hdi VALUES(11, 2013, 0.89);


-- The ocean table contains information about oceans on the earth.
-- 'oid' is the id of the ocean.
-- 'oname' is the name of the ocean.
-- 'depth' is the depth of the deepest part of the ocean (expressed as a positive integer)
CREATE TABLE ocean (
    oid 		INTEGER 	PRIMARY KEY,
    oname 		VARCHAR(20) NOT NULL,
    depth 		INTEGER 	NOT NULL);

INSERT INTO ocean VALUES(1, 'Wet', 6000);
INSERT INTO ocean VALUES(2, 'Moist', 5000);

-- The neighbour table provides information about the countries and their neighbours.
-- 'country' refers to the cid of the first country.
-- 'neighbor' refers to the cid of a country that is neighbouring the first country.
-- 'length' is the length of the border between the two neighbouring countries.
-- Note that if A and B are neighbours, then there two tuples are stored in the table to represent that information (A, B) and (B, A). 
CREATE TABLE neighbour (
    country 	INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    neighbor 	INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT, 
    length 		INTEGER 	NOT NULL,
	PRIMARY KEY(country, neighbor));

INSERT INTO neighbour VALUES(1, 2, 999 );
INSERT INTO neighbour VALUES(1, 3, 777 );
INSERT INTO neighbour VALUES(2, 1, 999 );
INSERT INTO neighbour VALUES(3, 1, 777 );
INSERT INTO neighbour VALUES(1, 5, 550 );
INSERT INTO neighbour VALUES(5, 1, 550 );
INSERT INTO neighbour VALUES(5, 6, 111 );
INSERT INTO neighbour VALUES(6, 5, 111 );
INSERT INTO neighbour VALUES(7, 8, 500 );
INSERT INTO neighbour VALUES(8, 7, 500 );
INSERT INTO neighbour VALUES(3, 9, 343 );
INSERT INTO neighbour VALUES(9, 3, 343 );
INSERT INTO neighbour VALUES(2, 5, 222 );
INSERT INTO neighbour VALUES(5, 2, 222 );
INSERT INTO neighbour VALUES(5, 10, 369 );
INSERT INTO neighbour VALUES(10, 5, 369 );
INSERT INTO neighbour VALUES(2, 10, 444 );
INSERT INTO neighbour VALUES(10, 2, 444 );
INSERT INTO neighbour VALUES(5, 11, 560 );
INSERT INTO neighbour VALUES(11, 5, 560 );
INSERT INTO neighbour VALUES(10, 11, 100 );
INSERT INTO neighbour VALUES(11, 10, 100 ); 

-- The oceanAccess table provides information about the countries which have a border with an ocean.
-- 'cid' refers to the cid of the country.
-- 'oid' refers to the oid of the ocean.
CREATE TABLE oceanAccess (
    cid 	INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    oid 	INTEGER 	REFERENCES ocean(oid) ON DELETE RESTRICT, 
    PRIMARY KEY(cid, oid));

INSERT INTO oceanAccess VALUES(4, 1);
INSERT INTO oceanAccess VALUES(4, 2);
INSERT INTO oceanAccess VALUES(6, 2);
INSERT INTO oceanAccess VALUES(7, 1);
INSERT INTO oceanAccess VALUES(8, 2);
INSERT INTO oceanAccess VALUES(10, 1);
INSERT INTO oceanAccess VALUES(11, 1);

-- The following tables will be used to store the results of your queries. 
-- Each of them should be populated by your last SQL statement that looks like:
-- "INSERT INTO QueryX (SELECT ...<complete your SQL query here> ... )"

CREATE TABLE Query1(
	c1id	INTEGER,
    c1name	VARCHAR(20),
	c2id	INTEGER,
    c2name	VARCHAR(20)
);

CREATE TABLE Query2(
	cid		INTEGER,
    cname	VARCHAR(20)
);

CREATE TABLE Query3(
	c1id	INTEGER,
    c1name	VARCHAR(20),
	c2id	INTEGER,
    c2name	VARCHAR(20)
);

CREATE TABLE Query4(
	cname	VARCHAR(20),
    oname	VARCHAR(20)
);

CREATE TABLE Query5(
	cid		INTEGER,
    cname	VARCHAR(20),
	avghdi	REAL
);

CREATE TABLE Query6(
	cid		INTEGER,
    cname	VARCHAR(20)
);

CREATE TABLE Query7(
	rid			INTEGER,
    rname		VARCHAR(20),
	followers	INTEGER
);

CREATE TABLE Query8(
	c1name	VARCHAR(20),
    c2name	VARCHAR(20),
	lname	VARCHAR(20)
);

CREATE TABLE Query9(
    cname		VARCHAR(20),
	totalspan	INTEGER
);

CREATE TABLE Query10(
    cname			VARCHAR(20),
	borderslength	INTEGER
);
