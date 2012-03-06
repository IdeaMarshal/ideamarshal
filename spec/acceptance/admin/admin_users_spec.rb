require 'acceptance/acceptance_helper'

describe 'Admin Users', :type => :acceptance do
  before :each do
    @admin_user = User.create :username => 'admin', :password => 'abcd1234'
    login(@admin_user)
  end
  
  it 'should list users' do
    1.upto 5 do |i|
      User.create :username => "user_#{i}", :password => 'secret'
    end
    should_be_on admin_path
    click 'Manage Users'
    1.upto 5 do |i|
      page.should have_content("user_#{i}")
    end
  end
  
  it 'should be able to create a new user' do
    should_be_on admin_path
    click 'Manage Users'
    click 'New User'
    fill_in_the_following({
      'Username' => 'new_user',
      'Password' => 'secret',
      'Password confirmation' => 'secret'
    })
    click 'Create User'
    should_be_on admin_users_path
    page.should have_content('new_user')
  end
  
  it 'should be able to edit an existing user' do
    user = User.create :username => 'new_user', :password => 'secret'
    should_be_on admin_path
    click 'Manage Users'
    within("#user_#{user.id}") do
      click 'Edit'
    end
    should_be_on edit_admin_user_path(user)
    fill_in_the_following({
      'Username' => 'some_user',
      'Password' => 'new_secret',
      'Password confirmation' => 'new_secret'
    })
    click 'Update User'
    should_be_on admin_users_path
    page.should have_content('some_user')
  end
  
  it 'should be able to delete users' do
    user = User.create :username => 'new_user', :password => 'secret'
    should_be_on admin_path
    click 'Manage Users'
    within("#user_#{user.id}") do
      click 'Destroy'
    end
    visit admin_users_path
    page.should_not have_content('new_user')
  end
end