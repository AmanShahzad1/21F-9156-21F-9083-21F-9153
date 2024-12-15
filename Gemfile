source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Core Rails and dependencies
gem "rails", "~> 7.0.8"                # Core Rails framework
gem "sprockets-rails"                 # Asset pipeline
gem "sqlite3", "~> 1.4"               # SQLite for development (consider changing for production)
gem "puma", "~> 5.6"                  # Web server
gem "importmap-rails"                 # JavaScript with ESM import maps
gem "turbo-rails"                     # Hotwire's SPA-like page accelerator
gem "stimulus-rails"                  # Hotwire's JavaScript framework
gem "jbuilder"                        # JSON API builder
gem 'devise', '~> 4.8', '>= 4.8.1'    # Authentication library

# Platform compatibility and optimizations
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Timezone data for Windows
gem "bootsnap", require: false                                  # Reduces boot times

# Optional: Uncomment for specific use cases
# gem "sassc-rails"                     # CSS preprocessing with Sass
# gem "image_processing", "~> 1.2"      # Active Storage variants
# gem "redis", "~> 4.0"                 # Redis adapter for production
# gem "kredis"                          # Higher-level data types in Redis

# Static code analysis
gem 'rubocop', '~> 1.24', require: false

group :development, :test do
  # Debugging tools
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  
  # Testing framework
  gem 'rspec-rails', '~> 5.0'
  
  # Manage environment variables (optional, for easier config management)
  gem 'dotenv-rails'
end

group :development do
  # Interactive console in the browser
  gem "web-console"

  # Add speed badges [optional performance monitoring]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps
  # gem "spring"
end

group :test do
  # System testing
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  # Recommended for production if switching to PostgreSQL
  # gem 'pg', '~> 1.2'

  # Optional: Monitoring and error tracking
  # gem 'newrelic_rpm'                 # Performance monitoring
  # gem 'sentry-raven'                 # Error tracking
end
