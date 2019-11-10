# ------------ SYSTEMA ------------------
# version ubuntu linux
lsb_release -a
#copiar archivo local a remoto ssh
scp /ruta/al/archivo-origen usuario@ordenador:/ruta/al/directorio-destino/
#copiar archivo remoto a local
scp usuario@ordenador:/ruta/al/archivo-origen /ruta/al/directorio-destino
#crea un archivo con un peso especifico
fallocate -l 10M /opt/file-example
#ver peso de archivos
du -sh *

# ----------- PYTHON --------------------
# crear ambiente virtual python
python3 -m venv $DIRECTORIO_VIRTUAL_PYTHON
source $DIRECTORIO_VIRTUAL_PYTHON/bin/activate

