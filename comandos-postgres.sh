
# cambiar usuario a postgres para usar terminal con psql
sudo -i -u postgres
# ingresar consola postres sin cambiar de usuario
sudo -u postgres psql
#ingesar  base datos
psql -U postgres
psql -U "user" -W -h "host" "database"

\l #lista base datos

CREATE DATABASE basename;
DROP DATABASE basename;

#usuarios conectados base de datos
SELECT COUNT(*) AS users_online FROM pg_stat_activity WHERE datname='test_fail_over';

#eliminar conexiones base de datos
SELECT pg_terminate_backend(procpid) FROM pg_stat_activity WHERE datname = 'test_fail_over';

#ver columnas de una tabla
\d "tabla_nombre"

El equivalente de SHOW TABLES es
basename=# \d

El equivalente de SHOW DATABASES es
basename=# \l

El equivalente de SHOW COLUMNS es
basename=# \d table

El equivalente de DESCRIBE TABLE es
basename=# \dt table

#crear backup windows en ruta "Postgres carpeta instalacion"/bin
pg_dump.exe -h localhost -p 5432 -U postgres -F c -v -d NOMBRE_BD -f RUTA
#crear backup linux
pg_dump -h localhost -p 5432 -U postgres -F c -v -d NOMBRE_BD -f RUTA
#respaldar y restaurar en otra maquina
pg_dump -d db_name | psql -h host_name -d db_name
#respaldo de solo esquema
pg_dump -h localhost -p 5432 -U postgres -s -v -d NOMBRE_BD -f RUTA
#respaldo de solo data
pg_dump -h localhost -p 5432 -U postgres -a -v -d NOMBRE_BD -f RUTA
#respaldo de solo data con inserts en vez de copy
pg_dump -h localhost -p 5432 -U postgres -a --inserts -v -d NOMBRE_BD -f RUTA
#respaldo y restauracion desde local a remoto :D
$ pg_dump -d db_name | psql -h host_name -d db_name

