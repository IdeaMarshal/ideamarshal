require 'acceptance/acceptance_helper'

describe 'Admin Pages', :type => :acceptance do
  before :each do
    @admin_user = User.create :username => 'admin', :password => 'abcd1234'
    login(@admin_user)
  end
  
  it 'should list pages' do
    1.upto 5 do |i|
      Page.create :title => "Page #{i}", :url => "page_#{i}", :content => lorem
    end
    should_be_on admin_path
    click 'Manage Pages'
    1.upto 5 do |i|
      page.should have_content("Page #{i}")
      page.should have_content("page_#{i}")
    end
  end
  
  it 'should be able to create a new page' do
    should_be_on admin_path
    click 'Manage Pages'
    click 'New Page'
    content = lorem
    fill_in_the_following({
      'Title' => 'New Page',
      'URL' => 'new_page',
      'Content' => content
    })
    click 'Create Page'
    new_page = Page.find_by_url 'new_page'
    new_page.should_not be_nil
    should_be_on admin_page_path(new_page)
    visit admin_pages_path
    page.should have_content('New Page')
    page.should have_content('new_page')
    page.should have_content(content)
  end
  
  it 'should be able to edit an existing page' do
    old_page = Page.create :title => 'Old Page', :url => 'old_page', :content => lorem
    should_be_on admin_path
    click 'Manage Pages'
    within("#page_#{old_page.id}") do
      click 'Edit'
    end
    should_be_on edit_admin_page_path(old_page)
    content = lorem
    fill_in_the_following({
      'Title' => 'Updated Page',
      'URL' => 'updated_page',
      'Content' => content
    })
    click 'Update Page'
    should_be_on admin_page_path(old_page)
    old_page = Page.find old_page.id
    page.should have_content('Updated Page')
    page.should have_content('updated_page')
    page.should have_content(content)
  end
  
  it 'should be able to delete users' do
    old_page = Page.create :title => 'Old Page', :url => 'old_page', :content => lorem
    should_be_on admin_path
    click 'Manage Pages'
    within("#page_#{old_page.id}") do
      click 'Destroy'
    end
    visit admin_pages_path
    page.should_not have_content('Old Page')
  end
end