#!/bin/bash

clear

ls -d */

echo "Elige el directorio del cual hacer el backup (sin incluir el /)"
read directorio

tar -zcvf ${directorio}_$(date +%F).tar.gz $directorio

