require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DatingappRails
  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

       config.middleware.insert_before 0, "Rack::Cors" do
         allow do
           origins '*'
           resource '*',
             :headers => :any,
             :methods => :any,
             :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'] # 5 headers used by token auth
         end
       end
       
  end
end
