# freecodecamp_RDB
`type or paste code here`

#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "$($PSQL "TRUNCATE games, teams;")"
echo -e "\nSuccessful Truncate!\n"

#Games Data Import

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then 
    #get team ID
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    #if not found
    if [[ -z $TEAM_ID ]]
    then 
       #Insert into teams
      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_TEAM_ID == "INSERT 0 1" ]]
    then 
      echo Inserted $WINNER into TEAMS!
    fi
    #get new id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  fi
fi
done
#insert opponent for full list
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $OPPONENT != "opponent" ]]
  then 
    #get team ID
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    #if not found
    if [[ -z $TEAM_ID ]]
    then 
       #Insert into teams
      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_TEAM_ID == "INSERT 0 1" ]]
    then 
      echo Inserted $OPPONENT into TEAMS!
    fi
    #get new id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  fi
fi
done

echo -e "\nInserting into games\n"
# Inserting info into games file
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do


  if [[ $YEAR != "year" ]]
  then 
  #get game ID
  GAME_ID=$($PSQL "SELECT game_id FROM games WHERE round = '$ROUND' AND winner = '$WINNER' AND year = '$YEAR'")
  #if not found

  if [[ -z $GAME_ID ]]
  
  then 
  WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
  OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")" 
  #INsert rows
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner, opponent, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$WINNER', '$OPPONENT', '$WINNER_GOALS', '$OPPONENT_GOALS', '$WINNER_ID', '$OPPONENT_ID')")
  if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
    echo Inserted $ROUND Successfully!
    fi
  fi
fi
done

![Screenshot 2022-11-22 135034|690x448](upload://fnxUhpZPGJFAOioTRuec3d8GAKK.jpeg)