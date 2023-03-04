#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"


echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){ 
    if [[ $1 ]]
    then 
    echo -e "\n$1"#
    fi

    AVAILABLE_SERVICE=$($PSQL "SELECT service_id, name from services ORDER BY service_id")
    if [[ -z $AVAILABLE_SERVICE]]
    then 
    echo "Sorry, we don't have any service available right now" 
    else 
    echo "$AVAILABLE_SERVICE" | while read SERVICE_ID BAR NAME
        do 
            echo "$SERVICE_ID) $NAME"
        done 
        read SERVICE_ID 
        if [[ ! $SERVICE_ID  =~ ^[0-9]+$]]
        then 
            MAIN_MENU "THAT is not a number" 
        else 
            SERV_AVAIL = $($PSQL "SELECT service_id from services where service_id = $SERVICE_ID")
            NAME_SERV = $($PSQL "SELECT name from services where service_id = $SERVICE_ID")
            if [[ -z $SERV_AVAIL ]]
            then 
                MAIN_MENU "I could not find that service. what would you loke today?"
            else 
                echo -e "\nWhat's your phone number?"
                read CUSTOMER_PHONE
                CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone = '$CUSTOMER_PHONE'")
                if [[ -z $CUSTOMER_NAME ]]
                then 
                    echo -e "\nWhat's your name?"
                    read CUSTOMER_NAME
                    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
                fi
                echo -e "\nWhat time would you like your $NAME_SERV, $CUSTOMER_NAME?"
                read SERVICE_TIME
                CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
                if [[ $SERVICE_TIME ]]
                then 
                    INSERT_SERV_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID','$SERVICE_ID','$SERVICE_TIME')")
                    if [[ $INSERT_SERV_RESULT ]]
                    then 
                        echo -e "\nI have put you down for a $NAME_SERV at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
                    fi 
                fi 
            fi
        fi
    fi
}

MAIN_MENU