#!/bin/bash

# Administrationshilfe Linux Ubuntu
# Name: Fabian Siebels
# Datum: 26.11.2019
# Version: 0.1

#   Funktionen
# - Anzeige Betriebssystem


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

