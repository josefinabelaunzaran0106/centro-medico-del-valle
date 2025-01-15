# Usar la imagen oficial de MariaDB como base
FROM mariadb:latest

# Actualizar e instalar el cliente MariaDB (mysqldump)
RUN apt-get update && apt-get install -y mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN apt-get update && apt-get install -y mysql-client

# Exponer el puerto estándar de MariaDB
EXPOSE 3306

