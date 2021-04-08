# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test do
    gem 'rspec'
    gem 'capybara'
end

group :development do
    gem 'sinatra'

end

group :test, :development do
    gem 'pg'
    gem 'rake'
    gem 'sinatra-activerecord'
end
