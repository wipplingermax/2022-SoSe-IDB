# Vorlesung Datenbanken

Das hier zur Verfügung gestellte Repo bietet eine Docker Grundinstalltion für Postgres und Pgadmin.

Es ist für Personen gedacht, die Postgres und Pgadmin nicht auf ihrem eigenen System installieren wollen / können oder eine schnelle und einfache Lösung zur Installation haben möchten.

**Login-Daten für Pgadmin:**

Username: admin@example.com

Passwort: admin

## Was ist Docker?

Docker ist Software, die es erlaubt virtuelle Services auf diversen Plattformen bereitzustellen. Es erlaubt die einfache Ausführung der gleichen Software auf verschiedenen Systemen ohne sich mit den Eigenheiten verschiedener Systeme rumschlagen zu müssen.

Docker stellt sogenannte "Container" bereit in denn die Software läuft.

### Voraussetzungen
Docker muss installiert sein, unter folgendem Link zu finden:
```https://docs.docker.com/get-docker/```

### Lade dir das Repo herunter
bspw. mit 
```git clone https://github.com/wipplingermax/2022SS_IDB```
oder im Browser

**fertig =)** 

## Datenbank und Pgadmin starten

Um die Datenbank und Pgadmin zu starten einfach in dem Terminal deiner Wahl in den Ordner wechseln und folgenden Befehl ausführen:

```docker-compose up``` (alternativ ```docker-compose up -d``` sofern die Container im Hintergrund weiterlaufen sollen

## Datenbank und Pgadmin beenden 

Um die Datenbank und Pgadmin zu beenden einfach in dem Terminal deiner Wahl in den Ordner wechseln und folgenden Befehl ausführen:

```docker-compose down```

## Tipps und Tricks

Wenn du in deinem Terminal auf die postgres-shell direkt zugreifen möchtest, kannst du hierfür mein vorgefertiges Skript ausführen

Hier zu einfach in den Ordner wechseln und folgenden Befehl eintippen

```./start-postgres-shell.sh```


(Sofern das Skript nicht direkt funktioniert, versuche: ```chmod 755 start-postgres-shell```)

## Wie funktioniert das hier bereitgestellte Docker-Setup?

Das Setup baut auf zwei Containern auf:
- postgres (Datenbank-Container)
- pgadmin (Adminstrations-Container)

Der pgadmin Container wird bereits vorkonfiguriert zur Verfügung gestellt, sodass er bereits eine Verbindung mit der Datenbank herstellt.
Hierzu werden in einem Dockerfile Konfiguationsdaten in das Image kopiert.

Die Services laufen unter folgenden adresse:
- Postgres: ```127.0.0.1:5432```
- PgAdmin: ```127.0.0.1:80```

## Wo sind die Daten der Datenbank gespeichert?

Die Daten werden in einem Docker-Volume gespeichert. 
Dieses findest du je nach Betriebssystem unter folgendem Pfad:

Linux: ```/var/lib/docker/volume/```

Windows (unter Vorbehalt): ```C:\Users\Public\Documents\Hyper-V\Virtual hard disks``` 

(falls die Ordner bei dir nicht vorhanden sind einfach mal googlen, kann möglicherweise abweichen ;))




