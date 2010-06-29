class Event < ActiveRecord::Base
  belongs_to :game
  belongs_to :equipe
  
  attr_accessor :equipe_name
  
  before_save :associate_equipe
  
  validates_presence_of :game_id, :kind, :linetime, :equipe_name
  
  def associate_equipe
    return false unless validate_equipe
    equipe = @e
    return true
  end
  
  private 
  def validate_equipe
    @e = Equipe.find_by_name(equipe_name)
    
    errors.add(:equipe_name, 'não existe') unless @e
    
    errors.add(:equipe_name, 'não pertence ao grupo da rodada') if @e && !(self.game.round.group.equipes.include?(@e))
    
    return errors.empty?
  end
end
