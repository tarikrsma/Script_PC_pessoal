#!/bin/bash
#####################################################################################
#
# Autor: Tarik Mapelli
# 
# e-mail: tarik_mapelli@hotmail.com
#
# Data de criacao: 12/09/2016
#
# Script: Tudo_para_um_PC_Pessoal.sh
# Descricao: Instalacao das configuracoes de um PC pessoal, inclui:
#            - Chromium
#            - GitHub
#            - Spotify
#            - Skype
#            - VIM
#            - Wine
#            - PlayOnLinux
#            - Gedit
#            - upgrade
#            - Reinicia o PC ao final do processo
#####################################################################################

sudo su
clear
echo ""
echo ""
read -p 'Digite seu nome de usuario (como esta em /home diferenciando minusculo e maiusculo): ' USER
echo ""
echo "Executando o dpkg-reconfigure locales"
echo "Basta aceita as opcoes PT_BR"
sleep 5
dpkg-reconfigure locales
echo ""
echo ""
echo ""

USUARIO="$USER"
HOME_USER="/home/$USUARIO"
TXT="Lembrete_para_$USUARIO.txt"

echo ""
echo "Bem vindo $USUARIO"
echo ""
echo ""
echo ""
echo ""
echo ""
sleep 2
echo ""
echo "Um arquivo chamado $TXT sera gerado no final deste script em $HOME_USER/"
echo ""
echo "Lembre-se: Ao final do processo o Computador sera reiniciado, se tem algum trabalho não salvo pressione CTRL+C"
read -p 'Caso contrario é só pressionar qualquer tecla...'
echo ""
echo "Tempo de execucao e de no minimo 20 minutos, podendo variar drasticamente"
sleep 2
echo "em 5 segundos..."
echo ""
sleep 5
echo ""
echo "============Instalando as configurações necessarias para um PC pessoal============"
echo ""
date
echo ""
sudo apt-get update
echo ""
sudo apt-get install pv -y
echo ""
#####################################################################################
echo "------- Instalando o git (GitHub) --------"
echo ""
sudo apt-get install git -y
echo ""

#####################################################################################
echo "------- Instalando o Chromium --------"
echo ""

sudo apt-get install chromium-browser -y

echo ""
echo "*Instalando as dependencias para PT_BR*"
echo ""

sudo apt-get install chromium-browser-l10n -y

echo ""
#####################################################################################
echo "------- Instalando o Spotify ---------"
echo ""
# Instalando a versao estavel do programa, adicionando o repositorio
echo "*Adicionando repositorio*"
echo ""

sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/spotify.list"

echo ""
#Instalando a chave do repositorio
echo "*Instalando chave do repositorio*"
echo ""

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886

echo ""
echo "*Atualizando o APT*"

sudo apt-get update

echo ""
#Instalando o Programa
echo "*Instalando o programa (Spotify)*"

sudo apt-get install spotify-client -y

echo ""
#####################################################################################
echo ""
echo "------- Instalando o Skype ---------"
echo ""
sudo apt-get install skype -y
echo ""

#####################################################################################
echo ""
echo "------- Instalando o VIM ---------"
echo ""

sudo apt-get install vim -y

echo ""
#Configurando o VIM para usar 4 espacos ao inves de tab real (BOTAO [TAB])
echo "*Configurando o VIM*"
echo ""
echo ":set tabstop=4 softtabstop=4 shiftwidth=4 expandtab" > $HOME_USER/.vimrc
echo ""
#####################################################################################
echo ""
echo "------- Instalando o Wine e PlayOnLinux ---------"
echo ""
#Inserindo o Repositorio para caso nao ter
echo "*Inserindo o repositorio dos programas*"
echo ""

sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo add-apt-repository ppa:noobslab/apps

echo ""
echo "*Atualizando o APT*"
echo ""

sudo apt-get update

echo ""
#Instalando enfim os programas
echo "*Instalando o Wine*"
echo ""
sudo apt-get install wine winetricks -y
echo ""
echo "*Instalando o PlayOnLinux*"
echo ""
sudo apt-get install playonlinux -y
echo ""
#####################################################################################
echo ""
echo "------- Instalando o Gedit ---------"
echo ""
sudo apt-get install gedit -y
echo ""
echo ""
echo "Fim da Instalacao, dando upgrade e update"
echo ""
sudo apt-get update
echo ""
sudo apt-get upgrade -y
echo ""
echo ""
echo "Lembre-se de instalar os plug-ins do Gedit" > $HOME_USER/$TXT
echo "" >> $HOME_USER/$TXT
echo "Este script foi executado em um Mint 18" >> $HOME_USER/$TXT
echo "Qualquer duvida ou sujestao mande um email para tarik_mapelli@hotmail.com" >> $HOME_USER/$TXT
echo ""
echo "Seu Computador estara pronto em poucos segundos"
echo ""
sleep 4
echo ""
echo "========================= FIM DA INSTALACAO ========================="
echo ""
echo ""
echo "Parabens $USUARIO depois de reiniciado seu PC estara pronto =D"
echo ""
echo "Qualquer duvida ou sujestao mande um email para tarik_mapelli@hotmail.com"
echo ""
echo "Nao esqueca de verificar seu $TXT em $HOME_USER/"
echo ""
echo "-------- Reiniciando o PC --------"
sleep 15
echo ""
echo ""
sleep 1
echo "5"
sleep 2
echo "4"
sleep 2
echo "3"
sleep 2
echo "2"
sleep 2
echo "1"
sleep 2
reboot

