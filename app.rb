require_relative 'config/application'

class App < Sinatra::Base
  SECRET = "c7a5b6b7aa79422fe6e81ebd6611d01b"

  get "/" do
  	'Hello World'
  end

  post "/register" do
  	user = User.new(params)
  	user.save
  	token = JWT.encode({user: user.id}, SECRET, 'HS256')
  	json({token: token})  
  end

  private

  def to_json_api(resource)
  	{
  	  type: resource.class.to_s.downcase,
  	  id: resource.id,
  	  attribures: resource.public_attributes
  	}
  end
end