require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookworm
    class Application < Rails::Application
        config.autoload_paths += Dir["#{Rails.root}/lib/goodreads_api"]
      
        config.action_view.embed_authenticity_token_in_remote_forms = true
      
      
    end
end
