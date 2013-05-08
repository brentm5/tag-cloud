source 'http://rubygems.org'

gem 'rails', '3.2.12'
gem 'pg'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'coveralls', require: false
gem 'airbrake', '3.1.8'
gem 'thin'
gem 'omniauth'
gem 'omniauth-github'
gem 'sass-rails',   '~> 3.2.3'
gem 'bootstrap-sass', '~> 2.3.0.1'
gem 'simple_form', '~> 2.1.0'
gem 'jquery-rails'
gem 'strong_parameters'


group :production do
  gem 'memcachier'
  gem 'dalli'
end

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'launchy'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.9.0'
  gem 'capybara'
  gem 'pry'
  gem 'dotenv'
end

group :test do
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'bourne'
end
