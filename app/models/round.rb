class Round < ActiveRecord::Base
  belongs_to :group
  
  validates_presence_of :name, :group_id
  validates_uniqueness_of :name, :scope => :group_id
end
