require_relative 'boot'

require 'rails/all'

# config.action_mailer.delivery_method = :postmark
# config.action_mailer.postmark_settings = { :api_token => "9483482c-461e-4711-beee-a12c47607acf" }
# config.action_mailer.default_url_options = { host: "betiwagon.herokuapp.com" }

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Beti
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :test_unit, fixture: false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
