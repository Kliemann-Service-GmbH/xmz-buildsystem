Dieses Verzeichnis enthält das Dockerfile das eine Bitbake Instanz vorbereitet.

Wird ein Container aus diesem Image erzeugt und gestartet dann wird das Skript
`start.sh` gestartet. Dieses Script prüft ob der Container mit einem Shared
Volumen gestartet wurde (default wenn mit `run.sh` gestartet), je nachdem
wird bitbake konfiguriert.

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
