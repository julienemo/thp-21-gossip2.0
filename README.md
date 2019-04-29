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

* http://localhost:3000/gossip/xxx (individual page for gossip. Also available when clicking "See Gossip" button)

* http://localhost:3000/user/xxx (individual page for user. Also available when clicking user'name on each gossip page)

* http://localhost:3000/tag/xxx (individual page for tag. Also available when clicking on each tag on gossip page)


For the moment we have the following tables:

* cities

* users

* gossips

* tags

* messages

* join table gossip tag

* join table message recipient

There is currently no data validation
