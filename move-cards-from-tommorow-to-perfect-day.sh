curl --request POST \
  --url "https://api.trello.com/1/lists/$TOMORROW_LIST_ID/moveAllCards?key=$KEY&token=$TOKEN&idBoard=$BOARD_ID&idList=$TODAY_LIST_ID"
