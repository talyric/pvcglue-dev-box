source 'https://rubygems.org'
ruby '2.1.5'

################# Must be the first Gem ###################
gem 'dotenv-rails', '0.11.1'
################# Must be the first Gem ###################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0',          group: :docs

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

gem 'thin'

# to use locally committed gem, use `bundle config local.pvcglue ~/projects/pvcglue`
# and `bundle config --delete local.pvcglue` to restore using remote repo
# See http://ryanbigg.com/2013/08/bundler-local-paths/
# and http://bundler.io/v1.3/bundle_config.html

# gem 'pvcglue', "~> 0.1.15", :group => :development
gem 'pvcglue', '~> 0.1.17', :github => 'talyric/pvcglue', :branch => 'master', :group => :development
# gem 'pvcglue', :path => "c:/Sites/pvcglue"
gem 'pvcglue_dbutils', '~> 0.5.3'
# gem 'pvcglue_dbutils', "~> 0.5.2", :github => 'talyric/pvcglue_dbutils', :branch => 'master' # must be available in all environments

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem "capybara"
end