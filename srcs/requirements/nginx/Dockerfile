
# Funcionamiento de Dockerfile para Nginx
# Este Dockerfile crea una imagen de Nginx basada en Alpine Linux.

# Sintaxis básica:
    # FROM <imagen_base>
    # RUN <comando_para_ejecutar>
    # COPY <origen> <destino>
    # CMD <comando_por_defecto_en_json>

# Ultima version es 3.22.2 al momento de hacerlo
FROM debian:trixie

# Al estar basado en Alpine, usamos apk para instalar nginx y openssl
RUN apt-get update && apt-get install -y nginx

# Hay que crear el directorio /run/nginx para que Nginx pueda crear su archivo PID
# RUN mkdir -p /run/nginx

# # Copiamos el archivo de configuración personalizado y el contenido HTML
COPY ./default /etc/nginx/sites-available/.

# # Exponemos el puerto 80 para HTTP
EXPOSE 80

# Comando por defecto para ejecutar Nginx en primer plano
# Ya que Nginx por defecto se ejecuta en segundo plano (daemon)
CMD ["nginx", "-g", "daemon off;"]
