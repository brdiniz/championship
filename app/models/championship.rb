class Championship < ActiveRecord::Base
  has_many :groups, :dependent => :destroy
  validates_presence_of :name
    
end
