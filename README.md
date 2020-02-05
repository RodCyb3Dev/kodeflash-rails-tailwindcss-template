```ruby
=begin
#######################################################################################################################
##  ####  ####      ##########       ##      ####      ###  ##############      ##########         ###  ##########  ###
##  ###  ####  ####  ########  ####  ##  ########  #######  #############  ####  #########  ##########  ##########  ###
##  ##  ####  ######  ######  #####  ##  ########  #######  ############  ######  ########  ##########  ##########  ###
##  #  ####  ########  ####  ######  ##  ########  #######  ###########  ########  #######  ##########  ##########  ###
##  ######  ##########  ##  #######  ##      ####      ###  ##########  ##########  ######         ###  ###    ###  ###
##  #  ####  ########  ####  ######  ##  ########  #######  #########  ###      ###  ############  ###  ##########  ###
##  ##  ####  ######  ######  #####  ##  ########  #######  ########  ###        ###  ###########  ###  ##########  ###
##  ###  ####  ####  ########  ####  ##  ########  #######  #######  ###          ###  ##########  ###  ##########  ###
##  ####  ####      ##########       ##      ####  #######       ##  ###           ###  ##         ###  ##########  ###
#######################################################################################################################
=end
```
Template Name: Kodeflash application template - Tailwind CSS
Author: Rodney H
Author URI: https://kodeflash.com
👉 Instructions: $ rails new myapp -d <postgresql, mysql, sqlite> -m template.rb

**Note:** Requires Rails 5.2 or higher

# Rails kodeflash – Tailwindcss

A rapid Rails (6.0.2.1) application template for personal use. This particular template utilizes [Tailwind CSS](https://tailwindcss.com/), a utility-first CSS framework for rapid UI development.

Tailwind depends on Webpack so this also comes bundled with [webpacker](https://github.com/rails/webpacker) support.

Inspired heavily by [Jumpstart](https://github.com/excid3/jumpstart) from [Chris Oliver](https://twitter.com/excid3/). Credits to him for a bunch here.

Be sure to also check out [Jumpstart Pro](https://jumpstartrails.com) to save loads of time creating your next Rails application. Chris, Jason, and I teamed up on it.

### Included gems

- [devise](https://github.com/plataformatec/devise)
- [devise_invitable](https://github.com/scambra/devise_invitable)
- [friendly_id](https://github.com/norman/friendly_id)
- [sidekiq](https://github.com/mperham/sidekiq)
- [rails_i18n](https://github.com/svenfuchs/rails-i18n)
- [google-cloud-storage](https://github.com/googleapis/google-cloud-ruby/tree/master/google-cloud-storage)
- [cloudinary](https://github.com/cloudinary/cloudinary_gem)
- [meta-tags](https://github.com/kpumuk/meta-tags)
- [lazyload-rails](https://github.com/jassa/lazyload-rails)
- * more...

### Tailwind CSS by default

With Rails 6 we have webpacker by default now. Using PostCSS we can install Tailwind as a base CSS framework to harness. I prefer Tailwind due to it's un-opinionated approach.

## How it works

When creating a new rails application simply pass the template file through.
$ rails new siun-app -d <postgresql, mysql, sqlite> -m template.rb

### Creating a new app

```bash
$ rails new esim_app -d <postgresql, mysql, sqlite> -m template.rb
```

### Once installed what do I get?

- Webpack support + Tailwind CSS configured in the `app/javascript` directory.
- Devise with a new `username`, `name`, `invitation`, `omniauth` field already migrated in. Enhanced views using Tailwind CSS.
- Support for Friendly IDs thanks to the handy [friendly_id](https://github.com/norman/friendly_id) gem. Note that you'll still need to do some work inside your models for this to work. This template installs the gem and runs the associated generator.

- Rails 6+ comes with webpacker by default and some cool features like `active_storage`, `action_text` which we added for you to use `has_one_attached` or `has_rich_text`. Note that you'll still need to do some work inside your models for this to work. This template installs the gem and runs the associated generator.
- Optional Foreman support thanks to a `Profile`. Once you scaffold the template, run `foreman start` to initalize and head to `locahost:5000` to get `rails server`, `sidekiq` and `webpack-dev-server` running all in one terminal instance. Note: Webpack will still compile down with just `rails server` if you don't want to use Foreman. Foreman needs to be installed as a global gem on your system for this to work. i.e. `gem install foreman`
- A custom scaffold view template when generating theme resources (Work in progress).
- Git initialization out of the box

#### Booting your local server with redis

To utilize foreman with Sidekiq noted above you'll need to install redis. The gem comes within a new rails application but it is commented out. Uncomment that line and run `bundle install`. It also might be handy to install redis on your machine (assuming you're on a mac) run `brew install redis` to install it. Then in a new terminal instance you can run `redis-server`.

After that is running, open a new terminal instance and finally run `foreman start`. Head to `locahost:5000` to see your app. You'll have hot reloading on `js` and `css` and `scss/sass` files by default. Feel free to configure to look for more to compile reload as your app scales.