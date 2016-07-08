source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'mysql2'
gem 'pg', '~> 0.18.4'

#  Heroku integration
gem 'rails_12factor', group: :production

#--- ASSETS
gem 'sprockets',              '~> 3.6.3'
gem 'sass-rails',             '~> 5.0.5'
gem 'bootstrap-sass',         '~> 3.3.6'
gem 'autoprefixer-rails',     '~> 6.3.7'
gem 'bootstrap-generators',   '~> 3.3.4'
gem 'uglifier',               '>= 1.3.0'
gem 'jquery-rails',           '~> 4.1.1'
gem 'turbolinks',             '~> 2.5.3'

#--- Rails Assets Group -------
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery',        '~> 1.11'
  gem 'rails-assets-jquery-ujs',    '~> 1.0'
  gem 'rails-assets-select2',       '~> 3.5.2'
end

# Datepicker with bootstrap
gem 'momentjs-rails',                     '~> 2.9.0'
gem 'bootstrap3-datetimepicker-rails',    '~> 4.7.14'

#Avatar: photo
gem 'gravatarify', '~> 3.1', '>= 3.1.1'

gem 'jquery-ui-rails',    '~> 5.0.5'
gem 'modernizr-rails',    '~> 2.7', '>= 2.7.1' 

#Initialize JavaScript
gem 'js-initializers'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# authentication & authorization
gem 'devise'                        , '~> 3.5', '>= 3.5.2'
gem 'easy_roles'
gem 'cancancan', '~> 1.14'

# Omniauth Google
gem "omniauth-google-oauth2"

# upload files
gem 'carrierwave'                   , '~> 0.11.2'

# paginator
gem 'kaminari'                      , '~> 0.16.3'

# Search gem
gem 'ransack', github: 'activerecord-hackery/ransack'

# Forms
gem 'simple_form'
gem 'nested_form'
gem 'select2_simple_form', github: 'lndl/select2_simple_form', tag: '0.5'

# Applications settings
gem 'config'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'binding_of_caller'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

ruby '2.3.0'
