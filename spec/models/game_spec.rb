require 'spec_helper'

describe Game do
  
  it "nao posso criar um jogo sem os campos obrigatorios" do
    g = Game.new
    g.should_not be_valid
    g.errors.on(:round_id).should_not be_blank
    g.errors.on(:equipe_home_name).should_not be_blank
    g.errors.on(:equipe_visitant_name).should_not be_blank
  end
  
  it "posso associar equipes que estão no grupo dentro de um jogo" do
    r = Factory(:round)
    equipe_home = Factory(:equipe)
    equipe_visitant = Factory(:equipe)
    
    r.group.equipe_name = equipe_home.name
    r.group.associate_equipe.should be_true
    r.group.equipe_name = equipe_visitant.name
    r.group.associate_equipe.should be_true
    
    g = Game.create!(:round => r, :equipe_home_name => equipe_home.name, :equipe_visitant_name => equipe_visitant.name)
    g.should be_valid
    
    g1 = Game.find(g)
    g1.home = equipe_home
    g1.visitant = equipe_visitant
  end
end