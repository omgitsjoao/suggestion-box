source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use redcarpet to parse markdown
gem 'redcarpet'
# Use kaminari to paginate entries
gem 'kaminari'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'font-awesome-sass', '~> 4.6.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'nprogress-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do

# Use Unicorn as the app server
# gem 'unicorn'
# Use pg as database on production
gem 'pg'

end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Minitest and Guard
  # https://github.com/seattlerb/minitest
  # https://github.com/guard/guard-minitest
  gem 'guard-minitest', '~> 2.3.2'
  # Colorize minitest output and show failing tests instantly.
  gem 'minitest-colorize', git: 'https://github.com/ysbaddaden/minitest-colorize'
  # https://github.com/Springest/terminal-notifier-guard
  gem 'terminal-notifier-guard', '~> 1.5.3'
  # Colorfy Windows console
  gem 'win32console', platforms: [:mingw, :mswin, :x64_mingw]
end

group :test do
  gem 'mocha'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
