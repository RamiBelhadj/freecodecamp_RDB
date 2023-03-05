#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  ELEMENT_ARG=$1
  #search by atomic_number
  if [[ $ELEMENT_ARG =~ ^[0-9]+$ ]]
  then
    FOUND_ELEMENT_ATOMIC_NUM=$($PSQL "SELECT * FROM elements WHERE atomic_number = $ELEMENT_ARG")
  fi
  #if not atomic_number
  if [[ -z $FOUND_ELEMENT_ATOMIC_NUM ]]
  then
    #search by symbol
    FOUND_ELEMENT_SYMBOL=$($PSQL "SELECT * FROM elements WHERE symbol = '$ELEMENT_ARG'")
    #if not symbol
      if [[ -z $FOUND_ELEMENT_SYMBOL ]]
      then
        #search by name
        FOUND_ELEMENT_NAME=$($PSQL "SELECT * FROM elements WHERE name = '$ELEMENT_ARG'")
        #if not name:
        if [[ -z $FOUND_ELEMENT_NAME ]]
        then
          echo I could not find that element in the database.
        else
          #obtain details from name
          ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE name = '$ELEMENT_ARG'") | xargs)
          SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE name = '$ELEMENT_ARG'") | xargs)
          TYPE_ID=$(echo $($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
          TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID") | xargs)
          ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
          MELTING_POINT=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
          BOILING_POINT=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
          echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_ARG ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_ARG has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        fi
      else
        #obtain details from symbol
        ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$ELEMENT_ARG'") | xargs)
        NAME=$(echo $($PSQL "SELECT name FROM elements WHERE symbol = '$ELEMENT_ARG'") | xargs)
        TYPE_ID=$(echo $($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
        TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID") | xargs)
        ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
        MELTING_POINT=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
        BOILING_POINT=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER") | xargs)
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($ELEMENT_ARG). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

      fi
  else
    #obtain details from atomic_number
    SYMBOL=$(echo $($PSQL "SELECT symbol from elements WHERE atomic_number = '$ELEMENT_ARG'") | xargs)
    NAME=$(echo $($PSQL "SELECT name FROM elements WHERE symbol = '$SYMBOL'") | xargs)
    TYPE_ID=$(echo $($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ELEMENT_ARG") | xargs)
    TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID") | xargs)
    ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ELEMENT_ARG") | xargs)
    MELTING_POINT=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ELEMENT_ARG") | xargs)
    BOILING_POINT=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ELEMENT_ARG") | xargs)
    echo "The element with atomic number $ELEMENT_ARG is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

  fi
else
  echo Please provide an element as an argument.
fi