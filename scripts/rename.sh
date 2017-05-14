#!/bin/bash
clear
echo "Introduce la extensión de los archivos"
read extt
echo "Introduce un nombre para el renombrado e.g. 'Foto'"
read nombre

for i in *.$extt
do 
    mv "$i" `echo "$i" | tr ' ' '_'`;
done

for fichero in `ls *.$extt`
do
    let v++
    mv $fichero ___$v.$extt
done

for fichero in `ls *.$extt`
do
    let valor++
    mv $fichero "${nombre%}_$valor.$extt"
done
