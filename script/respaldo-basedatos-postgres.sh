#!/bin/bash
# autor: benjamin

if [ $# -eq 0 -o $# -eq 1 ]; then
 echo "-------no ha ingresado los parametros necesarios-------"
 echo "====== parametros disponibles ======="
 echo "1. --host : hostname de la base de datos a respaldar, parametro abreviado -h"
 echo "2. --basedatos : nombre de la base de datos a respaldar, parametro abreviado -b"
 echo "3. --usa-fecha : indica si los script sql de respaldo tendran una fecha en su nombre parametro abreviado -f true"
 #echo "4. --help : muestra la ayuda del script"
 echo "====================================="
 echo "Ejemplo 1: sh respaldar-basedatos.sh --host localhost --basedatos basedatos_nitida --usa-fecha true"
 echo "Ejemplo 2: sh respaldar-basedatos.sh -h localhost -b basedatos_nitida -f true"
 #echo "Ejemplo 3: sh respaldar-basedatos.sh --help"
 exit
fi

#nombre de parametro que se seteara
PARAM="none"
for x in $* 
do
 if [ $PARAM = 'hostname' ]; then
  HOST=$x
  PARAM="none"
  continue
 fi
 if [ $PARAM = 'basedatos' ]; then
  BASEDATOS=$x
  PARAM="none"
  continue
 fi
 if [ $PARAM = 'usa-fecha' ]; then
  USA_FECHA=$x
  PARAM="none"
  continue
 fi
 if [ $x = '-h' -o $x = '--host' ]; then
  PARAM="hostname"
  echo "parametro a capturar=$PARAM"
  continue
 fi
 if [ $x = '-b' -o $x = '--basedatos'  ]; then
  PARAM="basedatos"
  echo "parametro a capturar=$PARAM"
  continue
 fi
 if [ $x = '-f'  -o $x = '--usa-fecha' ]; then
  PARAM="usa-fecha"
  echo "parametro a capturar=$PARAM"
  continue
 fi
done

FECHA=$(date +'%Y-%m-%d');

echo "1. Fecha de respaldo: $USA_FECHA"
echo "2. Host             : $HOST"
echo "3. Base de datos    : $BASEDATOS"

if [ $USA_FECHA = "false" ]; then
 FECHA=""
fi
#definiendo nombre de respaldos
NOMBRE_ESQUEMA=respaldo-esquema-cckall-$FECHA.sql
NOMBRE_DATA=respaldo-data-cckall-$FECHA.sqL
# respaldar esquema
pg_dump -h $HOST -p 5432 -U postgres -s -v -d $BASEDATOS -f $NOMBRE_ESQUEMA
# respaldar data
pg_dump -h $HOST -p 5432 -U postgres -a --inserts -v -d $BASEDATOS -f $NOMBRE_DATA




