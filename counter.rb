require_relative 'config/application'

class Counter < Sinatra::Base
  SECRET = ENV['SECRET'] || "secret"

  before do
  	return unless request.env['CONTENT_TYPE'] == "application/json" 
    request.body.rewind
    params.merge!(JSON.parse request.body.read)
  end

  get "/" do
  	erb :index
  end

  post "/register" do
  	@user = User.new(params)
  	return json({token: set_token}) if @user.save
  	halt 400, "'I have a bad feelign about this' (#{@user.errors.full_messages.join(', ')})\n"
  end

  post "/login" do
  	halt 401, "'Who is this? Whats your operating number?' (Bad credentials)\n" unless good_login?
    json({token: set_token})
  end

  get "/v1/current" do
    protect!
    json(to_json_api(user))
  end

  get "/v1/next" do
  	protect!
  	user.counter +=1
  	user.save
  	json(to_json_api(user))
  end

  put "/v1/next" do
  	protect!
  	user.counter = params[:current] || 1
  	user.save
  	json(to_json_api(user))
  end

  private

  def to_json_api(resource)
  	{
  	  type: resource.class.to_s.downcase,
  	  id: resource.id,
  	  attributes: resource.public_attributes
  	}
  end

  def set_token
  	JWT.encode({user_id: @user.id}, SECRET, 'HS256')
  end

  def token
  	@token ||= request.env['HTTP_AUTHORIZATION'].split(' ').last
  rescue StandardError => _e
  	nil
  end

  def user
  	@user ||= User.find_by_email(params[:email])
  end

  def good_login?
  	user.present? && user.password == params[:password]
  end

  def protect!
  	return nil if authorized?
  	headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
  	halt 403, "'All other information on your level is restricted'(Forbidden)\n"
  end

  def authorized?
  	return false if token.nil?
  	data = JWT.decode(token, SECRET, true, {algorithm: 'HS256'})[0]
  	@user = User.find_by(id: data['user_id'])
  	@user.present?
  rescue StandardError => _e
  	false
  end
end