# Inception 42

Este proyecto es parte del currículo de la escuela 42 y consiste en la creación de una infraestructura web completa usando Docker. El objetivo es aprender a orquestar servicios como WordPress, MariaDB, Nginx y otros, cada uno en su propio contenedor, siguiendo buenas prácticas de seguridad y despliegue.

## Servicios principales

- **Nginx**: Servidor web con HTTPS (SSL/TLS)
- **WordPress**: CMS instalado y gestionado automáticamente
- **MariaDB**: Base de datos para WordPress
- **Bonus**: Servicios adicionales como FTP, Adminer, sitio estático, etc.

srcs/
  requirements/
    nginx/
    wordpress/
    mariadb/
    bonus/
      (servicios extra)
  docker-compose.yml
  docker-compose-bonus.yml
  .env

## Estructura del proyecto

```
srcs/
   requirements/
      nginx/
         Dockerfile
         default.conf
         default-bonus.conf
         tools/
            generate-ssl.sh
            script.sh
         web/
            index.html
      wordpress/
         Dockerfile
         www.conf
         tools/
            script.sh
      mariadb/
         Dockerfile
         mariadb-server.cnf
         tools/
            setup.sh
      bonus/   # (vacío actualmente; aquí se agregan servicios extra)
   docker-compose.yml
   docker-compose-bonus.yml
   .env
```

## Cómo ejecutar el proyecto

1. Clona el repositorio y entra en la carpeta del proyecto.
2. Configura el archivo `.env` con tus variables (usuarios, contraseñas, etc).
3. Ejecuta:
   ```bash
   make
   ```
   Esto construirá y levantará los servicios principales.


4. Para levantar los servicios bonus (si agregas alguno):
   ```bash
   make bonus
   ```

5. Para limpiar todo:
   ```bash
   make fclean
   ```


## Acceso

- WordPress: https://gsoteldo.42.fr/
- Adminer: https://gsoteldo.42.fr/adminer (si lo agregas como bonus)
- FTP: puerto 21 (si lo agregas como bonus)
- Sitio estático: https://gsoteldo.42.fr/ (en modo bonus)
