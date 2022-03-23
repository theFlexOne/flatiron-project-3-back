source "https://rubygems.org"

gem "sinatra", "~> 2.1"
gem "thin", "~> 1.8"
gem "rack-contrib", "~> 2.3"
gem "rack-cors", "~> 1.1"
gem "activerecord", "~> 6.1"
gem "sinatra-activerecord", "~> 2.0"
gem "rake", "~> 13.0"
gem "sqlite3", "~> 1.4"
gem "require_all", "~> 3.0"

# MINE
gem 'rspotify', '~> 2.11', '>= 2.11.1'
gem 'dotenv', '~> 2.7', '>= 2.7.6'

group :development do
  gem "pry", "~> 0.14.1"

  # Automatically reload when there are changes
  # https://github.com/alexch/rerun
  gem "rerun"
end

# These gems will only be used when we are running tests
group :test do
  gem "database_cleaner", "~> 2.0"
  gem "rack-test", "~> 1.1"
  gem "rspec", "~> 3.10"
  gem "rspec-json_expectations", "~> 2.2"
end
