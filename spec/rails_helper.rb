ENV["RAILS_ENV"] ||= 'test'
require 'simplecov'
# SimpleCov.formatter = SimpleCov::Formatter::MetricFu
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/core'
# Add additional requires below this line. Rails is not loaded until this point!
# note: require 'devise' after require 'rspec/rails'
require 'devise'
require 'database_cleaner'
SimpleCov.start 'rails'

require 'bundler/setup'
::Bundler.require(:default, :test)

require 'shoulda/matchers'
::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!

  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
ActiveRecord::Migration.maintain_test_schema!

