#!/bin/bash
clear

echo "¿Qué tipo de archivos deseas borrar?"
read ext
echo "¿De qué directorio?"
read dir

echo "¿Deseas eliminar los archivos .$ext del directorio $dir/?"
read confirmar

if [ $confirmar == 's' ]; then
	find $dir -name '*.'$ext -exec rm -r {} \;
	echo "Se eliminaron todos los archivos .$ext del directorio $dir/"
elif [ "$confirmar" == 'n' ]; then
	echo "No se ha eliminado ningún archivo .$ext del directorio $dir/"
else
	echo "Error"
fi
