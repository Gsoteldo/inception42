# Documentación para Desarrolladores - Inception 42


## Estructura del proyecto

- `srcs/requirements/nginx/`:
  - `Dockerfile`: Imagen de Nginx basada en Alpine Linux
  - `default.conf`, `default-bonus.conf`: Configuraciones para los modos normal y bonus
  - `tools/generate-ssl.sh`: Script para generar certificados SSL autofirmados
  - `tools/script.sh`: Script de arranque que selecciona la configuración según el modo
  - `web/index.html`: Sitio estático (bonus)
- `srcs/requirements/wordpress/`:
  - `Dockerfile`: Imagen de WordPress con PHP-FPM
  - `tools/script.sh`: Script de inicialización y descarga automática de WordPress y WP-CLI
  - `www.conf`: Configuración de PHP-FPM
- `srcs/requirements/mariadb/`:
  - `Dockerfile`: Imagen de MariaDB
  - `mariadb-server.cnf`: Configuración personalizada de MariaDB
  - `tools/setup.sh`: Script de inicialización de la base de datos y usuarios
- `srcs/docker-compose.yml`: Orquestación principal (Nginx, WordPress, MariaDB)
- `srcs/docker-compose-bonus.yml`: Orquestación extendida para bonus (modifica variables de entorno)
- `srcs/.env`: Variables de entorno sensibles (usuarios, contraseñas, etc.)


## Configuración de Nginx y modos

Nginx puede funcionar en dos modos:

- **Modo normal**: Usa `default.conf` para servir WordPress en la raíz (`/`).
- **Modo bonus**: Usa `default-bonus.conf` para servir un sitio estático en `/` y WordPress en `/blog` (o similar).

El script `tools/script.sh` de Nginx selecciona la configuración adecuada según la variable de entorno `NGINX_MODE`:

- Si `NGINX_MODE=bonus`, reemplaza `default.conf` por `default-bonus.conf` antes de arrancar Nginx.
- Si no, usa la configuración por defecto.

Esto permite alternar entre los modos simplemente cambiando la variable de entorno y reiniciando el contenedor.

Cada servicio principal cuenta con scripts en la carpeta `tools/` que automatizan su arranque y configuración:

- **Nginx**
  - `tools/generate-ssl.sh`: Genera certificados SSL autofirmados si no existen.
  - `tools/script.sh`: Selecciona la configuración (`default.conf` o `default-bonus.conf`) según la variable de entorno `NGINX_MODE` y arranca Nginx en primer plano.

- **WordPress**
  - `tools/script.sh`: Descarga WP-CLI y WordPress si no existen, crea el archivo `wp-config.php` usando las variables de entorno, espera a que MariaDB esté listo, instala WordPress y crea el usuario administrador si es necesario.

- **MariaDB**
  - `tools/setup.sh`: Inicializa el directorio de datos si es la primera vez, arranca MariaDB temporalmente, crea la base de datos y usuarios según las variables de entorno, y detiene el servicio tras la configuración inicial.

Estos scripts aseguran que cada contenedor esté correctamente configurado y listo para interactuar con los demás servicios al arrancar.

- Cada servicio tiene su propio Dockerfile y contenedor.
- Los volúmenes se usan para persistencia de datos (WordPress, MariaDB).
- Las variables sensibles se gestionan en `.env` (no subir a repositorios públicos).
- Los scripts de inicialización (`tools/script.sh`) aseguran que los servicios estén listos antes de continuar.


## Cómo agregar un servicio bonus

Para agregar un servicio extra (por ejemplo, FTP, Adminer, etc):

1. Crea una carpeta en `srcs/requirements/bonus/<servicio>/`.
2. Añade un `Dockerfile` y los archivos de configuración necesarios para ese servicio.
3. Modifica `srcs/docker-compose-bonus.yml` para incluir el nuevo servicio, sus volúmenes y variables de entorno si aplica.
4. (Opcional) Añade scripts de inicialización en `tools/` dentro de la carpeta del servicio.
5. Reconstruye y levanta los servicios con `make bonus`.

## Debugging

- Usa `docker logs <container>` para ver los logs.
- Usa `docker exec -it <container> sh` para entrar a un contenedor.
- Verifica la red con `docker network inspect inception-network`.

## Limpieza y reconstrucción

- Para limpiar todo:
  ```bash
  make fclean
  ```
- Para reconstruir solo un servicio:
  ```bash
  docker compose -f srcs/docker-compose.yml build <servicio>
  ```

## Consejos

- No expongas puertos innecesarios.
- Usa usuarios no-root en los Dockerfile cuando sea posible.
- Mantén los scripts simples y portables (usa `/bin/sh`).
