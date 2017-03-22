# Sephora Take-home Test

## Initial Setup
The website is built on rails version 4.2
In order to run the website on your local machine, go through the following steps

1. Clone the repo to your local machine
2. Run ```bundle install``` to install all dependencies
3. RUn ```rails db:create``` and ```rails db:migrate``` to create and migrate the database
4. Run ```rails db:seed```
5. Start up the server using ```rails s```
6. You will need to configure cloudinary with your own details to be able to upload images

Open your local server to view the website. If you are an admin you can log in so that you can make changes to the catalogue.

Login details for the admin are seeded to the database. They are as follows

username: 'casey@gmail.com'
password: 'abcdef123456'

## Tests

Basic tests have been written using rspec.
Tests can be run using the command

``bundle exec rspec``

## Gems used

1. Cloudinary
2. rspec
3. bcrypt
4. Bootstrap-sass
