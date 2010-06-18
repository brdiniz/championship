class Championship < ActiveRecord::Base
  has_and_belongs_to_many :equipes, :join_table => :equipes_championships
  validates_presence_of :name
    
  attr_accessor :equipe_name
  
  def associate_equipe
    equipes << Equipe.find_by_name(equipe_name)
    return true
  end
end
