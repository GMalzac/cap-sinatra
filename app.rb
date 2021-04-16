require 'sinatra'
require 'json'
require 'digest'

class App < Sinatra::Base
  before do
    content_type :json
  end
  
  get '/' do
    { status: :ok}.to_json
  end
  
  get '/:name' do
    Shared::Person.new(params[:name]).to_json
  end
end
