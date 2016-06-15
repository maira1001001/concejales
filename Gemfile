source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'mysql2'

#--- ASSETS
gem 'sprockets'
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'bootstrap-generators'
gem 'uglifier'
gem 'jquery-rails'
gem 'turbolinks'

#--- Rails Assets Group -------
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-select2', '~> 3.5.2'
end

gem 'jquery-ui-rails'
gem 'modernizr-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# authentication & authorization
gem 'devise'                        , '~> 3.5', '>= 3.5.2'
gem 'easy_roles'
gem 'cancancan', '~> 1.14'


# upload files
gem 'carrierwave'                   , '~> 0.11.2'

# paginator
gem 'kaminari'                      , '~> 0.16.3'

# Forms
gem 'simple_form'
gem 'nested_form'
gem 'select2_simple_form', github: 'lndl/select2_simple_form', tag: '0.5'

# Tags
gem 'acts-as-taggable-on'

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

