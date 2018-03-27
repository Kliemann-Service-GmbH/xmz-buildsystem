# Buildsystem der xMZ-Plattform

Das Buildsystem setzt auf yocto/openembedded.

Zur besseren Trennung der Rechner Infrastruktur werden die yocto
Komponenten in Docker Containern installliert.

## Verzeichnis Layout

Dieses Verzeichnis enthält verschiedene Docker Conatiner Vorlagen (Dockerfiles)

- `yocto`
  - das ist der Basis Container mit allen yocto-Abhängikeiten installiert
- `bitbake`
  - dies ist der "arbeits"-Conatiner mit dem der Quellcode gebaut wird
- `opkg-shared`
  - dieser Container ist optional, er startet einen einfachen Webserver
    im 'ipk' Verzeichnis (ipk = installierbare Packete)

- `shared`
  - Außerdem ist in dem Verzeichnis des `xmz-buildsystems` der Ordner für die
    gemeinsamen Dateien (Downloads, bitbake cache, artefacts) zu finde.

## Abhänigkeiten

Das Buildsystem benötigt:

- Docker https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository

## Installation

Die Reihenfolge in der die Docker Container erstellt werden müssen ist wichtig.
Begonnen wird mit dem Basis Container 'yocto'.

### Yocto

Die Basis bildet der so genannte `yocto` Container. Dieses Docker Image muss
zuerst erstellt werden:

```bash
sh ./yocto/build.sh
```

### Bitbake

Nach dem der Container 'yocto' erstellt wurde wird der Conainter 'bitbake'
erstellt.

```bash
sh ./bitbake/build.sh
```

### Optional: opkg-updates Server

Nachdem der Basis Conainter 'yocto' erstellt wurde kann auch der 'opkg-updates'
Container erstellt werden.

```bash
sh ./opkg-updates/build.sh
```

# Shared

Im 'bitbake'-Container ist `poky` (/home/build/poky) schon enthalten. Alle weiteren
Rezepte, sowie die `bitbake` Konfigurationsdateien müssen nach shared kopiert werden.

```bash
git submodule init
git submodule update
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
