-- Welche Kaffeesorten/Produkte werden am häufigsten verkauft? 

SELECT ks.Kaffeesorten_name,
       SUM(bd.Menge) AS total
FROM Bestellung_Details bd
JOIN Produkte p ON bd.Produkt_ID = p.produkt_ID
JOIN Kaffeesorten ks ON p.Kaffeesorten_id = ks.Kaffeesorten_id
GROUP BY ks.Kaffeesorten_name
ORDER BY total DESC;
