#actualizar branch remotos
git remote update origin --prune

#todas las ramas incluidas las remotas
git branch -a

#agregar rama remota
git checkout -b nombre_rama origin/rama_remota

#corregir ultimo commit
git commit -m 'Mensaje corregido' --amend

#ver los commmits realizados 
git log
#ver los commits en una linea identificador y mensaje
git log --oneline

#guardar cambios sin hacer commit util para funcionalidades que interumpen un ttabajo en branch
git stash save "nombre_stash"

#guardar en stash
git stash

#listar stash 
git stash list

#volver a stash mas reciente
git stash apply

#volver a determinado stash
git stash apply stash@{<numero de stash>}

#renombrar branch local
git branch -m <nombre-rama> <nombre-rama-nueva>

#renombrar branch remoto
git push origin :nombre-rama

#guardar credenciales
git config --global credencial.helper store

#actualizar .gitignore
# rm remover archivos chacheados que no se quieren en el repositorio
git rm -r --cached .
# add all files as per new .gitignore
git add .
# now, commit for new .gitignore to apply
git commit -m ".gitignore is now working"

#eliminar origin remote
git remote rm <nombre_origin>

#renombrar un remoto
git remote rename origin origin_nuevo_nombre

#volver a un archivo especifico
git checkout <commit o branch> <ruta archivo>

#última versión que hiciste commit
git checkout HEAD path/to/file

# Deshacer el último commit (dejándolo como estaba con los archivos añadidos y demás)
git reset --soft HEAD^
