require 'spec_helper'

describe ChampionshipsController do
  
  it "posso associar uma equipe ao campeonato" do
    c = Factory(:championship)
    e = Factory(:equipe)
    
    post :manage_equipe, :id => c.id, :championship => {:equipe_name => e.name}
    
    Championship.find(c).equipes.should include e
  end
  
  it "posso remover uma equipe de um campeonato" do
    c = Factory(:championship)
    e = Factory(:equipe)
    
    c.equipes << e
    
    delete :manage_equipe, :id => c.id, :equipe_id => e.id
    
    Championship.find(c).equipes.should_not include e
  end
end