#!/bin/bash
#30/03/2022

removego () {
rm -rf /usr/local/go
rm -rf $HOME/go
killall go 1> /dev/null 2> /dev/null
}

#funtion
goinst () {
tput clear
echo
echo -e "\e[1;33m   INSTALADOR GO Lang (Multi Protocolo) \e[0m"
echo
echo -e "\e[1;31m A continuacion se instalara el paquete GO Lang\n Que es Base de Varios Protocolos...\e[0m"
echo -e "\e[1;33m Continuar?\e[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p " [S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "\e[1;32m Instalando...\e[0m"
cd
rm -rf /usr/local/go 1> /dev/null 2> /dev/null
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz 1> /dev/null 2> /dev/null
tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
if cat /root/.bashrc | grep GOROOT; then
echo -e "\e[1;31m Ya existe un GoROOT - Skipping\e[0m"
else
sed -i '$a export GOROOT=/usr/local/go' /root/.bashrc
sed -i '$a export GOPATH=$HOME/go' /root/.bashrc
sed -i '$a export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' /root/.bashrc
rm go1.15.linux-amd64.tar.gz
source /root/.bashrc
fi
sleep 3
echo -e "\e[1;32m Reiniciando Fonte do Terminal...\e[0m"
fi
echo -e "\033[1;33m Para finalizar o processo de Instalacion de GO escribe :\033[0m"
echo -e "\033[1;32m source ~/.profile\033[0m"
}

gomenu () {
tput clear
echo -e "\033[1;33m     PACK GO Lang INSTALLER | \e[1;33 \e[0m"
echo -e
echo -e "\033[1;32m  [1] \e[1;33mINSTALAR PACK GO Lang \033[0m"
echo -e "\033[1;32m  [2] \e[1;33mDESINSTALAR GO Lang \033[0m"
echo -e "\033[1;33m ▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎▪︎\e\033[0m"
echo -e "\033[1;32m  [0] \e[1;31m SAIR \033[0m"
echo -e
read -p "ESCOLHA UMA OPÇÃO: " opcion
case $opcion in
0)exit;;
1)goinst;;
2)removego;;
*)echo -e "\e[1;31m\n ESCOLHA UMA OPÇÃO VALIDA...!!!\e[0m"
sleep 1
gomenu;;
esac
}
gomenu
