#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams,games;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #CHECK IF IT IS FIRST LINE
  if [[ $WINNER != "winner" ]]
  then
  #FOR WINNER
    #CHECK TEAM ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    #IF NO TEAM ID
    if [[ -z $WINNER_ID ]]
    then 
      #ADD NEW ITEM
      INSERT_WINNER_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_ID == "INSERT 0 1" ]] 
      then
      echo Inserted into teams, $WINNER
      fi
      #GET ADDED ITEM ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi

  #FOR OPPONET
       #CHECK TEAM ID
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
          #IF NO TEAM ID
              if [[ -z $OPPONENT_ID ]]
                then
                #ADD NEW ITEM
                INSERT_OPPONENT_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
                  if [[ $INSERT_OPPONENT_ID == "INSERT 0 1" ]] 
                  then
                  echo Inserted into teams, $OPPONENT
                  fi
                #GET ADDED ITEM ID
                OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
              fi

  INSERT_GAMES_INFO=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")

                  if [[ $INSERT_GAMES_INFO == "INSERT 0 1" ]] 
                  then
                  echo Inserted into games, $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
                  fi

  fi

done