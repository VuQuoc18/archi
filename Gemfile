source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"
gem "bcrypt"
gem "bootsnap", ">= 1.4.2", require: false
gem "config"
gem "figaro"
gem "jsonapi-serializer"
gem "jwt"
gem "mysql2"
gem "paranoia"
gem "puma", "~> 4.1"
gem "rack-cors"
gem "rails", "~> 6.1.3"

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rspec-request_describer"
  gem "rubocop-rails", require: false
  gem "simplecov", require: false
  gem "simplecov-cobertura"
end

group :development do
  gem "capistrano", "~> 3.14", require: false
  gem "capistrano3-puma"
  gem "capistrano-rails"
  gem "capistrano-rvm"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 4.1.0"
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
