# Buildsystem der xMZ-Plattform

Das Buildsystem setzt auf yocto/openembedded.

Zur besseren Trennung der Rechner Infrastruktur werden die yocto
Komponenten in Docker Containern installliert.

## Abhänigkeiten

- Docker https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository

## Installation
### Yocto

Die Basis bildet der so genannte `yocto` Container. Dieses Docker Image muss
zuerst erstellt werden:

```bash
sh ./yocto/build.sh
```

### Bitbake

```bash
sh ./bitbake/build.sh
```

### Optional: opkg-updates Server

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

