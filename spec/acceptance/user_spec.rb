require 'acceptance/acceptance_helper'

describe 'User', :type => :acceptance do
  it 'should be able to login' do
    login.class.should eql(User)
  end
  
  it 'should be able to logout' do
    user = login
    visit logout_path
    should_be_on root_path
    visit admin_path
    should_be_on login_path
  end
end