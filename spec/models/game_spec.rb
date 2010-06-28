require 'spec_helper'

describe Game do
  
  it "nao posso criar um jogo sem os campos obrigatorios" do
    g = Game.new
    g.should_not be_valid
    g.errors.on(:round_id).should_not be_blank
    g.errors.on(:home_name).should_not be_blank
    g.errors.on(:visitant_name).should_not be_blank
  end
  
  it "posso associar equipes que estão no grupo dentro de um jogo" do
    r = Factory(:round)
    equipe_home = Factory(:equipe)
    equipe_visitant = Factory(:equipe)
    
    Game.create!(:round => r, :home_name => equipe_home.name, :visitant_name => equipe_visitant.name)
    
    g = r.games.first
    g.visitant.should == equipe_visitant
    g.home.should == equipe_home
  end
end