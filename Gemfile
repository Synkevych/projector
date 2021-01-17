source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage
gem 'image_processing'
gem 'aws-sdk-s3', require: false

# Client library for Amazon's Simple Email Service's REST API
gem "aws-ses", "~> 0.7.0", :require => 'aws/ses'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'devise'
gem 'will_paginate'
gem 'will_paginate-bootstrap4', '~> 0.2.2'
gem 'active_storage_validations'
gem 'haml'
gem 'acts-as-taggable-on', '~> 6.5'
gem 'pg_search'

#For sidekiq for mailers
gem 'sidekiq'
gem 'redis'
gem 'devise-async'
# Clean ruby syntax for writing and deploying cron jobs.
gem 'whenever', '~> 0.9.4', require: false

# This gem automatically creates both digest and non-digest assets which are useful for many reasons.
gem 'non-stupid-digest-assets', '~> 1.0', '>= 1.0.9'

# ActiveRecord mixin to add conventions for flagging records as discarded
gem 'discard'

# Facebook OAuth2 Strategy for OmniAuth
gem 'omniauth-facebook', '~> 6.0'
#A lightweight Facebook library supporting the Graph, Marketing, and Atlas APIs, realtime updates, test users, and OAuth.
gem "koala", '~> 3.0.0'
# Access for users
gem 'cancancan'
# For json tests

# Log all changes to your models
gem 'audited', '~> 4.9'
# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt', '~> 2.2', '>= 2.2.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'

  # rspec-rails is a testing framework for Rails 5+
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  # factory_bot_rails provides integration between factory_bot and rails
  gem 'factory_bot_rails', '~> 5.2'
  # Shoulda Matchers provides RSpec-compatible one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 4.3'
  # Extracting `assigns` and `assert_template` from ActionDispatch
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  # Nokogiri based 'have_tag' and 'with_tag' matchers for rspec 3
  gem 'rspec-html-matchers', '~> 0.9.2'
  # Set of matchers and helpers to allow you test your APIs responses like a pro.
  gem 'rspec-json_expectations', '~> 1.2'
  # Faker is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.11'

  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov', '~> 0.18.5', require: false
  # Simple console output formatter for SimpleCov
  gem 'simplecov-console', '~> 0.7.2', require: false
  # Hosted code coverage
  gem 'codecov', '~> 0.1.17', require: false
  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'database_cleaner', '~> 1.8.5'
end

group :development do
  gem "capistrano", "~> 3.14", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', '~> 1.0.3', require: false
  gem 'capistrano-local-precompile', '~> 1.2.0', require: false

  # A Ruby binding to the Ed25519 elliptic curve public-key signature system described in RFC 8032.
  gem 'ed25519'
  # This gem implements bcrypt_pdkfd (a variant of PBKDF2 with bcrypt-based PRF)
  gem 'bcrypt_pbkdf'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'haml-rails', '~> 2.0'
  gem 'letter_opener'
  gem 'rubocop', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
