#!/bin/bash
PSQL="psql -q --username=freecodecamp --dbname=number_guess -t --no-align -c"

secret_number=$(( ( RANDOM % 1000 ) + 1 ))

echo "Enter your username:"
read username

while [ ${#username} -ge 22 ]; 
  do
  echo "Username must be 22 characters or less."
  read username
done

username_used=$($PSQL "select username from username where username like '$username';")

if [[ $username_used == *"$username"* ]];
  then
  games_played=$($PSQL "select count(*) from records where username like '$username';")
  best_game=$($PSQL "select min(tries) from records where username like '$username';")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  else
    $PSQL "insert into username (username) values ('$username');"
    echo "Welcome, $username! It looks like this is your first time here."   
fi 

tries=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read number

  # Check if input is an integer
  if ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if [ $number -eq $secret_number ]; then
    tries=$((tries+1))
    break
  fi

  if [ $number -gt $secret_number ]; then
    echo "It's lower than that, guess again:"
    tries=$((tries+1))
  else
    echo "It's higher than that, guess again:"
    tries=$((tries+1))
  fi

done

$PSQL "insert into records (username, tries) values ('$username', $tries);"

echo "You guessed it in $tries tries. The secret number was $secret_number. Nice job!"
