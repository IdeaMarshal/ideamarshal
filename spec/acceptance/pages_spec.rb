require 'acceptance/acceptance_helper'

describe 'Page', :type => :acceptance do
  it 'should be able to get to dynamically made pages' do
    dynamic_page = Page.create :title => 'Lorem Ipsum', :url => 'lorem_ipsum', :content => lorem
    visit page_path(:id => dynamic_page.url)
    page.should have_content(dynamic_page.content)
  end
end