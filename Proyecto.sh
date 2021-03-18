#!/bin/bash

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
     case $op in
         [1]* ) echo "Agregar información";
                agregarInformacion $2;
                break;;
         [2]* ) echo "Buscar";

                break;;
         [3]* ) echo "Eliminar información";

                break;;
         [4]* ) echo "Leer base de información";

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
  echo "[$concepto] .- $definicion" >> $file
}

buscar(){

}

eliminarInformación(){

}

leerBaseDeInfo(){

}

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
              menuInfo "X.P.";
              break;;
       [3]* ) echo "Kanban";
              menuInfo "Kanban";
              break;;
       [4]* ) echo "Crystal";
              menuInfo "Crystal";
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
             menuInfo "Cascada";
             break;;
      [2]* ) echo "Espiral";
             menuInfo "Espiral";
             break;;
      [3]* ) echo "Modelo V";
             menuInfo "Modelo V";
             break;;
      *) echo "Seleccione una opción de 1 a 3.";;
  esac
done
;;
* )
echo "¿No sabes leer?"
;;
esac

