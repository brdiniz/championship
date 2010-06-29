require 'spec_helper'

describe Event do
  
  it "nao posso criar um evento com parametros inválidos" do
    e = Event.new
    e.should_not be_valid
    e.errors.add(:game_id).should_not be_blank
    e.errors.add(:equipe_id).should_not be_blank
    e.errors.add(:kind).should_not be_blank
    e.errors.add(:linetime).should_not be_blank
  end
  
  it "posso associar um time do jogo" do
    r = Factory(:round)
    equipe_home = Factory(:equipe)
    equipe_visitant = Factory(:equipe)
    
    group = r.group
    group.equipe_name = equipe_home.name
    group.associate_equipe
    
    group.equipe_name = equipe_visitant.name
    group.associate_equipe
    
    g = Game.create!(:round => r, :home_name => equipe_home.name, :visitant_name => equipe_visitant.name)
    
    e = Event.new(:game => g, :equipe_name => equipe_home.name, :name => "CARTAO AMARELO", :kind => "1 TEMPO", :linetime => "13")
    e.should be_valid
  end
end