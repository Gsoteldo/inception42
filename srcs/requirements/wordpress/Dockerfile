
# Funcionamiento de Dockerfile para Wordpress
# Este Dockerfile crea una imagen de Wordpress/php-fpm basada en Alpine Linux.

# Sintaxis básica:
    # FROM <imagen_base>
    # RUN <comando_para_ejecutar>
    # COPY <origen> <destino>
    # CMD <comando_por_defecto_en_json>

# Ultima version es 3.22.2 al momento de hacerlo
FROM alpine:3.19

# Instalamos PHP y las extensiones necesarias
RUN apk update && apk add --no-cache php82-fpm

# Copiamos el archivo de configuración personalizado de php-fpm
COPY ./www.conf /etc/php82/php-fpm.d/www.conf

# Exponemos el puerto 9000 para HTTP
EXPOSE 9000

# Comando para iniciar php-fpm en primer plano. -F evita que se ejecute como daemon.
CMD ["php-fpm82", "-F"]
