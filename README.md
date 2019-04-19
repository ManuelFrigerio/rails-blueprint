<p align="center">
  <img src="https://quicknote-images.s3.amazonaws.com/images/1540900611411-%20Untitled%2520design.png" height="150">
  <h2 align="center">Blueprint</h2>
  <p align="center">A boilerplate to create Rails 5 apps in seconds.<p>
  <p align="center">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" />
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="prs welcome">
  </p>
</p>


## Overview
Blueprint is a boilerplate to create Rails 5 apps easily and quickly.
This boilerplate was born from an internal document that you can find [here](https://www.notion.so/maitre/Rails-5-App-Setup-Blueprint-d8b70c50d62f4bf5a4607ee7a7b994ac).

Ideas/feedback/suggestions are welcome. Please open a PR to suggest a new feature.

## Libraries
Libraries included in this rails app:
* User authentication via [Devise](https://github.com/plataformatec/devise)
* Login/Sign up pages already designed and easily customizable
* Script that handles flash messages
* Easy CSS animations with [Animated.css](https://daneden.github.io/animate.css/)
* Design via [Bulma](https://bulma.io/) + Sass
* Rename your app in 1 command with [Rename](https://github.com/morshedalam/rename)
* Troubleshoot problems faster with [Better Errors](https://github.com/BetterErrors/better_errors)
* Production-ready DB setup via postgres
* Google Analytics with Turbolinks support
* Preview emails in your browser (instead of sending them) with [LetterOpener](https://github.com/ryanb/letter_opener)
* [DotEnv](https://github.com/bkeepers/dotenv) for environment variables support

## Installation
1. Clone the repo `git clone git@github.com:ManuelFrigerio/rails-blueprint.git`
2. Go to the folder `cd rails-blueprint` and run `gem install bundle && bundle install`
3. Run `rails db:setup && rails db:migrate` to create db and included Users table
4. To rename the app run `rails g rename:into New-Name`

## Environment variables
Blueprint uses a few environment variables to set defaults and save you time.
You can see which environment variables you need in the `.env-example` file. In your development environment, rename the `.env-example` file to `.env` and restart the server.

## Sending emails
To send emails Blueprint uses [SparkPost](https://sparkpost.com), an extremely realiable, developer-friendly and cheap ($9/month for 50K emails) email service. After you signup/login, get your API key here: https://app.sparkpost.com/account/api-keys.

Simply make sure to set the `SPARKPOST_API_KEY` variable in your environment with your Sparkpost API key. You can also override other settings by changing the initializer (**config/initializers/sparkpost_rails.rb**) as [explained here](https://github.com/the-refinery/sparkpost_rails).

### Organised mailers folders
By default, when you create a new mailer in Rails you have to create a folder under the `views` folder. However, if you have many mailers (eg: UserMailer, OrderMailer, NotificationMailer, etc), this often results in a messy `view` folder.

To solve this problem, Blueprint allows you to create you mailer folders under the new `views/mailers` folder.
When you create a new mailer (e.g: OrderMailer), simply create the corresponding folder (e.g: order_mailer) under the `views/mailers` folder.

![mailers folder](https://quicknote-images.s3.amazonaws.com/images/1543161663964-%20Screen%2520Shot%25202018-11-25%2520at%252017.00.33.png)

Check out the user_mailer folder as an example.

## Customize Bulma
You can customize colours, sizes, breakpoints, etc by changing the variables in the `assets/stylesheets/bulma/utilities/initial-variable.scss` and `assets/stylesheets/bulma/utilities/derived-variable.scss` files. You cna learn more about [Bulma's Sass variables here](https://bulma.io/documentation/customize/variables/).

## Flash messages
Blueprint ships with a built-in JavaScript utility to handle flash messages.
Flash messages will appear as notifications at the top of the screen for 3,5 seconds.

![flash message](http://g.recordit.co/EUkOJ7Vhun.gif)

You can use 4 different type of flash messages:
```
flash[:notice] = "This is a notice notification"
flash[:error] = "This is a error notification"
flash[:success] = "This is a success notification"
flash[:warning] = "This is a warning notification"
```
Each flash type comes with a different colour.

![flash messages colour](https://quicknote-images.s3.amazonaws.com/images/1541593180193-%20Untitled%2520design.png)

### Trigger flash messages manually
You can manually trigger flash messages everywhere in your app with the following code:
```
showNotice("This is a notice notification");
showSuccess("This is a success notification");
showError("This is a error notification");
showWarning("This is a warning notification");
```
### Flash notification position
You can change the default position by adding a second parameter "bottom" to the function, like this:
```
showNotice("This is a notice notification", "bottom");
```

You can change the position of all flash messages in your app to bottom by editing the file **layouts/scripts/flash**, eg:
```
<% if flash[:success] %>
  showSuccess("<%= flash[:success] %>", "bottom");
<% end %>
```

## Form validation
Form validations are also handled automatically.
If any validations fail, the respective inputs will turn red as shown in the screenshot below.

![validation](https://quicknote-images.s3.amazonaws.com/images/1541591390886-%20campaign.png)

This is done with the help of an initializer that overrides Rails's default behaviour and add a `.is-danger` class to the inputs that fail the validation. If you decide not to use Bulma, you can still customize the error class by changing line 4 of the **customize_errors.rb** initializer.

You can also use flash messages to show validation errors.
Blueprint has got a handy helper that you simply paste inside a form:

```
<%= form_for @object %>
  <%= render "layouts/scripts/form_errors", obj: @object %>
<% end %>
```

![form flash messages](https://quicknote-images.s3.amazonaws.com/images/1541594989782-%20valid.png)

## Other options
* If you are on Heroku, generate a master key by running this command `$ heroku config:set RAILS_MASTER_KEY=<your-master-key>` Make sure `your-master-key` is an alphanumeric string 32 chars.
* Go to **devise.rb** and change the default email address `config.mailer_sender`
* Create `.env` file and set your environment variables on your machine (see `.env-example`)

## Roadmap
* ✅ Use Bulma Sass files to easily change CSS settings
* ☑️ Add logic to handle subscriptions using Stripe's webhooks
* ☑️ Create configuration file for 1-click deployment on Heroku
* ☑️ Basic admin dashboard which also allows to [sign in as another user](https://github.com/plataformatec/devise/wiki/How-To:-Sign-in-as-another-user-if-you-are-an-admin)
* ☑️ Add instructions to [use different theme](https://jenil.github.io/bulmaswatch/)
* ☑️ Create a command line based script to customize the installation (add/remove gems, create tables, etc)
* ☑️ Add [SitemapGenerator](https://github.com/kjvarga/sitemap_generator) to... automatically generate a sitemap. 

## Contributions

Feel free to implement anything from the roadmap, submit pull requests, create issues, discuss ideas or spread the word.
When adding a gem, make sure to add clear instructions in the **Installation** section on how to use it.

## Screenshots

Flash messages

![flash](http://g.recordit.co/a10vtjKgBA.gif)

Signup screen

![signup](https://quicknote-images.s3.amazonaws.com/images/1540900091320-%20ReferralHero%2520%2520%2520Results%2520driven%2520referral%2520software%2520for%2520SaaS%2520companies%2520.png)
