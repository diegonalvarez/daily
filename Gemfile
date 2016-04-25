source 'https://rubygems.org'

ruby '2.2.2'

gem 'sinatra'
gem 'json'
gem 'hipchat'
gem 'data_mapper'
gem 'sinatra-contrib'

group :production do
    gem "pg"
    gem "dm-postgres-adapter"
end

group :development, :test do
    gem "sqlite3"
    gem "dm-sqlite-adapter"
end