# frozen_string_literal: true

# ENV["RAILS_ENV"] ||= "test"
# require_relative "../config/environment"

# This is a reference created when using the rails generator but is loaded with
# active record references. It needs to be removed to avoid
# a database being created or attempted to be created
# require "rails/test_help"

# Ensure not loading into Production
abort("Abort testing: Your Rails environment is running in production mode!") if Rails.env.production?

require "active_support/test_case"
require "rails/generators/test_case"
require "active_support/testing/autorun"

# Keeping Active Support
# Tests now running with no active record and database
ActiveSupport.on_load(:action_controller_test_case) do
  def before_setup
    @routes = Rails.application.routes
    super
  end
end

ActiveSupport.on_load(:action_dispatch_integration_test) do
  def before_setup
    @routes = Rails.application.routes
    super
  end
end
