module GamesHelper
  def self.included(clazz)
  	clazz.send(:attr_accessor, :home_name)
  	clazz.send(:attr_accessor, :visitant_name)
  end
  
  def create_equipe_game
    return false unless validate_equipe_game
    Game.create!(:round => self, :home => @home, :visitant => @visitant)
    return true
  end
  
  private
  def validate_equipe_game
    errors.add_on_blank(:home_name, 'é um campo obrigatório')
    errors.add_on_blank(:visitant_name, 'é um campo obrigatório')
    
    @home = Equipe.find_by_name(game_home_name)
    errors.add(:home_name, 'não existe') unless @home
    
    @visitant = Equipe.find_by_name(game_visitant_name)
    errors.add(:visitant_name, 'não existe') unless @visitant
    
    return errors.empty?
  end
end