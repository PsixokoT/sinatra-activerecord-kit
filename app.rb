require 'rubygems'
require 'sinatra/base'
require 'sinatra/r18n'
require 'sinatra/multi_route'
require 'sinatra/activerecord'

class App < Sinatra::Base
  helpers Sinatra::Helpers

  register Sinatra::ActiveRecordExtension
  register Sinatra::MultiRoute
  register Sinatra::R18n

  R18n::I18n.default = 'ru'
  R18n.default_places { './i18n/' }

  R18n.set('ru')
  include R18n::Helpers

  #set :database_file, './config/database.yml' #see haw it do by default

  app_folders = %w(models helpers controllers routes)
  # Require our ruby fileses
  app_folders.each do |folder|
    Dir.glob("#{folder}/*.rb").each { |file| require_relative file }
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    app_folders.each do |folder|
      Dir.glob("#{folder}/*.rb").each { |file| also_reload file }
    end
  end
end
