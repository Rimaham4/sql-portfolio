
CREATE TABLE Laender (
    Land_id INT PRIMARY KEY,
    Land VARCHAR(100)
);

/*
CREATE TABLE Kunden (
    Kunden_id INT PRIMARY KEY,
    Kunden_Name VARCHAR(100),
    Email VARCHAR(150),
    Telefon VARCHAR(50),
	Land_id INT,
	Adresse VARCHAR(220),
	Ort VARCHAR(50),
	Postcode VARCHAR(50),
    loyalty_card BOOLEAN,  -- yes or no
	FOREIGN KEY (Land_id) REFERENCES Laender(Land_id)
);
*/

DROP TABLE Kunden;

CREATE TABLE Kunden (
    Kunden_id VARCHAR(100) PRIMARY KEY,
    Kunden_Name VARCHAR(100),
    Email VARCHAR(150),
    Telefon VARCHAR(50),
	Adresse VARCHAR(220),
	Ort VARCHAR(50),
	Postcode VARCHAR(50),
	Land_id INT,
    loyalty_card VARCHAR(10),  -- true or false
	FOREIGN KEY (Land_id) REFERENCES Laender(Land_id)
);



CREATE TABLE Kaffeesorten (
    Kaffeesorten_id INT PRIMARY KEY,
    Kaffeesorten_name VARCHAR(50)
);


CREATE TABLE Roestarten (
    Roestarten_id INT PRIMARY KEY,
    Roestarten_name VARCHAR(50)
);


CREATE TABLE Groessen (
    Groesse_id INT PRIMARY KEY,
    Groesse NUMERIC
);


CREATE TABLE Produkte (
    produkt_ID VARCHAR(20) PRIMARY KEY,
    Kaffeesorten_id INT,
    roestarten_id INT,
    Groesse_id INT,
    stueckpreis NUMERIC(10,2),
	FOREIGN KEY (Kaffeesorten_id) REFERENCES Kaffeesorten(Kaffeesorten_id),
	FOREIGN KEY (roestarten_id) REFERENCES roestarten(roestarten_id),
	FOREIGN KEY (Groesse_id) REFERENCES Groessen(Groesse_id)
);

DROP TABLE Produkte;

CREATE TABLE temp_produkte (
    produkt_id VARCHAR(20),
    kaffeesorten_id INT,
    roestarten_id INT,
    groesse_id INT,
    stueckpreis NUMERIC
);

DROP TABLE temp_produkte;

COPY temp_produkte
FROM 'C:\Users\User\Downloads\produktneu.csv'
DELIMITER ';'
CSV HEADER;


UPDATE produkte p
SET stueckpreis = t.stueckpreis
FROM temp_produkte t
WHERE p.produkt_id = t.produkt_id;


DROP TABLE Bestellung;
/*
CREATE TABLE Bestellung (
    Bestellung_ID INT PRIMARY KEY,
    Bestellung_Datum DATE,
    Kunden_ID INT,
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC(10,2), --MAX 10 zahlen und 2 zahlen nach der komma
	FOREIGN KEY (Kunden_ID) REFERENCES Kunden(Kunden_ID),
	FOREIGN KEY (Produkt_ID) REFERENCES Produkte(Produkt_ID)
);
*/

/*
CREATE TABLE Bestellung (
    Bestellung_ID VARCHAR(100) PRIMARY KEY,
    Bestellung_Datum DATE,
    Kunden_ID VARCHAR(100),
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC,
    FOREIGN KEY (Kunden_ID) REFERENCES Kunden(Kunden_ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkte(Produkt_ID)
);
*/



DROP TABLE Bestellung;

CREATE TABLE Bestellung (
    Bestellung_ID VARCHAR(100) PRIMARY KEY,
    Bestellung_Datum DATE,
    Kunden_ID VARCHAR(100),
    FOREIGN KEY (Kunden_ID) REFERENCES Kunden(Kunden_ID)
);

/*
CREATE TABLE Bestellung_Details (
    Bestellung_ID VARCHAR(100),
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC,
    PRIMARY KEY (Bestellung_ID, Produkt_ID),
    FOREIGN KEY (Bestellung_ID) REFERENCES Bestellung(Bestellung_ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkte(Produkt_ID)
);
*/

DROP TABLE Bestellung_Details;


CREATE TABLE temp_details (
    Bestellung_ID VARCHAR(100),
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC
);


