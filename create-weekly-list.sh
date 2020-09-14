curl --request POST \
  --url "https://api.trello.com/1/lists?key=$KEY&token=$TOKEN&name=$(date +'%d-%b-%Y')-to-Sunday&idBoard=$BOARD_ID&pos=2.0"
