nz_hour="$(TZ=NZ date +%H)" ; nz_day="$(TZ=NZ date +%d)" ; if [ "$nz_hour" = 01 ] && [ "$nz_day" = 01 ]; then
curl --request POST \
	--url "https://api.trello.com/1/lists?key=$KEY&token=$TOKEN&name=$(date +'%d%%20%b')%20to%20$(date +'%d%%20%b' -d '+7 days')%20$(date +'%Y')&idBoard=$BOARD_ID&pos=2.0" ; fi
