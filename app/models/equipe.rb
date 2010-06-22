class Equipe < ActiveRecord::Base
  has_many :players
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  
  def <=>(other)
    self.name <=> other.name
  end
end
