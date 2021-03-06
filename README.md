<p align="center">
  <img src="https://quicknote-images.s3.amazonaws.com/images/1540900611411-%20Untitled%2520design.png" height="150">
  <h2 align="center">Blueprint</h2>
  <p align="center">A boilerplate to create Rails 6 apps in minutes.<p>
  <p align="center">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" />
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="prs welcome">
  </p>
</p>


## Overview
Blueprint is a boilerplate to create Rails 6 apps easily and quickly.

Ideas/feedback/suggestions are welcome. Please open a PR to suggest a new feature.

### Table of Contents
- [Built-in features](#built-in-features)
- [Installation](#installation)
- [Sending Emails](#sending-emails)
  - [Organised Mail Folders](#organised-mailers-folders)
- [Customize Tailwind](#customize-tailwindcss)
- [Flash Messages](#flash-messages)
  - [Trigger Flash Messages Manually](#trigger-flash-messages-manually)
  - [Flash Messages Position](#flash-messages-position)
- [Form Validation](#form-validation)
- [Basic Admin Area](#basic-admin-area)
- [Other Options](#other-options)
- [Roadmap](#roadmap)

## Built-in features
Blueprint's goal is to make creating a modern Rails app as simple and fast as possible, which is why it comes with a few popular gems/plugins/libraries already set up:
* User authentication via [Devise](https://github.com/plataformatec/devise)
* Login/Sign up pages already designed and easily customizable
* Script that handles flash messages
* Transactional emails sent via [Postmark](https://postmarkapp.com/)
* Easy CSS animations with [Animated.css](https://daneden.github.io/animate.css/)
* Design via [TailwindCSS](https://tailwindcss.com/)
* Troubleshoot problems faster with [Better Errors](https://github.com/BetterErrors/better_errors)
* Production-ready DB setup via postgres
* Google Analytics with Turbolinks support
* Preview emails in your browser (instead of sending them) in development with [LetterOpener](https://github.com/ryanb/letter_opener)
* [DotEnv](https://github.com/bkeepers/dotenv) for environment variables support

## Installation
1. Clone the repo `git clone git@github.com:ManuelFrigerio/rails-blueprint.git`
2. Go to the folder `cd rails-blueprint` and run `gem install bundle && bundle install`
3. Run `rails db:setup && rails db:migrate` to create db and included Users table

## Environment variables
Blueprint uses a few environment variables to set defaults and save you time.
You can see which environment variables you need in the `.env-example` file. In your development environment, rename the `.env-example` file to `.env` and restart the server.

## Sending emails
To send emails Blueprint uses [Postmark](https://postmarkapp.com), an extremely realiable, developer-friendly and cheap ($10/month for 10K emails) email service. After you signup/login, create your first server and get your API key.

Simply make sure to set the `POSTMARK_API_KEY` variable in your environment with your Postmark API key.

### Organised mailers folders
By default, when you create a new mailer in Rails you have to create a folder under the `views` folder. However, if you have many mailers (eg: UserMailer, OrderMailer, NotificationMailer, etc), this often results in a messy `view` folder.

To solve this problem, Blueprint allows you to create you mailer folders under the new `views/mailers` folder.
When you create a new mailer (e.g: OrderMailer), simply create the corresponding folder (e.g: order_mailer) under the `views/mailers` folder.

![mailers folder](https://quicknote-images.s3.amazonaws.com/images/1543161663964-%20Screen%2520Shot%25202018-11-25%2520at%252017.00.33.png)

Check out the user_mailer folder as an example.

## Customize TailwindCSS
Tailwind is a utility-first CSS framework to build custom designs. You can [learn TailwindCSS for free here](https://scrimba.com/g/gtailwind). When it makes sense to create re-usable components, the recommended approach is to add all the classes related to a component in a `.scss` file under `app/javascript/css/components`. Don't forget to also `@import` the file in the `app/javascript/css/application.scss` file.

Blueprint comes with 4 component files: Animations, Notifications, Buttons and Forms.

### Animations
The animation.scss file ships the [Animate.css] library of CSS animations.

### Notifications
The notifications.scss file stores the CSS for the flash messages (check the [flash messages](#flash-messages) section below).

### Buttons & Forms
The buttons.scss and forms.scss files store very simple classes to style buttons and form inputs. These files are used primarily to show how to use Tailwind.

## Flash messages
Blueprint ships with a built-in JavaScript utility to handle flash messages.
Flash messages will appear as notifications at the top of the screen for 3.5 seconds.

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
### Flash messages position
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

This is done with the help of an initializer that overrides Rails's default behaviour and add a `.border-red-500` class to the inputs that fail the validation. You can customize the error class by changing line 4 of the **customize_errors.rb** initializer.

You can also use flash messages to show validation errors.
Blueprint has got a handy helper that you simply paste inside a form:

```
<%= form_for @object %>
  <%= render "layouts/scripts/form_errors", obj: @object %>
<% end %>
```

![form flash messages](https://quicknote-images.s3.amazonaws.com/images/1541594989782-%20valid.png)

## Basic Admin Area
A common functionality for Rails apps is the ability to log in as a specific user (usually to troubleshoot problems). Blueprint ships a very simple, yet flexible Admin Area that automatically lists all your users and allows you to log in as one of them with one click.

To see this page, visit the `/admin` path of your app. You will be prompted to authenticate (you don't want to expose this info to the world). The default login credentials are `admin` and `password`. Clearly, they are not very hacker-proof. You can change them in the `admin/base_controller.rb` file, line 4. 

## Other options
* If you are on Heroku, generate a master key by running this command `$ heroku config:set RAILS_MASTER_KEY=<your-master-key>` Make sure `your-master-key` is an alphanumeric string 32 chars.
* Go to **devise.rb** and change the default email address `config.mailer_sender`
* Create `.env` file and set your environment variables on your machine (see `.env-example`)

## Roadmap
* ✅ Migrated to TailwindCSS
* ✅ Migrate to Rails 6
* ☑️ Add logic to handle subscriptions using Stripe's webhooks
* ✅ Basic admin dashboard which also allows to [sign in as another user](https://github.com/plataformatec/devise/wiki/How-To:-Sign-in-as-another-user-if-you-are-an-admin)
* ☑️ Create a command line based script to customize the installation (add/remove gems, create tables, etc)

## Contributions

Feel free to implement anything from the roadmap, submit pull requests, create issues, discuss ideas or spread the word.
When adding a gem, make sure to add clear instructions in the **Installation** section on how to use it.

## Screenshots

Flash messages

![flash](http://g.recordit.co/a10vtjKgBA.gif)

Signup screen

![signup](https://quicknote-images.s3.amazonaws.com/images/1586105286680-%20Screenshot_2020-04-05%2520MyWebApp%2520-%2520My%2520description.png)
