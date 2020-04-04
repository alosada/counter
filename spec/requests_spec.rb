ENV['APP_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'

RSpec.describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    App
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello World')
  end

  it "registers a user" do
  	params = {
  		email: 'foobar@bazbat.com',
  		password: 'Foobar123'
  	}
    post '/register', params
    expect(last_response).to be_ok
    expect(last_response.body).to eq('ok')
  end
end