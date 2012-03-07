class Preference < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :description
  validates_presence_of :content
  
  def self.content_for(name)
    Preference.find_by_name(name.to_s).try(:content) || ""
  end
end