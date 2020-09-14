curl --request POST \
	--url "https://api.trello.com/1/lists?key=$KEY&token=$TOKEN&name=$(date +'%d %b')%20to%20$(date +'%d %b' -d '+7 days')%20$(date +'%Y')&idBoard=$BOARD_ID&pos=2.0"
