#!/bin/bash

# SCRIPT BASE EJECUCION CON ARGUMENTOS CON NOMBRES

# ---- parametros ejemplos ---
HOST="por-defecto"
BASEDATOS="por-defecto"
USUARIO_BASEDATOS="por-defecto"
CLAVE_BASEDATOS="por-defecto"

# Mientras el número de argumentos NO SEA 0
while [ $# -ne 0 ]
do
    case "$1" in
    -h|--host)
        HOST="$2"
        shift
        ;;
    -b|--basedatos)
        BASEDATOS="$2"
        shift
        ;;
    -u|--usuario)
        USUARIO_BASEDATOS="$2"
        shift
        ;;
    -c|--clave)
        CLAVE_BASEDATOS="$2"
        shift
        ;;
    *)
        echo "Argumento no válido"
        
        ;;
    esac
    shift
done
echo " ---- parametros ingresados ----"
echo "host		:$HOST"
echo "base datos	:$BASEDATOS"
echo "usuario basedatos	:$USUARIO_BASEDATOS"
echo "clave basedatos	:$CLAVE_BASEDATOS"

exit
