require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require 'active_graph/railtie'
require 'neo4j_ruby_driver'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EmployeeDirectory
  class Application < Rails::Application
    routes.default_url_options[:host] = ENV.fetch('HOST', 'http://localhost:3000')
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.orm :neo4j
    end

    config.neo4j.session_type = :server_db
    config.neo4j.session_path = 'http://localhost:7474'

    config.neo4j.id_property = :neo_id
    config.neo4j.include_root_in_json = false
    config.neo4j.timestamp_type = Time
    config.neo4j.fail_on_pending_migrations = false
  end
end
