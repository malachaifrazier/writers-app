require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WritersApp
  class Application < Rails::Application
    # Filter sensitive parameters out of logs
    config.filter_parameters << :password
    config.filter_parameters << :password_confirmation

    # Don't encode ampersands into \u0026 when creating JSON
    config.active_support.escape_html_entities_in_json = false
    config.i18n.enforce_available_locales = true
    config.active_record.default_timezone = :utc

    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs true
      generate.stylesheets true
      generate.test_framework :rspec
      generate.view_specs false
      generate.fixture_replacement :factory_girl
    end

    config.action_controller.action_on_unpermitted_parameters = :raise

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths << Rails.root.join('lib')

    # Needs to be false on Heroku
    config.public_file_server.enabled = false
    config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=31536000' }

    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts', 'vendor')

    # Precompile additional assets
    config.assets.precompile += %w( *.svg *.eot *.woff *.ttf *.png *.jpg *.jpeg *.gif)
  end
end
Paperclip.options[:command_path] = "/usr/local/bin/identify"
