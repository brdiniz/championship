class Group < ActiveRecord::Base
  belongs_to :championship
  
  validates_presence_of :name, :championship_id
  validates_uniqueness_of :name, :scope => :championship_id 
end
