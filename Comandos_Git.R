#########
## GIT ##
#########

# Iniciar un repositorio de Git en el directorio actual
git init

# Ver las ramas existentes
git branch

# Cambiar de rama
git checkout feature_nombre

# Crear una nueva rama
git branch feature_nombre

# Crear una nueva rama y cambiar a ella
git checkout -b feature_nombre

# Eliminar una rama localmente
git branch -d feature_nombre
# Eliminar una rama en GitLab
git push origin :feature_nombre

# Agregar/aceptar cambios para prepararlos para la confirmación
git add archivo # Agregar cambios de un archivo específico
git add . # Agregar todos los cambios al repositorio

# Descartar los cambios realizados en el área de trabajo
git restore archivo

# Guardar los cambios confirmados con un mensaje descriptivo
git commit -m "mensaje" # Mensaje descriptivo corto
git commit # Abre el editor predeterminado para ingresar un mensaje más detallado

# Subir los cambios de la rama actual a GitLab
git push --set-upstream origin feature_nombre

# Ver el registro de cambios realizados en el proyecto
git log

# Retroceder en el tiempo para volver al código antes de hacer el commit
git checkout codigo_commit

# Fusionar los cambios de una rama en la rama principal
git merge feature_nombre

# Guardar temporalmente los cambios realizados en la rama actual para aplicarlos más tarde en la rama de interés
git stash

# Salir del sistema de ayuda
Q

#######################
##COMANDOS PROHIBIDOS##
#######################
git push --force
git push -f
# Fuerzan actualización de rama, independientemente de que esté bien o mal