Dieses Verzeichnis enthält ein Dockerfile mit einem python3 http Server.

Der Webserver wird im shared build directory von yocto/bitbake gestartet, und
liefert die ipk Packtete zur Installation via `opkg update` / `opkg upgrade`.

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
