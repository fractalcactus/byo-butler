DATE= date +"%d-%b-%Y"    
curl --request POST \
  --url "https://api.trello.com/1/lists?key=$KEY&token=$TOKEN&name=${DATE}&idBoard=$BOARD_ID&pos=2.0"
