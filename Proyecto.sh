      #!/bin/bash

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
        	[1]* ) echo "SCRUM"; break;;
        	[2]* ) echo "X.P."; break;;
        	[3]* ) echo "Kanban"; break;;
        	[4]* ) echo "Crystal"; break;;
        	*) echo "Seleccione una Opción de 1 a 4.";;
    esac
done
          ;;
        -t )
        echo "Bienvenido a la guia rapido de Metodologia tradicionales, para continuar seleccione un tema: "
          ;;
        * )
        echo "No entiendo lo que me dices"
          ;;
esac
