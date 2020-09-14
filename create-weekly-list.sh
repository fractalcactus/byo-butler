curl --request POST \
	--url "https://api.trello.com/1/lists?key=$KEY&token=$TOKEN&name=$(date +'%d %b') to $(date +'%d %b' -d '+7 days') $(date +'%Y')&idBoard=$BOARD_ID&pos=2.0"
