#!/bin/bash
clear
echo "Introduce la extensión de los archivos"
read extt
echo "Introduce un nombre para el renombrado e.g. 'Foto'"
read nombre
echo "Introduce un valor para empezar con el renombrado e.g. '10'"
read valor

for i in *.$extt
do 
	mv "$i" `echo "$i" | tr ' ' '_'`;
done

for fichero in `ls *.$extt`
do
	mv $fichero $nombre$valor.$extt
	let valor++
done
 
echo "Ficheros renombrados:"
 
for fichero in `ls *.$extt`
do
	echo $fichero
done
