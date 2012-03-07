module HelperMethods
  def click(content)
    click_link_or_button(content)
  end

  def login(user = nil)
    visit login_path
    user ||= User.create :username => 'test_user', :password => 'abcd1234', :password_confirmation => 'abcd1234'
    within '#loginForm' do
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => user.password
      click 'Login'
    end
    should_be_on admin_path
    user
  end
  
  def should_be_on(path)
    current_path.should eql(path)
  end
  
  def should_not_be_on(path)
    current_path.should_not eql(path)
  end
  
  def current_path
    URI.parse(current_url).path
  end
  
  def fill_in_the_following(fields)
    fields.each_pair do |field, value|
      fill_in field, :with => value
    end
  end
  
  def screenshot
    path = File.join(Rails.root, 'tmp', "webkit_screenshot-#{Time.now.to_i}.png").to_s
    page.driver.render(path)
    `open #{path}`
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance