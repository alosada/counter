source "https://rubygems.org"

gem "sinatra"
gem "sinatra-activerecord"    # for Active Record models
gem "rake"  # so we can run Rake tasks
gem 'rack-test'
gem 'rspec'
gem 'bcrypt'

group :production do
  # Use Postgresql for ActiveRecord
  gem 'pg'
end

group :development, :test do
  # Use SQLite for ActiveRecord
  gem "byebug"
  gem 'sqlite3'
end