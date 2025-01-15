# Proyecto Dockerizado de WordPress con MariaDB - "CENTRO MÉDICO DEL VALLE"

Este proyecto contiene un entorno de desarrollo local para un sitio de WordPress, completamente configurado con Docker. Incluye la base de datos MariaDB, los plugins y configuraciones necesarias.

---

## Estructura del Proyecto

```
project/
├── docker-compose.yml  # Configuración de Docker
├── wp-content/         # Plugins, temas y contenido subido de WordPress
├── db-dump.sql         # Volcado de la base de datos para restaurar configuraciones
├── .gitignore          # Archivos a excluir de Git
```

- **`docker-compose.yml`**: Define los servicios de WordPress y MariaDB.
- **`wp-content/`**: Contiene los plugins, temas y archivos subidos.
- **`db-dump.sql`**: Copia de la base de datos exportada.
- **`.gitignore`**: Asegura que no se suban archivos innecesarios al repositorio.

---

## Requisitos

- Docker
- Docker Compose
- Git

---

## Instalación y Configuración

### 1. Clonar el Repositorio
```bash
git clone https://github.com/josefinabelaunzaran0106/centro-medico-del-valle.git
cd project
```

### 2. Levantar los Contenedores
Ejecuta el siguiente comando para iniciar el entorno Docker:
```bash
docker-compose up -d --build
```

- El sitio de WordPress estará disponible en: [http://localhost:8083](http://localhost:8080)
- La base de datos MariaDB estará disponible en el puerto `3308`.

### 3. Restaurar la Base de Datos
Importa la base de datos desde el archivo `db-dump.sql`:
```bash
docker exec -i mariadb-container-consultorio mysql -u wordpress_user -pwordpress_password wordpress_db < db-consultorio-dump.sql

```

---

## Personalización

### Plugins y Temas
- Los plugins y temas se encuentran en la carpeta `wp-content/`. Puedes añadir nuevos plugins o temas simplemente copiándolos en las subcarpetas correspondientes.

### Configuración Adicional
- Si necesitas modificar el archivo de configuración de WordPress (`wp-config.php`), puedes encontrarlo en la raíz del contenedor WordPress.

---

## Archivos Excluidos

El archivo `.gitignore` asegura que no se suban al repositorio:

- Datos persistentes de MariaDB:
  ```
  mysql-data/
  ```
- Archivos grandes como los uploads de WordPress:
  ```
  wp-content/uploads/
  ```
- Archivos de configuración sensibles como variables de entorno:
  ```
  .env
  ```

---

## Troubleshooting

### Problema: "El sitio no carga correctamente"
1. Verifica que los contenedores estén corriendo:
   ```bash
   docker ps
   ```
2. Asegúrate de que no haya conflictos de puertos en `docker-compose.yml`.

### Problema: "Error al conectar con la base de datos"
- Verifica las credenciales en el archivo `docker-compose.yml` y en `wp-config.php`.
- Asegúrate de haber restaurado la base de datos correctamente.

---

## Colaboradores
Cualquier miembro del equipo puede clonar el repositorio, levantar los contenedores y comenzar a trabajar con la misma configuración. Si realizas cambios, asegúrate de seguir estos pasos:

Actualizar la Carpeta wp-content/

1. Realiza tus cambios en el entorno local (por ejemplo, instala nuevos plugins o modifica temas).

2. Copia la carpeta wp-content/ desde el contenedor a tu máquina local:
   ```bash
    docker cp wordpress-container-consultorio:/var/www/html/wp-content ./wp-content
   ```

4. Añade los cambios al repositorio:
 ```bash
    git add wp-content/
    git commit -m "Actualización de wp-content"
    git push origin main
```

Actualizar el Archivo db-dump.sql

1. Exporta la base de datos actualizada desde el contenedor:
   ```bash
    docker exec mariadb-container-consultorio mysqldump --column-statistics=0 -u wordpress_user -pwordpress_password wordpress_db > ./db-consultorio-dump.sql
   ```
3. Añade el archivo al repositorio:
   ```bash
    git add db-dump.sql
    git commit -m "Actualización de la base de datos"
    git push origin main

    ```

De esta manera, los cambios realizados en los plugins, temas o contenido del sitio estarán disponibles para todos los colaboradores.

---


