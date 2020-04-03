require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module Referralhero
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.2
    config.load_defaults 6.0

    config.autoload_paths << Rails.root.join('lib') # adds Lib folder to autoloaded files

    # allow cross origin requests. Comment it out if you're not interested in cross-origin requests
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :patch, :put, :delete]
      end
    end

    # disable superfluous generator extras
    config.generators do |g|
      g.assets = false # remove auto stylesheets
      g.helper = true
    end

  end
end
