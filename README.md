*Este proyecto ha sido creado como parte del currículo de 42 por gsoteldo.*

# Inception 42


## Descripcion

Este proyecto es parte del currículo de la escuela 42 y consiste en la creación de una infraestructura web completa usando Docker. El objetivo es aprender a orquestar servicios como WordPress, MariaDB, Nginx y otros, cada uno en su propio contenedor, siguiendo buenas prácticas de seguridad y despliegue.

El proyecto se centra especialmente en:
- El uso de Docker frente a máquinas virtuales tradicionales
- La gestión de configuración mediante archivos `.env`
- La comunicación entre servicios usando redes Docker
- La persistencia de datos mediante volúmenes Docker

El objetivo final es demostrar una comprensión sólida de una infraestructura moderna basada en contenedores y justificar cada decisión técnica tomada.


---

## Descripción del Proyecto

La aplicación se despliega utilizando contenedores Docker y se orquesta mediante Docker Compose.  
La configuración del sistema (usuarios, contraseñas y parámetros de servicios) se gestiona mediante un archivo `.env`, que es leído por Docker en tiempo de ejecución.

El proyecto incluye:
- Dockerfiles para los distintos servicios
- Un archivo `docker-compose.yml` y `docker-compose-bonus.yml`
- Un archivo `.env` para la configuración del entorno
- Redes Docker aisladas para la comunicación interna
- Volúmenes Docker para la persistencia de datos

La arquitectura está diseñada para ser clara, modular y fácilmente mantenible.

---

## Servicios principales

- **Nginx**: Servidor web con HTTPS (SSL/TLS)
- **WordPress**: CMS instalado y gestionado automáticamente
- **MariaDB**: Base de datos para WordPress
- **Bonus**: Servicios adicionales como pagina estatica aparte de wordpress

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
   docker-compose.yml
   docker-compose-bonus.yml
   .env
```

## Ejecución

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
- Sitio estático: https://gsoteldo.42.fr/ (en modo bonus)

## Decisiones Técnicas y Comparaciones
### Máquinas Virtuales vs Docker

#### Máquinas Virtuales

- Incluyen un sistema operativo completo

- Mayor consumo de recursos

- Arranque más lento

#### Docker

- Comparte el kernel del sistema anfitrión

- Más ligero y rápido

- Ideal para arquitecturas basadas en servicios


### Docker Secrets vs Archivo .env

#### Docker Secrets

- Diseñados para entornos orquestados como Docker Swarm

- Mayor nivel de seguridad

- Requieren una infraestructura más compleja

#### Archivo .env

- Sencillo de usar y comprender

- Adecuado para entornos de desarrollo y proyectos educativos

- Permite centralizar la configuración sin añadir complejidad innecesaria

- Decisión:
En este proyecto se utiliza un archivo .env debido a su simplicidad y adecuación al contexto educativo del proyecto.
El uso de Docker Secrets fue evaluado, pero descartado al no ser necesario para el alcance y los requisitos del proyecto.

### Docker Network vs Host Network

#### Host Network

- El contenedor comparte la red del host

- Sin aislamiento

- Mayor riesgo de conflictos y problemas de seguridad

#### Docker Network

- Aislamiento entre servicios

- Resolución DNS interna

- Control explícito de los puertos expuestos


### Docker Volumes vs Bind Mounts

#### Bind Mounts

- Dependientes del sistema anfitrión

- Menor portabilidad

- Riesgo de modificar archivos del host

#### Docker Volumes

- Gestionados directamente por Docker

- Independientes del sistema anfitrión

- Más seguros y portables

---
## Recursos
### Documentación General de Docker: 

- Documentación oficial de Docker: https://docs.docker.com/

- Docker Compose: https://docs.docker.com/compose/

- Docker Networking: https://docs.docker.com/engine/network/

### WordPress y WP-CLI

- Documentación oficial de WordPress: https://wordpress.org/support/

- WP-CLI (herramienta de línea de comandos para WordPress): https://developer.wordpress.org/cli/commands/

- Uso de WP-CLI dentro de contenedores Docker: https://make.wordpress.org/cli/handbook/guides/running-wp-cli-in-docker/

### MariaDB

- Documentación oficial de MariaDB: https://mariadb.com/docs/

### Nginx

- Documentación oficial de Nginx: https://nginx.org/en/docs/

- Uso de Nginx como reverse proxy: https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/


## Uso de Inteligencia Artificial

Las herramientas de inteligencia artificial se utilizaron como apoyo durante el desarrollo del proyecto para:

- Aclarar conceptos relacionados con Docker

- Estructurar y revisar la documentación

- Validar explicaciones técnicas

- Todas las decisiones de diseño, implementación y validación final fueron realizadas por el autor del proyecto.

---

## Notas Finales

Este proyecto ha sido desarrollado priorizando la claridad, mantenibilidad y comprensión de los conceptos fundamentales de Docker, en el contexto de un proyecto académico.