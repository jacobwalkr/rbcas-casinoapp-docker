# rbcas-casinoapp-docker
A Docker image for a running the rbCAS CASinoApp

Relies on [rbCAS/CASinoApp](https://github.com/rbCAS/CASinoApp).

Expects an LDAP service hostname in $LDAP_HOST. I use it in Docker Compose:

```yaml
version: '3'

networks:
  bridge:
    driver: bridge

services:
  app:
    # ...

  cas:
    build:
      context: http://github.com/jacobwalkr/rbcas-casinoapp-docker.git
    depends_on:
      - "ldap"
    environment:
      - LDAP_HOST=ldap
    networks:
      - bridge
    ports:
      - "8181:8181"

  ldap:
    image: "greggigon/apacheds"
    networks:
      - bridge
    ports:
      - "10389:10389"

```
