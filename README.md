
//incluye todos los plugins, temas y configuraciones a la carpeta wp-content
docker cp wordpress-container-consultorio:/var/www/html/wp-content ./wp-content

//Exporta la base de datos 
docker exec mariadb-container-consultorio mysqldump -u wordpress_user -p wordpress_password wordpress > ./db-conultorio-dump.sql 

//Pasos a seguir:
1. git clone https://github.com/josefinabelaunzaran0106/centro-medico-del-valle.git
2. docker-compose up -d
3. docker exec -i mariadb-container-consultorio mysql -u wordpress_user -p wordpress_password wordpress < db-consultorio-dump.sql


