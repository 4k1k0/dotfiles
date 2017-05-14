#!/bin/bash
clear

ok=true
    
printf "¿Qué tipo de archivos deseas borrar?\n."
read ext
ls -d */
echo "¿De qué directorio? (Sin incluir / )"
read dir
echo "¿Deseas eliminar los archivos .$ext del directorio $dir/? (s)i (n)o"
read confirmar
if ( [ $confirmar == 's' ] || [ $confirmar == 'S' ] ); then
    find $dir -name '*.'$ext -exec rm -r {} \;
    echo "Se eliminaron todos los archivos .$ext del directorio $dir/"
elif ( [ $confirmar == 'n' ] || [ $confirmar == 'N' ] ); then
    echo "No se ha eliminado ningún archivo .$ext del directorio $dir/"
else
    echo "Error"
fi
