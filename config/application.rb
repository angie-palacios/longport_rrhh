require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LongportRrhh
  
  # User
  CREATE_USER = "create_user"
  DELETE_USER = "delete_user"
  EDIT_USER = "edit_user"
  VIEW_USER = "view_user"
  # rol
  CREATE_ROL = "create_rol"
  DELETE_ROL = "delete_rol"
  EDIT_ROL = "edit_rol"
  VIEW_ROL = "view_rol"
  # permission
  CREATE_PERMISSION = "create_permission"
  DELETE_PERMISSION = "delete_permission"
  EDIT_PERMISSION = "edit_permission"
  VIEW_PERMISSION = "view_permission"
  # business
  CREATE_BUSINESS = "create_business"
  DELETE_BUSINESS = "delete_business"
  EDIT_BUSINESS = "edit_business"
  VIEW_BUSINESS = "view_business"
  
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'UTC'
    config.i18n.available_locales = [:en, :es]
    config.i18n.default_locale = :en

    # config.active_record.raise_in_transactional_callbacks = true
    
    config.generators do |g|
      g.jbuilder false
      g.test_framework  nil
      g.assets  false
      g.helper false
      g.stylesheets false
    end

    config.assets.paths << Rails.root.join('vendor', 'templates', 'sb_admin')
  end
end
