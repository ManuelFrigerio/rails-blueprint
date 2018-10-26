# README

## Overview
Rails Blueprint is a boilerplate app to create Rails 5 easily and quickly

## Libraries
Libraries included in this rails app:
* User authentication via [Devise](https://github.com/plataformatec/devise)
* Login/Sign up pages already designed and easyly customizable
* Script that handles flash messages
* Easy CSS animations with [Animated.css](https://daneden.github.io/animate.css/)
* Design via [Bulma](https://bulma.io/) + Sass
* Rename your app in 1 command with [Rename](https://github.com/morshedalam/rename)
* Troubleshoot problems faster with [Better Errors](https://github.com/BetterErrors/better_errors)
* Production-ready DB setup via postgres
* Google Analytics with Turbolinks support

## Installation
1. Clone the repo `git clone git@github.com:ManuelFrigerio/rails-blueprint.git`
2. Go to the folder `cd rails-blueprint` and run `gem install bundle && bundle install`
3. Run `rails db:setup && rails db:migrate` to create db and included Users table
4. To rename the app run `rails g rename:into New-Name`
5. If you are on Heroku, generate a master key by runing this command `$ heroku config:set RAILS_MASTER_KEY=<your-master-key>` Make sure <your-master-key> is an alphanumeric string 32 chars.
6. Go to devise.rb:21 and change the default email address
  
## Screenshots

Flash messages

![flash](http://g.recordit.co/a10vtjKgBA.gif)
