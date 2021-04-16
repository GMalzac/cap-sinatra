require 'sinatra'
require 'json'
require 'digest'

class App2 < Sinatra::Base
  before do 
    content_type :json
  end
  
  get '/' do
    { status: :ok }.to_json
  end
  
  get '/:name' do
    {
      name: params[:name],
      digest: Digest::SHA256.base64digest(params[:name])
    }.to_json
  end
end
