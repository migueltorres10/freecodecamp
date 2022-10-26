#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENTS_GOALS

do
  
  if [[ $YEAR != "year" ]]
  then
  #teams_id and names
  WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")

  #not found
  #get winners team name
  if [[ -z $WINNER_ID ]]
  then
  INSERT_TEAMS_W=$($PSQL "insert into teams(name) values('$WINNER')")
  if [[ $INSERT_TEAMS_W == "INSERT 0 1" ]]
  then
  echo Insert into teams, $WINNER
  fi
  #get winners team id
  WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
  fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then 
  #teams_id and names
  OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

  #not found
  #get winners team name
  if [[ -z $OPPONENT_ID ]]
  then
  INSERT_TEAMS_O=$($PSQL "insert into teams(name) values('$OPPONENT')")
  if [[ $INSERT_TEAMS_O == "INSERT 0 1" ]]
  then
  echo Insert into teams, $OPPONENT
  fi
  #get winners team id
  OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
  fi
  fi

  INSERT_GAME=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
  values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENTS_GOALS)")
  if [[ $INSERT_GAME == "INSERT 0 1" ]]
  then
  echo -e "Insert into games: $YEAR, $ROUND, $WINNER($WINNER_ID), $OPPONENT($OPPONENT_ID), $WINNER_GOALS, $OPPONENTS_GOALS"
  fi
done
