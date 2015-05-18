source 'https://rubygems.org'

# Ruby version
ruby '2.2.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'

# Slugs
gem 'friendly_id'

# Users
gem 'devise'

# Dry up controllers
gem 'responders'

# Controller resource filters
gem 'has_scope'

# Generate Fake data
gem 'ffaker'

# Convention over JSON generation
gem 'active_model_serializers',
    github: 'rails-api/active_model_serializers',
    branch: '0-10-stable' # Caching well implemented

# Caching
gem 'redis-rails'

# Pagination
gem 'kaminari'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  # Heroku optional requirement
  gem 'rails_12factor', group: :production
  # Metrics
  gem 'newrelic_rpm'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Procfile management
  gem 'foreman'
end

group :development, :test do
  # Useful error pages
  gem 'better_errors'
  gem 'binding_of_caller'
  # Remove assets requests from logs
  gem 'quiet_assets'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # BDD
  gem 'spinach-rails'
  # Testing tools
  gem 'rspec-rails'
  # Test user interaction
  gem 'capybara', '~> 2.2.1'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'factory_girl_rails'
  # Testing simplifier
  gem 'shoulda-matchers', require: false
  gem 'test-unit'
  # API Testing
  gem 'airborne'
  # Rails panel chrome extension support
  gem 'meta_request'
  # Time dependant testing
  gem 'timecop'
end

