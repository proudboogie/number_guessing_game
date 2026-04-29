#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=1

echo -e "\n~~~ Number Guessing Game ~~~\n"
echo Enter your username:
read USERNAME

# check username
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# if existing
if [[ ! -z $USER_ID ]]
then
  # get user games data
  GET_USER_GAMES=$($PSQL "SELECT count(*), min(guesses) FROM games WHERE user_id = $USER_ID")
  echo $GET_USER_GAMES | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done

else
  # if new
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  # insert new user
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
fi

GAME_LOOP(){
if [[ $1 ]]
then
  echo -e "\n$1"
fi
  
read GUESS_NUMBER
# check if integer
if [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
then
  # check if guessed
  if [[ $GUESS_NUMBER != $SECRET_NUMBER ]]
  then
    (( NUMBER_OF_GUESSES++ ))

    # if lower or higher
    if (( GUESS_NUMBER > SECRET_NUMBER ))
    then
      GAME_LOOP "It's lower than that, guess again:"
    else 
      GAME_LOOP "It's higher than that, guess again:"
    fi
     
  else
    # insert game
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id,guesses) VALUES ($USER_ID,$NUMBER_OF_GUESSES)")

    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  fi

else 
  GAME_LOOP "That is not an integer, guess again:"
fi

}

echo -e "\nGuess the secret number between 1 and 1000:"
GAME_LOOP
