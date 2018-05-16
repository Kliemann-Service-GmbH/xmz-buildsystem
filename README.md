# Buildsystem der xMZ-Plattform

Das Buildsystem setzt auf yocto/openembedded.

Zur besseren Trennung der Rechner Infrastruktur werden die einzelnen
Komponenten in seperaten Docker Containern installliert.

## Verzeichnis Layout

Dieses Verzeichnis enthält verschiedene Docker Conatiner Vorlagen so genannte
`Dockerfiles`.

- `yocto`
  - das ist der Basis Container mit allen yocto-Abhängikeiten installiert
- `poky`
  - dies ist der "Arbeits"-Conatiner in dem, mit dem, der Quellcode gebaut wird
- `opkg-shared`
  - dieser Container ist optional, er startet einen einfachen Webserver
    im 'ipk' Verzeichnis (ipk = installierbare Packete)
- `shared`
  - gemainsames Verzeichnis des `xmz-buildsystems`
  - in diesem Ordner sind die gemeinsamen Dateien wie:
    Downloads, bitbake Cache, Artefacts und so weiter, zu finden
  - **In diesem Verzeichnis müssen auch evtl. benötigte Layer mit weiteren `.bb`
    Rezepten gespeichert werden.**

## Abhänigkeiten

Das Buildsystem benötigt:

- Docker https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository

## Installation

Die Reihenfolge in der die Docker Container erstellt werden müssen ist wichtig.
Begonnen wird mit dem Basis Container `yocto`.

### Yocto

Die Basis bildet der so genannte `yocto` Container. **Dieses Docker Image muss
als erstes erstellt werden!**

```bash
sh ./yocto/build.sh
```

### Poky

Nach dem der Container 'yocto' erstellt wurde wird der Conainter 'poky'
erstellt.

```bash
sh ./poky/build.sh
```

### Optional: opkg-updates Server

Nachdem der Basis Conainter 'yocto' erstellt wurde kann auch der 'opkg-updates'
Container erstellt werden.

```bash
sh ./opkg-updates/build.sh
```

# Shared

Im 'poky'-Container ist das Buildtool `poky` (/home/build/poky) enthalten. Alle weiteren
Rezepte, sowie die `bitbake` Konfigurationsdateien müssen nach shared kopiert werden.

Einige 'meta' Repository mit essentionalen Layern und Rezepten sind als git submodule
in diesem Repository eingebunden. Diese Submodule können mit den folgenden Befehlen
syncronisiert werden.

```bash
git submodule init
git submodule update
```


# Software build

Es gibt verschiedene Arten wie mit dem Buildsystem gearbeitet werden kann.

## poky interactive

Eine Möglichkeit ist die interactive Arbeit mit `poky`. Dazu muss docker mit
dem folgenden Parameter gestartet werden.

```bash
docker run --volume=/abs/path/to/shared:/home/build/shared --rm -ti zzeroo/poky:latest
```

Dieser Befehl startet eine Bash Shell in der die open-embedded Umgebung bereits
"gesourced" wurde (siehe [`poky` Dockerfile](poky/Dockerfile#L12)).

## poky scripted

`poky` kann im docker Container auch direkt aufgerufen werden. Das ist sehr
hilfreich wenn man das Buildsystem zum Beispiel in Scripten aufrufen will.

Im Beispiel wird das Rezept `xmz-test-tool-image` mit dem Buildsystem gebaut.

```bash
docker run --volume=/abs/path/to/shared:/home/build/shared --rm -ti zzeroo/poky:latest  "cd /home/build/poky && source oe-init-build-env /home/build/shared/build && poky xmz-test-tool-image"
```



# Publish Artefacts
## last build log

```bash
/var/src/xMZ-Plattform/xmz-buildsystem/shared/build/tmp/log/cooker/bananapro
```

## Stats

```bash
ls -1t /var/src/xMZ-Plattform/xmz-buildsystem/shared/build/tmp/buildstats/| tail -n1
```
