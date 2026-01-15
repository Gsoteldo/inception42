# Manual de Usuario - Inception 42

## Requisitos previos

- Docker y Docker Compose instalados
- Acceso a un sistema Linux (recomendado)
- Añadir `gsoteldo.42.fr` a tu `/etc/hosts` apuntando a `127.0.0.1`

## Primeros pasos

1. Clona el repositorio:
   ```bash
   git clone <repo_url>
   cd inception42
   ```


2. Configura el archivo `.env` con tus datos:
  - Usuario y contraseña de MariaDB
  - Usuario y contraseña de WordPress

3. Levanta los servicios principales:
   ```bash
   make
   ```

4. Accede a WordPress en tu navegador:
   ```
   https://gsoteldo.42.fr/
   ```


## Servicios bonus

Si agregas servicios extra (FTP, Adminer, etc):

- Actívalos con:
  ```bash
  make bonus
  ```

## Comandos útiles

- Parar todos los servicios:
  ```bash
  make down
  ```
- Limpiar todo (contenedores, imágenes, volúmenes):
  ```bash
  make fclean
  ```


## Notas

- El sitio solo es accesible por HTTPS.
- Si tienes problemas, revisa los logs de los contenedores con:
  ```bash
  docker logs <nombre_contenedor>
  ```
- Para agregar servicios bonus, consulta la documentación de desarrollador (`DEV_DOC.md`).
