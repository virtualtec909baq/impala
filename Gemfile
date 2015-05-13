source 'https://rubygems.org'

ruby File.read(".ruby-version").strip

gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'slim-rails'
gem 'pg'
gem 'devise'
gem 'rails-i18n'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem "bower-rails", "~> 0.9.2"
gem 'jquery-datatables-rails', '~> 3.2.0'
gem 'jquery-countdown-rails'
gem 'filterrific'
gem "font-awesome-rails"
gem 'cancancan', '~> 1.10'
gem 'bootstrap-datepicker-rails'
gem 'unicorn'

group 'development' do
  gem 'faker'
  gem 'hirb'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', require: false
  gem 'rspec-activemodel-mocks'
  gem 'rspec-collection_matchers'
end

group :production do
  gem 'mysql2'
  gem 'rails_12factor'
  gem 'fog'
end