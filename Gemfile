source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# .env機能
gem 'dotenv-rails'
# sorcery導入
gem 'sorcery'
gem 'jwt'
# フォーム作成
# gem 'simple_form'

# gem 'tailwindcss-rails'

group :development, :test do
  # BetterErrors
  gem 'better_errors'
  gem 'binding_of_caller'

  # Rubocop等
  gem 'rails_best_practices'
  gem 'rubocop', '~> 1.22', require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'rubocop-rails', require: false

  # RSpec
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop-rspec'

  # サンプルデータ関連
  gem 'seed-fu', '~> 2.3'
  gem 'faker'
end


group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # debugger
  gem 'pry-byebug'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  #n+1解消
  gem 'bullet'

  #ブラウザお助け
  gem 'foreman'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
