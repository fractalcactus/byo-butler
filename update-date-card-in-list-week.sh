<<COMMENT
    Updates a card to be named after the current week, e.g "18 Oct to 25 Oct 2020"
    This is intended to be created weekly on Sunday nights
COMMENT
nz_day="$(TZ=NZ date +%a)" ;if [ "$nz_day" = "Sun" ]; then
curl --request PUT \
	--url "https://api.trello.com/1/cards/tmKQWsyJ?key=$KEY&token=$TOKEN&name=$(date +'%d%%20%b' -d '+1 days')%20to%20$(date +'%d%%20%b' -d '+7 days')" ; fi
