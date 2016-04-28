#!/bin/bash
clear
echo "Introduce la extensión original de los archivos"
read extt
echo "Introduce el ancho de la nueva imagen"
read ancho
echo "Introduce el largo de la nueva imagen"
read largo

mkdir resultados

for i in *.$extt
do
	echo "Convirtiendo $i "
	convert "$i" -resize $ancho $largo "${i%.*}_.$extt"
	mv "${i%.*}_.$extt" resultados/
done
