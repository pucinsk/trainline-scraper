# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "httparty"

group :development, :test do
  gem "byebug"
end

group :development do
  gem "rubocop", "~> 1.56", ">= 1.56.4"
  gem "rubocop-performance", "~> 1.19", ">= 1.19.1"
  gem "rubocop-rspec", "~> 2.24", ">= 2.24.1"
end

group :test do
  gem "rspec", "~> 3.12"
  gem "webmock"
end
