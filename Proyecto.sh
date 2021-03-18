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
    echo "Usted esta en la sección $1, seleccione la opción que desea utilizar."
    echo "1. Agregar información";
    echo "2. Buscar";
    echo "3. Eliminar información";
    echo "4. Leer base de información"
    while true; do
        read -p"Ingrese la acción que desea realizar: " opInfo
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
        *) echo "Seleccione una Opción de 1 a 4.";;
        esac
  done
}

agregarInformacion(){
    file="$1"
    echo $file
    if [ ! -f "$file" ]
    then
      touch $file
    fi
    read -p "Concepto: " concepto
    read -p "Definición: " definicion
    echo -e "[$concepto] .- $definicion \n" >> $file
}

buscar(){
    echo "Buscar";
}

eliminarInformación(){
    echo "Eliminar";
}

leerBaseDeInfo(){
    echo "Leer";
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
       *) echo "Seleccione una Opción de 1 a 4.";;
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
             menuInfo "Modelo V" "./Archivos/Tradicionales/scrum.inf";
             break;;
      *) echo "Seleccione una opción de 1 a 3.";;
  esac
done
;;
* )
echo "¿No sabes leer?"
;;
esac
