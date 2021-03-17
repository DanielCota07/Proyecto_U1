      #!/bin/bash

agregarInformacion(){
    file="$1"
    echo $file
    if [ ! -f "$file" ]
    then
        touch $file
    fi
    read -p "Concepto: " concepto
    read -p "Definición: " definicion
    echo "[$concepto] .- $definicion" >> $file
}

case $1 in
    -a )
    echo "Bienvenido a la guia rapido de Agile, para continuar seleccione un tema: "
    echo "1. SCRUM";
    echo "2. X.P.";
    echo "3. Kanban";
    echo "4. Crystal"
    while true; do
        read -p"Ingrese la opcion que desea: " op
    	   case $op in
             [1]* ) echo "SCRUM";
                    agregarInformacion "./scrum.inf";
                    break;;
        	   [2]* ) echo "X.P."; break;;
        	   [3]* ) echo "Kanban"; break;;
        	   [4]* ) echo "Crystal"; break;;
        	   *) echo "Seleccione una Opción de 1 a 4.";;
         esac
    done
    ;;
    -t )
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
    echo "1. Cascada";
    echo "2. Espiral";
    echo "3. Modelo V";
    while true; do
        read -p "Seleccione una opcion:" opc
        case $opc in
            [1]* ) echo "Cascada"; break;;
            [2]* ) echo "Espiral"; break;;
            [3]* ) echo "Modelo V"; break;;
            *) echo "Seleccione una opción de 1 a 3.";;
        esac
    done
    ;;
    * )
    echo "No entiendo lo que me dices"
    ;;
esac
