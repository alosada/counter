ENV['APP_ENV'] = 'test'

require './models/user'
require 'rspec'

RSpec.describe 'User' do

  it "is valid" do
    user = User.new user_params
    expect(user.valid?).to be true
  end

  it "is invalid" do
    user = User.new user_params({email: ''})
    expect(user.valid?).to be false
  end


  def user_params(attr = {})
  	{
  		email: 'foobar@bazbat.com',
  		password: 'Foobar123'
  	}.merge({})
  end
end