require 'acceptance/acceptance_helper'

describe 'Application', :type => :acceptance do
  it 'should display dynamic contact info' do
    contact_info_preference = Preference.create(:name => 'contact_info', :description => 'Contact Information', :content => lorem)
    visit root_path
    click 'Contact'
    page.should have_content(contact_info_preference.content)
  end
end