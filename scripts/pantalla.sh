#!/bin/bash
clear

mensajes(){
    ok=true
    
    echo "¿Quieres apagar la pantalla de la laptop? Sí (s) No (n) "
    read aP

    if ( [ $aP == 's' ] || [ $aP == 'S' ] ); then
        aP='S'
    elif ( [ $aP == 'n' ] || [ $aP == 'N' ] ); then
        aP='N'
    else
        ok=false
    fi
    
    echo "¿Qué salida de video quieres usar? HDMI (h) VGA (v) "
    read sV
    
    if ( [ $sV == 'h' ] || [ $sV == 'H' ] ); then
        sV='H'
    elif ( [ $sV == 'v' ] || [ $sV == 'V' ] ); then
        sV='V'
    else
        ok=false
    fi
    
    if [ "$ok" == true ]; then
        apagar "!@"
    else
        error "!@"
    fi
}

apagar(){
    if [ $aP == 'S' ]; then
        xrandr --output LVDS1 --off
        if ( [ $sV == 'H' ] ); then
            xrandr --output HDMI1 --auto --primary
        elif ( [ $sV == 'V' ] ); then
            xrandr --output VGA1 --auto --primary
        fi
    elif [ $aP == 'N' ]; then
        if ( [ $sV == 'H' ] ); then
            xrandr --output HDMI1 --auto --right-of LVDS1
        elif ( [ $sV == 'V' ] ); then
            xrandr --output VGA1 --auto --right-of LVDS1
        fi
    fi
}

error(){
    clear
    echo "¿Quieres apagar la pantalla de la laptop? Sí (s) No (n)"
    if ( [ $aP != 'S' ] && [ $aP != 'N' ] ); then
        echo "==> $aP"
    else
        echo "$aP"
    fi
    
    echo "¿Qué salida de video quieres usar? HDMI (h) VGA (v) "
    if ( [ $sV != 'H' ] && [ $sV != 'V' ] ); then
        echo "==> $sV"
    else
        echo "$sV"
    fi
    echo ""
    echo "ERROR: Alguna de las opciones es incorrecta."
}

mensajes "$@"
