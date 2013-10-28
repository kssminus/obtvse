source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'

# Extention libraries
gem 'thin', '~> 1'

# Rendering engines and vendor libraries
gem 'jquery-rails', '~> 2'
gem 'redcarpet'

# Misc libraries
# gem 'bcrypt-ruby', '~> 3', require: 'bcrypt'
gem 'stringex', '~> 1'
gem 'kaminari', '~> 0.13'

# sitemap generator
gem 'sitemap'

gem 'newrelic_rpm', '~> 3'
group :production do
  # gem 'newrelic_rpm', '~> 3'
  # gem 'dalli', '~> 1'
  #gem 'pg', '~> 0.13'
end

group :development do
  # gem 'heroku', '~> 2'
  # gem 'capistrano', '~> 2.9'
  # gem 'guard', '~> 1'
  # gem 'guard-rspec', '~> 0.6'
  # gem 'guard-spork', '~> 0.5'
  gem 'rails_best_practices', '~> 1'
  gem 'quiet_assets'
end


group :test do
  gem 'capybara', '~> 1'
  gem 'spork', '~> 0.9'
  gem 'database_cleaner', '~> 0.7'
end

group :development, :test do
  gem 'foreman', '~> 0.40'
  gem 'sqlite3', '~> 1', platform: [:ruby, :mswin, :mingw]
  gem 'faker', '~> 1'
  gem 'factory_girl_rails', '~> 1'
end

gem 'sass-rails', '~> 4.0.0'
#gem 'coffee-rails', '~> 3'
gem 'uglifier', '~> 1'
gem 'therubyracer', '~> 0.11'
gem 'turbolinks'
gem 'jquery-turbolinks'

# ActiveRecord::SessionStore substitution
gem 'activerecord-session_store'
