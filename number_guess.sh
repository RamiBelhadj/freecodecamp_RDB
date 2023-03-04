#!/bin/bash

NUMBER=$(($RANDOM%1000+1))

USERNAME_F(){
    echo -e "\nEnter your username:"
    read USERNAME 

    LOOK_USER=$($PSQL "SELECT username FROM users where username = '$USERNAME'")
    if [[ -z $LOOK_USER ]]
    then
        INSERT_NEW_USER=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 0, 2147483647)")
        echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    else 
        READ_USER=$($PSQL "SELECT username, games_played, best_game from users WHERE username='$USERNAME'")
        echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
    GUESSING_NUMBER
}

GUESSING_NUMBER(){ 
    echo -e "\nGuess the secret number between 1 and 1000: " 
    read INPUT_NUMBER
    NUMBER_OF_GUESSES=1
    while [[ $INPUT_NUMBER -ne $NUMBER ]]
    do 
        if [[ ! $INPUT_NUMBER =~ ^[0-9]+$ ]]
        then 
            echo -e "\nThat is not an integer, guess again: " 
        elif [[ $INPUT_NUMBER > $NUMBER ]]
        then 
            echo -e "\nIt's lower than that, guess again: " 
        elif [[ $INPUT_NUMBER < $NUMBER ]]
        then 
            echo -e "\nIt's higher than that, guess again: " 
        fi
        read INPUT_NUMBER   
        NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
    done
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
    INSERT_DATA
}


INSERT_DATA(){
    USER_ID=$($PSQL "SELECT id from users where username = '$USERNAME'")
    INSERT_NEW_GAME=$($PSQL "UPDATE users SET games_played=games_played+1, LEAST(best_game, $NUMBER_OF_GUESSES) WHERE id = $USER_ID")
}