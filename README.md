Project of Julie Kwok et Dhiya Bakache


Please run the following lines in terminal before testing in console

* $ bundle install

* $ rails db:migrate

* $ rails db:seed


To test the local site:

* http://localhost:3000/index   (home page)

* http://localhost:3000/team    (team information)

* http://localhost:3000/contact (team contact)

* http://localhost:3000/welcome/whatever (personal greeting)

For the moment we have the following tables:

* cities

* users

* gossips

* tags

* messages

* join table gossip tag

* join table message recipient

There is currently no data validation
