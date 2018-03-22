# Buildsystem der xMZ-Plattform

Das Buildsystem setzt auf yocto/openembedded.

Zur besseren Trennung der Rechner Infrastruktur werden die yocto
Komponenten in Docker Containern installliert.

## Abhänigkeiten

- Docker

## Installation

Die Basis bildet der so genannte `yocoto` Container. Dieses Docker Image muss
zu Erst erstellt werden:

```bash
cd ./yocoto/
./build.sh
```
