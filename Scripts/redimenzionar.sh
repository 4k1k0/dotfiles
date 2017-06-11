#!/bin/bash
clear

mensajes(){
    ok=true
    
	echo "Your files are jpg (j) or png (p)?"
	read format

	if ( [ $format == 'j' ] || [ $format == 'J' ] ); then
		format='jpg'
	elif ( [ $format == 'p' ] || [ $format == 'P' ] ); then
		format='png'
	else
		ok=false
	fi
	
    echo "What do you want to set: (w)idth or (h)eight ?"
    read set
    if ( [ $set == 'w' ] || [ $set == 'W' ] ); then
        set='W'
    elif ( [ $set == 'h' ] || [ $set == 'H' ] ); then
        set='H'
    else
        ok=false
    fi
    
    if [ "$ok" == true ]; then
        echo "Please enter a value "
        read pixel
        resize "!@"
    else
        error "!@"
    fi
}

resize(){
    if [ "$set" == 'W' ]; then
        for i in *.$format
        do
            echo "Resizing $i"
            convert "$i" -resize "$pixel"x "{$i%.*}_.$format"
        done
    elif [ "$set" == 'H' ]; then
        for i in *.$format
        do
            echo "Resizing $i"
            convert "$i" -resize x$pixel "{$i%.*}_.$format"
        done
    fi
}

error(){
    echo "Something went wrong"
}

mensajes "$@"
