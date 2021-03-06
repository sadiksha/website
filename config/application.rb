require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Hcking
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/presenters)
    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = "Berlin"

    # The default locale is :de
    config.i18n.default_locale = :de

    # Only load some locales (especially from the rails-i18n gem)
    config.i18n.available_locales = [:de, :en]

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirm]

    # Enable the asset pipeline
    config.assets.enabled = true
    # We do not need rails when precompiling
    config.assets.initialize_on_precompile = false
    config.assets.precompile += ['active_admin.css', 'active_admin.js', 'active_admin/print.css']
    config.assets.version = '1.0'

    # Disable Feature "allow external guestes!
    config.allow_external_guests = false

    # Enforce Available locales (new rails default behavior)
    I18n.config.enforce_available_locales = false

    # Our weeks in analytics should start on Monday
    Groupdate.week_start = :mon

    config.x.release_stage = (ENV["RELEASE_STAGE"] || Rails.env).to_sym

    # Let the app know what version we're running (REVISION is written by Capistrano on deploy)
    config.x.current_revision = File.exist?("#{Rails.root}/REVISION") ? File.read("#{Rails.root}/REVISION").strip : "UNKNOWN"
  end
end
