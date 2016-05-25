#!/bin/bash
clear

mkdir unix/

for i in *.cpp
do
	echo "Compilando $i a ${i%.*}.out"
	g++ "$i" -o "${i%.*}.out"
	mv "${i%.*}.out" unix/
	let contador++
done

printf "\nSe compilaron $contador archivos cpp\n"
