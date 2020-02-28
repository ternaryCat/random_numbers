# This is RoR app for generating random numbers

## About
* This app has only 1 endpoint (api/v1/random_number)
* The app works without a database, you can just use **"rails s"** and app will run with no problems

## Numbers generating
To generate a number, you need just to send **GET** request to api/v1/random_number with the optional parameters **min** and **max** (0 and 1 by default)
<br>
If the request is correct, the server will return the number
<br>
[Also, there is some documentation for this project](https://app.swaggerhub.com/apis/ternaryCat/RandomNumbers)
