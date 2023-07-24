curl --request POST \
	--url https://mullauna-vic.compass.education/services/admin.svc/AuthenticateUserCredentials \
     	--header 'Content-Type: application/json' \
     	--data '{
  	  "username":"cou0008",
          "password":"Lion.8664"
  	}' \
       	-c ~/.cache/compass_cookies \
	| jq .d.roles[0].userID | USER_ID=$(</dev/stdin)

echo "$USER_ID"

curl --request POST \
	--url https://mullauna-vic.compass.education/Services/mobile.svc/GetScheduleLinesForDate \
	--header 'Content-Type: application/json' \
	--data '{
  	  "userId":"$USER_ID",
  	  "date":"24/07/2023 - 10:00 am"
	}' \
	-b ~/.cache/compass_cookies \
