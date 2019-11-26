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
# Variabeln

LOGFILE=admintool.log
LOGZEIT=`date`


#--------------------------------------------------------------------------
# Pruefung auf Adminrechte
# Start des Scriptes

function arechte() {
    clear
    rot "Prüfung auf Administrationsrechte"
    sleep 1
    if [ `/usr/bin/id -u` != "0" ]; then
        echo ""
        rot "Bitte mit sudo Rechten ausführen!"
        echo "$LOGZEIT - Tool ohne sudo Rechten gestartet" >> $LOGFILE
        exit 0
    else
        auswahlfenster
        echo "$LOGZEIT - Tool erfolgreich gestartet!" >> $LOGFILE
    fi
}

#--------------------------------------------------------------------------
# Auswahlfenster des Scriptes
# Hier werden die einzelnen Tools über eine Nummer ausgewählt

function auswahlfenster() {
    clear
    echo ""
    gelb "                     Version 1.1.2                            "
    echo ""
    rot "   /=========================================================\\    "
    rot "   |*  [1]     -       Einstellen der Zeitzone Berlin (MEZ) *|     "
    rot "   |*  [*]     -       Enter Taste zum Beenden              *|     "
    rot "   \\========================================================/     "

    read -p "Auswahl [1-XX]:" auswahl
    case "$auswahl" in
        1) zeitzoneyn
            ;;
        *) beenden
            ;;
    esac
}

#--------------------------------------------------------------------------
# Auswahl der Zeitzone Ja/Nein
# Wenn Ja function zeitzoney() Wenn Nein function auswahlfenster()
function zeitzoneyn() {
    echo ""
    rot "Soll Berlin (MEZ / CEST) als Zeitzone eingestellt werden?"
    read -p "Auswahl [y/n]:" auswahl
    case "$auswahl" in
        y) zeitzoney
            ;;
        n) auswahlfenster
            ;;
        *) echo "Ueberpruefe deine Eingabe!"
            ;;
    esac
}

# Einstellen der Zeitzone über einen Link zur Zeitzoneninfo
# Es wird ein Backup der localtime erstellt, falls etwas schief geht
function zeitzoney() {
    echo ""
    sudo mv /etc/localtime /etc/localtime.bak
    sudo ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    gruen "Die Zeitzone wurde eingestellt!"
    echo ""
    echo "Neues Datum:"
    date
    echo ""
    rot "Druecke eine beliebige Taste um zum Auswahlfenster zu wechseln"
    read -p "" auswahl
    case "$auswahl" in
        *) auswahlfenster
            ;;
    esac
}

#--------------------------------------------------------------------------

# Ausführung der Startfunktion arechte()
arechte
