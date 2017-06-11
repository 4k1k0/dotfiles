#!/bin/bash
clear
echo "Introduce la extensión original de los archivos"
read extt
echo "Introduce la nueva extension de los archivos"
read extnueva

mkdir resultados

for i in *.$extt
do
    echo "Convirtiendo $i a ${i%.*}.$extnueva"
    convert "$i" "${i%.*}.$extnueva"
    mv "${i%.*}.$extnueva" resultados/
done
