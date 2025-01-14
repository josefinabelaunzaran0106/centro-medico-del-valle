
//incluye todos los plugins, temas y configuraciones a la carpeta wp-content
docker cp wordpress-container-consultorio:/var/www/html/wp-content ./wp-content

//Exporta la base de datos 
docker exec mariadb-container-consultorio mysqldump -u wordpress_user -p wordpress_password wordpress > ./db-conultorio-dump.sql 

