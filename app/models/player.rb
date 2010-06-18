class Player < ActiveRecord::Base
  belongs_to :equipe
  
  validates_presence_of :name, :equipe_id, :number
  validates_uniqueness_of :number, :scope => :equipe_id
end
