Dieses Verzeichnis enthält ein Dockerfile mit einem python3 http Server.

Der Webserver wird im shared build directory von yocto/poky gestartet, und
stellt die ipk Pakete zur Installation bereit.
Die Installation erfolgt auf dem Client mit Befehlen wie `opkg update` und
`opkg upgrade`.

## Container bilden

```bash
bash ./build.sh
```

## Container starten

```bash
bash ./run.sh
```


# Links

- https://www.yoctoproject.org/
