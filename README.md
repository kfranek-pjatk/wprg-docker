Kontenery Dockera na użytek zajęć WPRG
==================================

Aby uruchomić kontenery, trzeba przejść poprzez konsolę do głównego katalogu i wydać komendę:

```
docker-compose up d
```

Gdy wszystko pójdzie OK, bedziemy mieli dostęp do serwera Apache poprzez np. przeglądarkę
internetową pod adresem http://localhost:8088/

Pliki PHP i inne, na których ma operować serwer, znajdują się w katalogu `public_html`.

Aby zalogować się do kontenera z serwerem Apache i PHP, należy wydać komendę:

```
docker exec -it -u docker wprg-www bash
```

Od tego momentu wszystkie polecenia będzie wydawać wewnątrz kontenera. Stąd będziemy
mieli dostęp np. do interpretera PHP.
