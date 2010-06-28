class Round < ActiveRecord::Base
  include GamesHelper

  belongs_to :group
  has_many :games, :dependent => :destroy  
  
  validates_presence_of :name, :group_id
  validates_uniqueness_of :name, :scope => :group_id
end
