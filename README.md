# README

## Overview
Rails Blueprint is a boilerplate to create Rails 5 apps easily and quickly.
This boilerplate was born from an internal document that you can find [here](https://www.notion.so/maitre/Rails-5-App-Setup-Blueprint-d8b70c50d62f4bf5a4607ee7a7b994ac).

Ideas/feedback/suggestions are welcome. Please open a PR to suggest a new feature.

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

## Other options
* If you are on Heroku, generate a master key by runing this command `$ heroku config:set RAILS_MASTER_KEY=<your-master-key>` Make sure `your-master-key` is an alphanumeric string 32 chars.
* Go to **devise.rb** and change the default email address `config.mailer_sender`
* Go to **config/initializers/metatags.rb** to customize the metatags for your app.
  
## Screenshots

Flash messages

![flash](http://g.recordit.co/a10vtjKgBA.gif)

Signup screen

![signup](https://quicknote-images.s3.amazonaws.com/images/1540900091320-%20ReferralHero%2520%2520%2520Results%2520driven%2520referral%2520software%2520for%2520SaaS%2520companies%2520.png)
