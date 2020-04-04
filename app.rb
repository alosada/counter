require_relative 'config/application'

class App < Sinatra::Base
  get "/" do
  	'Hello World'
  end

  post "/register" do
  	'ok'
  end
end