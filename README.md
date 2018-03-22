# Buildsystem der xMZ-Plattform

Das Buildsystem setzt auf yocto/openembedded.

Zur besseren Trennung der Rechner Infrastruktur werden die yocto
Komponenten in Docker Containern installliert.

## Abhänigkeiten

- Docker `apt install docker`

## Installation

Die Basis bildet der so genannte `yocto` Container. Dieses Docker Image muss
zuerst erstellt werden:

```bash
cd ./yocoto/
./build.sh
```