CREATE TABLE test (
    Bestellung_ID VARCHAR(100),
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC
);
COPY test
FROM 'C:\Users\User\Downloads\bestellung_details0 (version 1).csv'
DELIMITER ';'
CSV HEADER;

SELECT *
FROM test;
DROP table test;


CREATE TABLE Bestellung_Details (
    Bestellung_ID VARCHAR(100),
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC,
    PRIMARY KEY (Bestellung_ID, Produkt_ID),
    FOREIGN KEY (Bestellung_ID) REFERENCES Bestellung(Bestellung_ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkte(Produkt_ID)
);


INSERT INTO Bestellung_Details
SELECT 
    Bestellung_ID,
    Produkt_ID,
    SUM(Menge),
    SUM(Verkaeufe)
FROM test
GROUP BY Bestellung_ID, Produkt_ID;

SELECT *
FROM   bestellung_details;





COPY temp_Details
FROM 'C:\Users\User\Downloads\bestellung_details0.csv'
DELIMITER ';'
CSV HEADER;

SELECT *
FROM   temp_details;


CREATE TABLE Bestellung_Details (
    Bestellung_ID VARCHAR(100),
    Produkt_ID VARCHAR(20),
    Menge INT,
    Verkaeufe NUMERIC,
    PRIMARY KEY (Bestellung_ID, Produkt_ID),
    FOREIGN KEY (Bestellung_ID) REFERENCES Bestellung(Bestellung_ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkte(Produkt_ID)
);


INSERT INTO Bestellung_Details
SELECT 
    Bestellung_ID,
    Produkt_ID,
    SUM(Menge),
    SUM(Verkaeufe)
FROM temp_details
GROUP BY Bestellung_ID, Produkt_ID;

SELECT *
FROM   bestellung_details;

DROP TABLE temp_details;
SELECT *
FROM   groessen;

SELECT *
FROM   kaffeesorten;

SELECT *
FROM   kunden;

SELECT *
FROM   laender;


SELECT *
FROM   roestarten;




SELECT *
FROM   bestellung;

SELECT *
FROM   produkte;

COPY Produkte
FROM 'C:\Users\User\Downloads\produkte33.csv'
DELIMITER ';'
CSV HEADER;

COPY bestellung
FROM 'C:\Users\User\Downloads\bestellung0.csv'
DELIMITER ';'
CSV HEADER;




SELECT *
FROM   Bestellung_Details;



SELECT *
FROM   bestellung
ORDER BY bestellung_datum;

--4. Wie viele Transaktionen/Käufe sind insgesamt im Datensatz enthalten?

SELECT DISTINCT COUNT(*)
FROM   bestellung;


SELECT COUNT(*)
FROM   bestellung;
--عدد المبيعات 758
-- zwischen die besttel datum 02.01.2019 
-- und 19.08.2022

--5. Welche Kaffeesorten/Produkte werden am häufigsten verkauft? 

SELECT *
FROM   bestellung_details;
SELECT *
FROM   groessen;
SELECT *
FROM   kaffeesorten;
SELECT *
FROM   kunden;
SELECT *
FROM   laender;
SELECT *
FROM   roestarten;
SELECT *
FROM   bestellung;
SELECT *
FROM   produkte;


SELECT ks.Kaffeesorten_name,
       SUM(bd.Menge) AS total
FROM Bestellung_Details bd
JOIN Produkte p ON bd.Produkt_ID = p.produkt_ID
JOIN Kaffeesorten ks ON p.Kaffeesorten_id = ks.Kaffeesorten_id
GROUP BY ks.Kaffeesorten_name
ORDER BY total DESC;

--قهوة الاربيكا الاكثر مبيعا 
-- و الاقل مبيعا هي الليبريكا


/*
موظف مركز اتصال
محلل بيانات
CREATE ROLE callcenter;
CREATE ROLE analyst;
*/


--6. Welches Kaffee-Produkt bringt den höchsten Gesamtumsatz?


--أكثر المنتجات مبيعاً
--بالنسبة للاسم القهوة و جحمها و نوع الحموضة

SELECT   p.Produkt_ID,
         k.kaffeesorten_name,
		 g.groesse,
		 r.roestarten_name,
         SUM(bd.Menge) AS total
FROM     Bestellung_Details bd
JOIN     produkte p
USING    (produkt_id)
JOIN     kaffeesorten k
USING    (kaffeesorten_id)
JOIN     roestarten r
USING    (roestarten_id)
JOIN     groessen g
USING    (groesse_id)
GROUP BY p.Produkt_ID ,k.kaffeesorten_name , g.groesse, r.roestarten_name
ORDER BY total DESC;

SELECT   p.Produkt_ID,
         k.kaffeesorten_name,
		 g.groesse,
		 r.roestarten_name,
         SUM(bd.Menge) AS total
FROM     Bestellung_Details bd
JOIN     produkte p
USING    (produkt_id)
JOIN     kaffeesorten k
USING    (kaffeesorten_id)
JOIN     roestarten r
USING    (roestarten_id)
JOIN     groessen g
USING    (groesse_id)
GROUP BY p.Produkt_ID ,k.kaffeesorten_name , g.groesse, r.roestarten_name
ORDER BY total;


SELECT r.roestarten_name, SUM(bd.Menge) AS total
FROM Bestellung_Details bd
JOIN Produkte p ON bd.Produkt_ID = p.produkt_ID
JOIN Roestarten r ON p.roestarten_id = r.roestarten_id
GROUP BY r.roestarten_name
ORDER BY total DESC;


--هل الحجم يؤثر على المبيعات؟
SELECT g.Groesse, SUM(bd.Menge) AS total
FROM Bestellung_Details bd
JOIN Produkte p ON bd.Produkt_ID = p.produkt_ID
JOIN Groessen g ON p.Groesse_id = g.Groesse_id
GROUP BY g.Groesse
ORDER BY total DESC;



--أي نوع تحميص الأكثر مبيعاً؟
SELECT r.Roestarten_name, SUM(bd.Menge) AS total
FROM Bestellung_Details bd
JOIN Produkte p ON bd.Produkt_ID = p.produkt_ID
JOIN Roestarten r ON p.roestarten_id = r.roestarten_id
GROUP BY r.Roestarten_name
ORDER BY total desc;


SELECT ks.Kaffeesorten_name,
       ROUND(SUM(bd.Verkaeufe)) AS umsatz
FROM Bestellung_Details bd
JOIN Produkte p ON bd.Produkt_ID = p.produkt_ID
JOIN Kaffeesorten ks ON p.Kaffeesorten_id = ks.Kaffeesorten_id
GROUP BY ks.Kaffeesorten_name
ORDER BY umsatz DESC;

SELECT   p.Produkt_ID,
         k.kaffeesorten_name,
		 g.groesse,
		 r.roestarten_name,
         ROUND(SUM(bd.Verkaeufe)) AS umsatz
FROM     Bestellung_Details bd
JOIN     produkte p
USING    (produkt_id)
JOIN     kaffeesorten k
USING    (kaffeesorten_id)
JOIN     roestarten r
USING    (roestarten_id)
JOIN     groessen g
USING    (groesse_id)
GROUP BY p.Produkt_ID ,k.kaffeesorten_name , g.groesse, r.roestarten_name
ORDER BY Umsatz DESC;

SELECT *
FROM   bestellung_details;
--متوسط سعر البيع
SELECT ROUND(AVG(Verkaeufe)) AS avg_sales
FROM Bestellung_Details;
-- 44 doler


SELECT *
FROM  bestellung_details;

SELECT TO_CHAR(Bestellung_Datum, 'TMDay')
FROM Bestellung;


SELECT 
    TO_CHAR(bst.bestellung_datum, 'TMDay') AS wochentag,
    ROUND(SUM(bd.verkaeufe)) AS gesamt_umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY wochentag
ORDER BY gesamt_umsatz DESC;








/*
--أكثر المنتجات مبيعاً
SELECT Produkt_ID, ROUND(SUM(Verkaeufe)) AS umsatz
FROM Bestellung_Details
GROUP BY Produkt_ID
ORDER BY umsatz DESC
LIMIT 1;
*/

SELECT *
FROM   produkte;

--العلاقة بين الكمية والسعر
SELECT Menge, ROUND(AVG(Verkaeufe),2)
FROM Bestellung_Details
GROUP BY Menge ;


SELECT 
    Menge,
    ROUND(AVG(Verkaeufe),2) AS avg_umsatz
FROM Bestellung_Details
GROUP BY Menge
ORDER BY Menge;

SELECT 
    bd.Menge,
    ROUND(AVG(p.stueckpreis), 2) AS avg_preis,
    ROUND(AVG(bd.Verkaeufe), 2) AS avg_umsatz
FROM Bestellung_Details bd
JOIN Produkte p 
    ON bd.Produkt_ID = p.Produkt_ID
GROUP BY bd.Menge
ORDER BY bd.Menge;

SELECT 
    g.Groesse,
    ROUND(AVG(p.stueckpreis),2) AS avg_preis
FROM Produkte p
JOIN Groessen g 
    ON p.Groesse_id = g.Groesse_id
GROUP BY g.Groesse
ORDER BY g.Groesse;


SELECT   p.Produkt_ID,
         k.kaffeesorten_name,
		 g.groesse,
		 r.roestarten_name,
		 --bd.menge,
         ROUND(SUM(bd.Verkaeufe)) AS umsatz
FROM     Bestellung_Details bd
JOIN     produkte p
USING    (produkt_id)
JOIN     kaffeesorten k
USING    (kaffeesorten_id)
JOIN     roestarten r
USING    (roestarten_id)
JOIN     groessen g
USING    (groesse_id)
GROUP BY p.Produkt_ID ,k.kaffeesorten_name , g.groesse, r.roestarten_name
ORDER BY Umsatz DESC;
--LIMIT 5;

--Peak Nachfrage
SELECT  bst.bestellung_datum,
        ROUND(SUM(bd.verkaeufe)) AS umsatz
FROM    bestellung_details bd
JOIN    bestellung bst
USING   (bestellung_id)
GROUP BY bst.bestellung_datum
ORDER BY  bst.bestellung_datum;
LIMIT 5;

------------------------------------------------------------------------
--متوسط قيمة الطلب (Bestellwert)
WITH bestellung_summe AS (
    SELECT 
        bestellung_id,
        SUM(verkaeufe) AS gesamtbetrag
    FROM bestellung_details
    GROUP BY bestellung_id
)
SELECT 
    ROUND(AVG(gesamtbetrag),2) AS durchschnittlicher_bestellwert
FROM bestellung_summe;


--Der durchschnittliche Bestellwert wurde in zwei Schritten berechnet: 
--zuerst die Summe pro Bestellung und anschließend der Durchschnitt über alle Bestellungen.

  SELECT 
        bestellung_id,
        SUM(verkaeufe) AS gesamtbetrag
    FROM bestellung_details
    GROUP BY bestellung_id;

SELECT *
FROM   bestellung_details;

SELECT *
FROM bestellung;
------------------------------------------------


--🟢 1. Umsatz pro Monat
SELECT 
    TO_CHAR(bst.bestellung_datum, 'YYYY-MM') AS monat,
    ROUND(SUM(bd.verkaeufe)) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY monat
ORDER BY monat;


SELECT 
    TO_CHAR(bst.bestellung_datum, 'MM') AS monat,
    ROUND(SUM(bd.verkaeufe)) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY monat
ORDER BY umsatz desc;



SELECT 
    TO_CHAR(bst.bestellung_datum, 'Month') AS monat,
    EXTRACT(MONTH FROM bst.bestellung_datum) AS monat_num,
    ROUND(SUM(bd.verkaeufe)) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY monat, monat_num
ORDER BY Umsatz DESC;
-------------------------------------------------------------------------------------

--العملاء الأكثر قيمة
SELECT 
    k.kunden_id,
    k.kunden_name,
    ROUND(SUM(bd.verkaeufe)) AS gesamtumsatz
FROM kunden k
JOIN bestellung b
    ON k.kunden_id = b.kunden_id
JOIN bestellung_details bd
    ON b.bestellung_id = bd.bestellung_id
GROUP BY k.kunden_id, k.kunden_name
ORDER BY gesamtumsatz DESC
LIMIT 5;

SELECT *
FROM   bestellung_details;
--أفضل العملاء (Top Kunden)  و من اي دةولة
SELECT c.Kunden_Name, 
       l.land, 
	   SUM(bd.Verkaeufe) AS umsatz 
FROM   Bestellung b
JOIN   Kunden c ON b.Kunden_ID = c.Kunden_ID
JOIN   Bestellung_Details bd ON b.Bestellung_ID = bd.Bestellung_ID
JOIN   laender l
USING  (land_id)
GROUP BY c.Kunden_Name , l.land
ORDER BY umsatz DESC
;

SELECT l.land, 
	   SUM(bd.Verkaeufe) AS umsatz 
FROM   Bestellung b
JOIN   Kunden c ON b.Kunden_ID = c.Kunden_ID
JOIN   Bestellung_Details bd ON b.Bestellung_ID = bd.Bestellung_ID
JOIN   laender l
USING  (land_id)
GROUP BY l.land
ORDER BY umsatz DESC
;








SELECT 
CASE 
    WHEN EXTRACT(HOUR FROM bst.bestellung_datum) BETWEEN 6 AND 11 THEN 'Morgen'
    WHEN EXTRACT(HOUR FROM bst.bestellung_datum) BETWEEN 12 AND 17 THEN 'Nachmittag'
    WHEN EXTRACT(HOUR FROM bst.bestellung_datum) BETWEEN 18 AND 23 THEN 'Abend'
    ELSE 'Nacht'
END AS tageszeit,
SUM(bd.verkaeufe) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY tageszeit
ORDER BY umsatz DESC;



WITH bestellung_summe AS (
    SELECT 
        bestellung_id,
        SUM(verkaeufe) AS gesamtbetrag
    FROM bestellung_details
    GROUP BY bestellung_id
)

SELECT 
    bst.zahlungsmethode,
    COUNT(*) AS anzahl_bestellungen,
    AVG(bs.gesamtbetrag) AS durchschnittlicher_bestellwert
FROM bestellung bst
JOIN bestellung_summe bs
    ON bst.bestellung_id = bs.bestellung_id
GROUP BY bst.zahlungsmethode
ORDER BY anzahl_bestellungen DESC;


--Eine Analyse der Zahlungsmethoden wäre möglich, wenn entsprechende Daten vorhanden wären. 
--Da diese jedoch im Datensatz fehlen, wurde diese Analyse nicht durchgeführt.




/*
SELECT 
    DATE_TRUNC('month', bst.bestellung_datum) AS monat,
    SUM(bd.verkaeufe) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY monat
ORDER BY monat;


SELECT 
    DATE_TRUNC('month', bst.bestellung_datum) AS monat,
    SUM(bd.verkaeufe) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY monat
ORDER BY monat;
*/






--العملاء الأكثر قيمة
SELECT 
    bd1.produkt_id AS produkt1,
    bd2.produkt_id AS produkt2,
    COUNT(*) AS haeufigkeit
FROM bestellung_details bd1
JOIN bestellung_details bd2
    ON bd1.bestellung_id = bd2.bestellung_id
   AND bd1.produkt_id < bd2.produkt_id
GROUP BY produkt1, produkt2
ORDER BY haeufigkeit DESC
LIMIT 5;




--🟢 Top 5 Produkte
CREATE VIEW top_5_produkte AS
SELECT 
    produkt_id,
    SUM(verkaeufe) AS umsatz
FROM bestellung_details
GROUP BY produkt_id
ORDER BY umsatz DESC
LIMIT 5;
DROP VIEW top_5_produkte;

--Umsatz pro Wochentag
CREATE VIEW umsatz_wochentag AS
SELECT 
    TRIM(TO_CHAR(bst.bestellung_datum, 'TMDay')) AS tag,
    SUM(bd.verkaeufe) AS umsatz
FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id
GROUP BY tag;

SELECT *
FROM   umsatz_wochentag;

DROP VIEW umsatz_wochentag;



/*
--Über die vorgegebenen Fragestellungen hinaus habe ich eigenständig weitere Muster im Kunden- und Kaufverhalten analysiert.

SELECT 
    TO_CHAR(bst.bestellung_datum, 'TMMonth') AS monat,
    
    CASE 
        WHEN EXTRACT(MONTH FROM bst.bestellung_datum) IN (12,1,2) THEN 'Winter'
        WHEN EXTRACT(MONTH FROM bst.bestellung_datum) IN (3,4,5) THEN 'Frühling'
        WHEN EXTRACT(MONTH FROM bst.bestellung_datum) IN (6,7,8) THEN 'Sommer'
        ELSE 'Herbst'
    END AS saison,
    
    SUM(bd.verkaeufe) AS gesamt_umsatz

FROM bestellung_details bd
JOIN bestellung bst
    ON bd.bestellung_id = bst.bestellung_id

GROUP BY 
    monat,
    saison

ORDER BY gesamt_umsatz DESC;
*/


