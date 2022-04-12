source 'https://rubygems.org'

ruby '3.1.1'

gem 'sinatra'
gem 'webrick'
gem 'pg'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'launchy'
end

group :development, :test do
  gem 'sinatra-contrib'
  gem 'rubocop', '1.20'
end
