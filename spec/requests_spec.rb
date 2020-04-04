ENV['APP_ENV'] = 'test'

require './app'
require 'rspec'
require 'rack/test'

RSpec.describe 'The HelloWorld App' do
  include Rack::Test::Methods

  after(:all) { User.destroy_all}
  let(:user_params) { generate_user_params }

  def app
    App
  end

  it "registers a user" do
    user_params = generate_user_params
    post '/register', user_params
    expect(last_response).to be_ok
    body = JSON.parse(last_response.body)
    expect(body['token']).to be_truthy
    expect(body['token'].length).to eq(80)
  end

  def generate_user_params(attributes = {})
    {
      email: 'foobar@bazbat.com',
      password: 'Foobar123'
    }.merge(attributes)
  end
end