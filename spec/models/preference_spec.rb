require 'spec_helper'

describe Preference do
  describe '::content_for' do
    it { Preference.should respond_to :content_for }
    it 'should return empty content for preference that doesnt exist' do
      Preference.content_for(:non_existant).should eql("")
    end
    
    it 'should return content for preference when found by name' do
      preference = Preference.create :name => 'some_preference', :description => 'Some Preference', :content => lorem
      Preference.content_for(:some_preference).should eql(preference.content)
    end
  end
end