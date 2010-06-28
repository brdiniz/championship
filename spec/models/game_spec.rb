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
    
    group = r.group
    group.equipe_name = equipe_home.name
    group.associate_equipe
    
    group.equipe_name = equipe_visitant.name
    group.associate_equipe
    
    Game.create!(:round => r, :home_name => equipe_home.name, :visitant_name => equipe_visitant.name)
    
    g = r.games.first
    g.visitant.should == equipe_visitant
    g.home.should == equipe_home
  end
  
  it "nao posso criar um jogo caso o time não esteja dentro do grupo do campeonato" do
    r = Factory(:round)
    equipe_home = Factory(:equipe)
    equipe_visitant = Factory(:equipe)
    
    g = Game.new(:round => r, :home_name => equipe_home.name, :visitant_name => equipe_visitant.name)
    g.should_not be_valid
    g.errors.on(:visitant_name).should_not be_blank
    g.errors.on(:home_name).should_not be_blank
    
    group = g.round.group
    group.equipe_name = equipe_home.name
    group.associate_equipe
    
    group.equipe_name = equipe_visitant.name
    group.associate_equipe
    
    g = Game.new(:round => r, :home_name => equipe_home.name, :visitant_name => equipe_visitant.name)
    g.should be_valid
  end
  
  it "nao posso criar um jogo caso o time ja possua um jogo existente na mesma rodada" do
    r = Factory(:round)
    equipe_home = Factory(:equipe)
    equipe_visitant = Factory(:equipe)
    equipe = Factory(:equipe)
    equipe_champion = Factory(:equipe)
    
    group = r.group
    group.equipe_name = equipe_home.name
    group.associate_equipe
    
    group.equipe_name = equipe_visitant.name
    group.associate_equipe

    Game.create!(:round => r, :home_name => equipe_home.name, :visitant_name => equipe_visitant.name)
    
    g = Game.new(:round => r, :home_name => equipe.name, :visitant_name => equipe_visitant.name)
    g.should_not be_valid
    g.errors.on(:visitant_name).should_not be_blank
    
    g = Game.new(:round => r, :home_name => equipe.name, :visitant_name => equipe_home.name)
    g.should_not be_valid
    g.errors.on(:visitant_name).should_not be_blank
    
    
    g = Game.new(:round => r, :home_name => equipe_visitant.name, :visitant_name => equipe.name)
    g.should_not be_valid
    g.errors.on(:home_name).should_not be_blank
    
    g = Game.new(:round => r, :home_name => equipe_home.name, :visitant_name => equipe.name)
    g.should_not be_valid
    g.errors.on(:home_name).should_not be_blank
  end
end