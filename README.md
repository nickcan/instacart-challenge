# Instacart Shopper challenge

#### Part I: Frontend
Unfortonately, I decided to tackle this section second and ran into an issue setting up a Rails 5 app with a React client.
Therefore, this is not complete and simply uses a CRA to at least get something down. Just didn't have the time after the error to do much with the app.

To run the app:
cd ./shopper_challenge
yarn start or npm start

I didn't have time to implement the challenge the way I wanted. Initially, I was going to use Rails ~> 5.1 with its new Webpack build and run a React client inside the app. This way I could have a nice, full-stack application to solve a pretty simple prblem. As stated in the challenge, I really wanted to show off my frontend skills. While it would maybe have been best for me to implement a Rails app, it didn't seem very appropriate since I really like using React.

At the end of the day, I may have attempted a bit too much for the project and it's my own fault. Running into the error in Rails 5 set me back too much to recover and provide a solid solution.

#### Part II: Backend
I did this part first since I wanted to get to know the data and seemed like a fun problem.

Download the GZipped file provided in the challenge for the SQLite3 DB (Github won't let me upload and says the file is too large).

Unzip the file and add it to the root directory.
From root directory, run script with:
ruby applicant_monitor.rb "2014-08-01" "2014-09-01"
