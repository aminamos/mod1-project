require 'pry'

ENV["SINATRA_ENV"] ||= "development"
require_relative './bin/run.rb'

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end

task :start do
  startCLI
end

task :test do
  load "./test/test_create.rb"
end

