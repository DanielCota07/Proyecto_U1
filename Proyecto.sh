#!/bin/bash

case $1 in
        -a )
        echo "Menú Agile"
          ;;
        -t )
        echo "Menú Tradicionales"
          ;;
        * )
        echo "No entiendo lo que me dices"
          ;;
esac
