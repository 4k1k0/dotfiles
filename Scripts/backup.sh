#!/bin/bash

clear

mensajes(){
    echo "¿Deseas respaldar todos los sitios? Sí (s) No (n)"
    read todo

    if ( [ $todo == 's' ] || [ $todo == 'S' ] ); then
        todo='S'
    elif ( [ $todo == 'n' ] || [ $todo == 'N' ] ); then
        todo='N'
    else
        error "!@"
    fi

    backup "!@"
}

backup(){
    if [ $todo == 'S' ]; then
        for i in *; do
            if [ -d "${i}" ]; then
                tar -zcvf ${i}_$(date +%F).tar.gz $i 
            fi
        done
    else
        ls -d */
        echo "Selecciona un directorio del cual hacer respaldo (Sin incluir / )"
        read directorio
        tar -zcvf ${directorio}_$(date +%F).tar.gz $directorio
        echo "¿Deseas continuar respaldando sitios? Sí (s) No (n)"
        read continuar

        if ( [ $continuar == 's' ] || [ $continuar == 'S' ] ); then
            continuar='S'
            directorio=''
        elif ( [ $continuar == 'n' ] || [ $continuar == 'N' ] ); then
            exit
        else
            error "!@"
        fi

        if [ $continuar == 'S' ]; then
            backup "!@"
        fi
    fi
}

error(){
    echo "Comando equivocado. Ejecuta de nuevo el script"
    exit
}

mensajes "!@"
