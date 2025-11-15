#!/bin/bash

set -e

if [ ! -d /var/lib/mysql/mysql ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --ldata=/var/lib/mysql

    # Empieza el servicio de MariaDB en segundo plano temporalmente
    # para ejecutar comandos de configuración inicial
    mysqld_safe --nowatch

    # Espera a que el servidor esté listo
    sleep 5

    echo "Setting root password and creating database..."

    # Se configura la contraseña de root y se crea la base de datos
    mariadb -u root <<EOSQL
        CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
        CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
        GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
        FLUSH PRIVILEGES;
EOSQL

    # Detiene el servidor MariaDB temporalmente iniciado
    mysqladmin -u root shutdown
    echo "MariaDB initialization complete."
fi

echo "Starting MariaDB server..."
exec mysqld_safe