# SQL Portfolio

## Beschreibung
Dieses Projekt enthält SQL-Übungen und Projekte mit:
- SQL Server
- PostgreSQL

## Projektstruktur
- /sql-server → T-SQL Übungen und AdventureWorks
- /postgresql → Datenmigration und Systemvergleich
- /github-research → Analyse von GitHub-Profilen und Projekten

## Ziel
Verbesserung meiner SQL- und Datenanalysefähigkeiten

## Beispiele

### Beispiel 1: Anzahl der Bestellungen

### Wie viele Transaktionen/Käufe sind insgesamt im Datensatz enthalten?
```sql
SELECT COUNT(*)
FROM   bestellung;
```
### Beschreibung:
Diese Abfrage zählt die Gesamtanzahl der Bestellungen in der Tabelle.
