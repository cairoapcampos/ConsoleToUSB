#!/bin/bash

######################################################
# Script de acesso a console (ConsoleToUSB)          #
# Versão: 1.0 - 24/06/21                             #
# Autor: Cairo Ap. Campos                            #
######################################################

# Variaveis
findTerm=$(ls -l /dev/ttyUSB0 2> /dev/null | wc -l)
deviceTerm=$(ls /dev/ttyUSB0)
findPutty=$(which putty | wc -l)
findMinicom=$(which minicom | wc -l)

if [ $findTerm -eq 0 ]
then
   clear
    echo
    echo "O dispositivo /dev/ttyUSB0 não foi encontado! Ele está conectado ?"
    echo "Por favor conecte o cabo USB e execute o script novamente!"
    echo

else

clear
echo "O dispositivo USB foi encontrado em: $deviceTerm"
sleep 3
clear

    if [ $findPutty -eq 0 ]
    then
        echo
        echo "O pacote Putty não está instalado!"
        sleep 3
        echo
        echo "Instalando pacote... "
        sleep 3
        echo
        sudo apt update && sudo apt install -y putty
        clear
    fi

    if [ $findMinicom -eq 0 ]
    then
       echo
       echo "O pacote Minicom não está instalado!"
       sleep 3
       echo
       echo "Instalando pacote... "
       sleep 3
       echo
       sudo apt update && sudo apt install -y minicom
       clear
    fi

menu() {
	echo "######################"
        echo "### Acesso Serial ###"
        echo "#####################"
        echo "### 1 - Putty     ###"
        echo "### 2 - Minicom   ###"
        echo "### 0 - Sair      ###"
        echo "#####################"
        echo
        echo -n "Escolha uma das opções acima: "
        read opmenu
        case $opmenu in
             1) puttyInit ;;
             2) minicomInit ;;
             0) exit ;;
             *) echo
                echo "Opção Invalida! Retornando ao Menu..."
                sleep 3
                clear
                menu ;;
         esac
}

puttyInit() {
sudo chmod 666 /dev/ttyUSB0
echo -n "Digite a velocidade desejada (Ex: 9600, 38400, 115200): "
read puttySpeed
putty -serial $deviceTerm -sercfg $puttySpeed
}

minicomInit() {
echo -n "Digite a velocidade desejada (Ex: 9600, 38400, 115200): "
read minicomSpeed
minicom -D $deviceTerm  -b $minicomSpeed
}

menu
fi
