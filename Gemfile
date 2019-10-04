source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.29'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'redis', require: ["redis", "redis/connection/hiredis"]
gem 'hiredis'
gem 'em-synchrony'
gem 'connection_pool'
gem 'redis-rails'
gem 'rails-i18n'
gem 'title'
gem "devise", ">= 4.6.0"
gem 'devise-i18n'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'acts_as_followable', github: 'huluren/acts_as_followable'
gem 'haml-rails'
gem 'rails-timeago'
gem 'kaminari'
gem 'ckeditor_rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "bootstrap", ">= 4.3.1"
gem 'non-stupid-digest-assets'
group :development do
  gem 'rails_best_practices'
  gem 'brakeman', require: false
end

group :test do
  gem 'database_cleaner'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'awesome_print'
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :staging, :production do
  gem 'newrelic_rpm'
end

gem 'activeresource'
gem 'cached_resource'
gem 'httparty'
gem 'twitter'
gem 'sidekiq'
gem 'omniauth-weibo-oauth2'
#gem 'weibo_2'

gem 'omniauth-rails_csrf_protection'
gem "rubyzip", ">= 1.3.0"
