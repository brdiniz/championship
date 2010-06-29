class Game < ActiveRecord::Base
  belongs_to :round
  belongs_to :home, :class_name => "Equipe", :foreign_key => "home_id"
  belongs_to :visitant, :class_name => "Equipe", :foreign_key => "visitant_id"
  has_many :events

  validate :save_home_visitant
  
  attr_accessor :home_name, :visitant_name
  
  validates_presence_of :round_id, :home_name, :visitant_name
  
  def save_home_visitant
    return false unless validate_equipe_game
    self.home = @home
    self.visitant = @visitant
    return true
  end
  
  def validate_equipe_game
    @home = Equipe.find_by_name(home_name)
    @visitant = Equipe.find_by_name(visitant_name)
    
    errors.add(:home_name, 'não existe') unless @home
    errors.add(:visitant_name, 'não existe') unless @visitant
    
    errors.add(:visitant_name, 'já possui jogo nessa rodada') if @visitant && (self.round.games.find_by_visitant_id(@visitant.id) || self.round.games.find_by_home_id(@visitant.id))
    errors.add(:home_name, 'já possui jogo nessa rodada') if @home && (self.round.games.find_by_visitant_id(@home.id) || self.round.games.find_by_home_id(@home.id))
    
    errors.add(:visitant_name, 'não pertence ao grupo da rodada') if @visitant && !(self.round.group.equipes.include?(@visitant))
    errors.add(:home_name, 'não pertence ao grupo da rodada') if @home && !(self.round.group.equipes.include?(@home))

    return errors.empty?
  end
end
