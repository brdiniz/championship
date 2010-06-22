class Game < ActiveRecord::Base
  belongs_to :round
  belongs_to :home, :polymorphic => true
  belongs_to :visitant, :polymorphic => true
  
  attr_accessor :equipe_home_name, :equipe_visitant_name 
  
  validates_presence_of :round_id, :equipe_home_name, :equipe_visitant_name
  
  before_create :associate_equipe
  
  def associate_equipe
    home = round.group.equipes.find_by_name(equipe_home_name)
    visitant = round.group.equipes.find_by_name(equipe_visitant_name)
    return true
  end
end
