source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.12', group: [:test]
# use pg for local and prod development
gem 'pg', '~> 0.17.1', group: [:test, :development, :production]


# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.3.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6', '>= 2.6.4'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 1.0.0', group: :doc

gem 'httparty', '~> 0.14.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :test do
  gem 'minitest-spec-rails', '>= 5.4.0'
  gem 'webmock'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

#coverage map for testing
gem 'simplecov', '>= 0.12.0', :require => false, :group => :test

#using puma server instead of webBrick
gem 'puma', '~> 3.12.6'
#base authentication gem
gem 'devise', '~> 4.7.1'
#setting user permissions for pages
gem 'cancan', '~> 1.6.10'

#js runtime
gem 'execjs', '~> 2.7.0'
#communication with aws S3 & other utils
gem 'aws-sdk', '~> 2.2.37'
#store env vars in the .env file
gem 'dotenv-rails', '~> 2.2.2'

gem 'font-awesome-sass'


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.3', '>= 2.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '>= 2.0.0'

  gem 'rdoc'
end

