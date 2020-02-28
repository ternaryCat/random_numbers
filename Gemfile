source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'puma', '~> 4.1'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'dry-initializer'
gem 'dry-validation'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'capybara'
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'rubocop-rails'
  gem 'rubocop-performance'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
