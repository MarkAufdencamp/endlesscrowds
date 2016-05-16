source 'https://rubygems.org'

# For heroku
ruby '2.2.4'
# ruby native dependencies:
#   libyaml - required for psych
gem 'rails', '3.2.22.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  #gem 'uglifier', '>= 1.0.3'
  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Database
gem 'pg'
# PostgreSQL native dependency:
#  postgres
#  postgres-server
gem 'pg_search'
gem 'postgres-copy'
gem 'schema_plus'
gem 'schema_associations'

# Template
gem 'slim-rails'

# Markup
# TODO: Take a look on dependencies
gem 'RedCloth'

# JS
# InitJS requires running generator post install for new/updated? projects
#  rails g initjs:install
gem 'initjs'

# Layout
gem 'foundation-rails'
#gem 'foundation-rails', '~> 5.4', '>= 5.4.5.0'
# Foundation requires running generator post install for new/updated? projects
#  rails g foundation:install
#gem 'unsemantic_rails'

# Model
# paranoid stuff
gem 'paper_trail'

# Decorator
gem 'draper'

# Authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

# Authorization
# See https://github.com/ryanb/cancan/tree/2.0 for help about this
# In resume: this version of cancan allow checking for authorization on specific fields on the model
#gem 'cancan', git: 'git://github.com/ryanb/cancan.git', branch: '2.0', ref: 'f1cebde51a87be149b4970a3287826bb63c0ac0b'
gem 'cancan', git: 'git://github.com/ryanb/cancan.git', branch: '2.0'

# Encryption
gem 'ezcrypto'
# EzCrypto native dependency:
#  openssl 

# Background Job Processing
gem 'sidekiq'
gem 'concurrent-ruby'
gem 'connection_pool'
gem 'redis'

gem 'sinatra', require: false # required by sidekiq web interface mounted on /sidekiq
group :development do
  gem 'minitest'
end
 
# Form builder
gem 'formtastic'

# Text to HTML
# Syntax and structure of gem were changed in 2.0, use 1.6.4
gem 'auto_html', '~> 1.6', '>= 1.6.4'

# Paginator
gem 'kaminari'

# Content Upload
gem 'carrierwave'

# Image Manipulation
gem 'rmagick'
# RMagick native dependency:
#  ghostscript
#  ImageMagick

# Feed
# gem 'feedzirra'
gem 'feedjira'
# FeedJira/Loofah native dependency:
#  libxml2
#  libxslt

# Turns every field on a editable one
gem 'best_in_place'

# State machine for attributes on models
gem 'state_machine', require: 'state_machine/core'

gem 'ranked-model'
#gem 'validation_reflection',      git: 'git://github.com/ncri/validation_reflection.git'
gem 'inherited_resources'
gem 'has_scope'
gem 'spectator-validates_email', require: 'validates_email'
gem 'video_info'
gem 'enumerate_it'

# FIXME: Not-anymore-on-development
# Gems that are with 1 or more years on the vacuum
gem 'weekdays'
#gem "rack-timeout"
# TODO: Take a look on dependencies. Why not auto_html?
gem 'rails_autolink'

# Payment
#gem 'moip', git: 'git://github.com/catarse/moip-ruby.git'
#gem 'httparty', '~> 0.6.1' # this version is required by moip gem, otherwise payment confirmation will break
#-----------------------------------------------------
# Comment these out when running rake db:migrate for the first time
#-----------------------------------------------------
# Catarse Paypal
gem 'catarse_paypal_express', git: 'git://github.com/scouttyg/catarse_paypal_express.git'
# Catarse WePay
gem 'catarse_wepay', git: 'git://github.com/alfajango/catarse_wepay.git', branch: 'alfajango'
# Catarse Moip
# gem 'catarse_moip', git: 'git://github.com/catarse/catarse_moip.git'. ref: '388b7bc'

gem 'activemerchant', require: 'active_merchant'
gem 'httpclient'

# Email marketing
# Catarse MailChimp
gem 'catarse_mailchimp'


group :development do
  # Mailer - Devise confirmation/passwd reset
  gem 'letter_opener'

  # Recomended not to install in Gemfile - https://github.com/ddollar/foreman
  gem 'foreman'

  # Railscast #402
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'

  gem 'rack-mini-profiler'
  #gem 'quiet_assets'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  #gem 'iso8601', '= 0.8.7'
  gem 'yard'
  gem 'watir-webdriver'
end

group :test do
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'capybara'
  gem 'jasmine'
  gem 'coveralls', require: false
end

group :assets do
  # Compass style framework
  gem 'compass-rails'
  gem 'compass-960-plugin'
  gem 'modernizr-rails'
end

group :production do
  # Cloud services
  # Gem used to handle image uploading
  gem 'fog'

  # Workers, forks and all that jazz
  gem 'unicorn'

  # Enabling Gzip on Heroku
  # If you don't use Heroku, please comment the line below.
  #gem 'heroku-deflater'

  # Monitoring
  #gem 'newrelic_rpm'
  
  # Using dalli and memcachier have not presented significative performance gains
  # Probably this is due to our pattern of cache usage
  # + the lack of concurrent procs in our deploy
  #gem 'memcachier'
  #gem 'dalli'
end


#Errbit for e.alfajango.com
#gem 'airbrake', '3.1.6'

gem 'test-unit', '~> 3.1', '>= 3.1.8'
