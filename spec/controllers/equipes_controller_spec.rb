require 'spec_helper'

describe EquipesController do
  
  it "posso associar uma equipe ao campeonato" do
    c = Factory(:group)
    e = Factory(:equipe)
    
    post :associate, :id => c.id, :group => {:equipe_name => e.name}
    
    Group.find(c).equipes.should include e
  end
  
  it "posso remover uma equipe de um campeonato" do
    c = Factory(:group)
    e = Factory(:equipe)
    
    c.equipes << e
    
    delete :associate, :id => c.id, :equipe_id => e.id
    
    Group.find(c).equipes.should_not include e
  end
end