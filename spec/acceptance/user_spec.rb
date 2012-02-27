require 'acceptance/acceptance_helper'

describe 'User', :type => :acceptance do
  it 'should be able to login' do
    user = User.create :username => 'test_user', :password => 'abcd1234', :password_confirmation => 'abcd1234'
    visit home_path
    click 'Login'
    fill_in 'Username', :with => 'test_user'
    fill_in 'Password', :with => 'abcd1234'
    click 'Login'
    current_path.should eql(root_path)
    page.should have_content('Welcome test_user')
  end
  
  it 'should be able to logout' do
    user = login
    visit logout_path
    current_path.should eql(root_path)
    page.should have_content('Login')
  end
end