require 'simplecov'

require 'cucumber/rails'
require 'rspec/expectations'

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.javascript_driver = :poltergeist
