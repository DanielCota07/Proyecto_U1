#!/bin/bash

init(){
    mkdir -p "Archivos/Agile";
    mkdir -p "Archivos/Tradicionales";
}

menuAgile(){
    echo "Bienvenido a la guia rapido de Agile, para continuar seleccione un tema: "
    echo "1. SCRUM";
    echo "2. X.P.";
    echo "3. Kanban";
    echo "4. Crystal"
}

menuTradicionales(){
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
    echo "1. Cascada";
    echo "2. Espiral";
    echo "3. Modelo V";
}

menuInfo(){
    salir=0
    while [ $salir -ne 1 ]; do
      clear
      echo "Usted esta en la sección $1, seleccione la opción que desea utilizar."
      echo "1. Agregar información";
      echo "2. Buscar";
      echo "3. Eliminar información";
      echo "4. Leer base de información";
        while true; do
            read -p "Ingrese la acción que desea realizar: " opInfo
            case $opInfo in
            [1]* ) echo "Agregar información";
                agregarInformacion "$2";
                break;;
            [2]* ) echo "Buscar";
                buscar "$2";
                break;;
            [3]* ) echo "Eliminar información";
                eliminarInformación "$2";
                break;;
            [4]* ) echo "Leer base de información";
                leerBaseDeInfo "$2";
                break;;
            *) echo -e "\nSeleccione una Opción de 1 a 4." ;;
            esac
        done
        clear;
        echo "Seleccione la opción que desea."
        echo "0. Regresar al menú anterior";
        echo "1. Salir de la aplicación";
        while true; do
            read -p "Ingrese la acción que desea realizar: " salir
            case $salir in
            [0]* ) break;;
            [1]* ) break;;
            *) echo "Seleccione una opción válida.";;
            esac
        done
  done
}

agregarInformacion(){
    echo -e "\nAgregar Información";
    file="$1"
    #echo $file
    if [ ! -f "$file" ]
    then
      touch $file
    fi
    read -p "Concepto: " concepto
    read -p "Definición: " definicion
    echo -e "[$concepto] .- $definicion \n" >> $file
}

buscar(){
    echo -e "\nBuscar"
}

eliminarInformación(){
    echo -e "\nEliminar";
    read -p "Ingrese el concepto que desea eliminar: " concepto
    sed -i "/$concepto/, +1 d" $1
}

leerBaseDeInfo(){
    file="$1";
    if [[ -f "$file" ]]
    then
        while IFS= read -r line
        do
            echo "$line";
        done < "$file"
    else
        echo -e "\nNo existe información sobre este tema"
    fi
    read -p "Ingrese cualquier tecla para salir: "
}

init

case $1 in
-a )
menuAgile;
while true; do
  read -p"Ingrese la opcion que desea: " op
   case $op in
       [1]* ) echo "SCRUM";
              menuInfo "SCRUM" "./Archivos/Agile/scrum.inf";
              break;;
       [2]* ) echo "X.P.";
              menuInfo "X.P." "./Archivos/Agile/xp.inf";
              break;;
       [3]* ) echo "Kanban";
              menuInfo "Kanban" "./Archivos/Agile/kanban.inf";
              break;;
       [4]* ) echo "Crystal";
              menuInfo "Crystal" "./Archivos/Agile/crystal.inf";
              break;;
       *) echo -e "\nSeleccione una Opción de 1 a 4." ;;
   esac
done
;;
-t )
menuTradicionales;
while true; do
  read -p "Seleccione una opcion:" opc
  case $opc in
      [1]* ) echo "Cascada";
             menuInfo "Cascada" "./Archivos/Tradicionales/cascada.inf";
             break;;
      [2]* ) echo "Espiral";
             menuInfo "Espiral" "./Archivos/Tradicionales/espiral.inf";
             break;;
      [3]* ) echo "Modelo V";
             menuInfo "Modelo V" "./Archivos/Tradicionales/modelov.inf";
             break;;
      *) echo -e "\nSeleccione una opción de 1 a 3.";;
  esac
done
;;
* )
echo "¿No sabes leer?"
;;
esac
