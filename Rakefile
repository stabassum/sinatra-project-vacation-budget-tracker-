ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

if ENV["SINATRA_ENV"] == "development"

set :database, "sqlite3:db/development.sqlite"

elsif  ENV["SINATRA_ENV"] == "test"

    set :database, "sqlite3:db/test.sqlite"

end

# Type `rake -T` on your command line to see the available rake tasks.