require 'sinatra'

class App < Sinatra::Base
  get '/' do
    p "Hey from Sinatra"
  end
end
