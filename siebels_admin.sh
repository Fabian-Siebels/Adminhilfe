#!/bin/bash

# Administrationshilfe Linux Ubuntu
# Name: Fabian Siebels
# Datum: 26.11.2019
# Version: 0.1

#   Funktionen
# - Aendern der Zeitzone


# Farbendeklaration
function gruen() {
  echo -e "\\033[32;1m${*}\\033[0m"
}

function magenta() {
  echo -e "\\033[35;1m${*}\\033[0m"
}

function cyan() {
  echo -e "\\033[36;1m${*}\\033[0m"
}

function rot() {
  echo -e "\\033[31;1m${*}\\033[0m"
}

function gelb() {
  echo -e "\\033[33;1m${*}\\033[0m"
}

#--------------------------------------------------------------------------
# Auswahl der Zeitzone Ja/Nein
# Wenn Ja function zeitzoney() Wenn Nein function auswahlfenster()
function zeitzoneyn() {
    echo ""
    rot "Soll Berlin (MEZ / CEST) als Zeitzone eingestellt werden?"
    read -p "Auswahl [y/n]:" auswahl
    case "$auswahl" in
        y) ja
            ;;
        n) auswahlfenster
            ;;
        *) echo "Ueberpruefe deine Eingabe!"
            ;;
    esac
}

# Einstellen der Zeitzone über einen Link zur Zeitzoneninfo
# Es wird ein Backup der localtime erstellt, falls etwas schiefgeht
function zeitzoney() {
    echo ""
    sudo mv /etc/localtime /etc/localtime.bak
    sudo ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    gruen "Die Zeitzone wurde eingestellt!"
    date
    rot "Druecke eine beliebige Taste um zum Auswahlfenster zu wechseln"
    read -p "" auswahl
    case "$auswahl" in
        *) auswahlfenster
            ;;
    esac
}

#--------------------------------------------------------------------------

