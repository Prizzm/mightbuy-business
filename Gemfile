source 'https://rubygems.org'

gem 'rails', '3.2.8'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-ui-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'bootstrap-sass'
  gem 'uglifier', '>= 1.0.3'
end

# Authentication
gem 'devise', '1.4.7'
gem 'omniauth-twitter'
gem 'omniauth-facebook', '1.4.0'
gem 'oa-core'
gem 'inherited_resources'
gem 'meta-tags'
gem 'cocoon'
gem 'mini_magick'
gem 'dragonfly'
gem "meta_search"
gem 'heroku'
gem 'airbrake'
gem 'configatron'
gem 'friendly_id'
gem 'activeadmin'
gem 'pg'
gem 'simple_form'
gem 'grape'
gem 'ejs'
gem 'ministry_of_state', git: "git://github.com/code-mancers/ministry_of_state.git"
gem "thin"
gem "kaminari"
gem "fog"

gem "timeline_fu", git: "git://github.com/styx/timeline_fu.git"
gem 'markitup-rails'
gem 'redcarpet'

gem "mightbuy_models", :path => "vendor/mightbuy-models"

gem 'remotipart', '~> 0.4'
gem 'facebox-rails'
gem 'jquery-fileupload-rails', '0.3.4'

group :development do
  gem 'pry-rails'
  gem "quiet_assets"
  gem 'rspec-rails', "~> 2.6"
  gem "sqlite3"
end

group :test do
  gem 'factory_girl_rails', '1.3.0'
  gem 'shoulda'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'cucumber-rails', :require => false
  gem 'email_spec'
  gem 'launchy'
  gem 'headless'
  gem "ci_reporter"
  gem 'simplecov', :platform => :mri_19
  gem 'simplecov-rcov', :require => false
  gem 'database_cleaner'
end

group :production, :development do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end