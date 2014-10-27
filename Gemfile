source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby "2.1.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

gem "pg"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'


gem 'rails-assets-bootstrap'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem "foreman"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby


# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'active_model_serializers'

# Use unicorn as the app server
gem 'unicorn'

# Allow out-of-domain requests.
gem 'rack-cors', :require => 'rack/cors'

gem 'rails_12factor', :group => :production

group :development do
  # Use Capistrano for deployment
  gem 'capistrano'
  gem "guard-rspec", require: false
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem "codeclimate-test-reporter"
  gem 'rspec-rails'
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
end

group :development, :test do
  # Use debugger
  #gem 'debugger'
  gem 'pry'
end
