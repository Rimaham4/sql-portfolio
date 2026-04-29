# SQL Portfolio

## Beschreibung
Dieses Projekt enthält SQL-Übungen und Projekte mit:
## Tools
- SQL Server
- PostgreSQL

## Projektstruktur
- /sql-server → T-SQL Übungen und AdventureWorks
- /postgresql → Datenmigration und Systemvergleich
- /github-research → Analyse von GitHub-Profilen und Projekten

## Ziel dieses Projekts

Dieses Projekt zeigt meine Fähigkeit:
- SQL-Abfragen zu schreiben
- Daten zu analysieren
- Businessfragen zu beantworten
  
## Beispiele

### Beispiel 1: Anzahl der Bestellungen

### Wie viele Transaktionen/Käufe sind insgesamt im Datensatz enthalten?
```sql
SELECT COUNT(*)
FROM   bestellung;
```
- Ergebnis: Gesamtanzahl aller Bestellungen :758
SQL-Datei:
[count_orders.sql](sql-server/count_orders.sql)

### Beschreibung:
Diese Abfrage zählt die Gesamtanzahl der Bestellungen in der Tabelle.

### Beispiel 2: Meistverkaufte Kaffeesorten

Frage:  
Welche Kaffeesorten werden am häufigsten verkauft?
- ### Ergebnis:  Arabica ist die meistverkaufte Kaffeesorte (762 Verkäufe)
- ### Ergebnis (Screenshot)

![Kaffee Ergebnis](kaffeesorten0.png)

### Erklärung

- JOIN verbindet mehrere Tabellen (Bestellungen, Produkte, Kaffeesorten)
- SUM(bd.Menge) berechnet die gesamte Verkaufsmenge
- GROUP BY gruppiert nach Kaffeesorten
- ORDER BY DESC zeigt die meistverkauften zuerst

### Business Insight

- Arabica ist die meistverkaufte Kaffeesorte
- Das Unternehmen sollte:
  - mehr Arabica lagern
  - Marketing auf Arabica fokussieren
    
SQL-Datei:
[kaffeesorten.sql](sql-server/kaffeesorten.sql)

