require 'acceptance/acceptance_helper'

describe 'Admin Preferences', :type => :acceptance do
  before :each do
    @admin_user = User.create :username => 'admin', :password => 'abcd1234'
    login(@admin_user)
  end
  
  it 'should list preferences' do
    1.upto 5 do |i|
      Preference.create :name => "preference_#{i}", :description => "Preference #{i}", :content => lorem
    end
    should_be_on admin_path
    click 'Manage Preferences'
    1.upto 5 do |i|
      page.should have_content("preference_#{i}")
      page.should have_content("Preference #{i}")
    end
  end
  
  it 'should be able to create a new preference' do
    should_be_on admin_path
    click 'Manage Preferences'
    click 'New Preference'
    content = lorem
    fill_in_the_following({
      'Name' => 'new_preference',
      'Description' => 'New Preference',
      'Content' => content
    })
    click 'Create Preference'
    page.should have_content('new_preference')
    page.should have_content('New Preference')
    page.should have_content(content)
    should_be_on admin_preference_path(Preference.find_by_name('new_preference'))
  end
  
  it 'should be able to edit an existing preference' do
    preference = Preference.create :name => 'new_preference', :description => 'New Preference', :content => lorem
    should_be_on admin_path
    click 'Manage Preference'
    within("#preference_#{preference.id}") do
      click 'Edit'
    end
    should_be_on edit_admin_preference_path(preference)
    content = lorem
    fill_in_the_following({
      'Name' => 'some_preference',
      'Description' => 'Some Preference',
      'Content' => content
    })
    click 'Update Preference'
    should_be_on admin_preference_path(preference)
    preference.reload
    page.should have_content('some_preference')
    page.should have_content('Some Preference')
    page.should have_content(content)
  end
  
  it 'should be able to delete preferences' do
    old_preference = Preference.create :name => 'old_preference', :description => 'Old Preference', :content => lorem
    should_be_on admin_path
    click 'Manage Preferences'
    within("#preference_#{old_preference.id}") do
      click 'Destroy'
    end
    visit admin_preferences_path
    page.should_not have_content('old_preference')
    page.should_not have_content('Old Preference')
  end
end