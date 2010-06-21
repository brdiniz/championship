require 'spec_helper'

describe Championship do
  
  it "nao criar campeonato com attributos inválidos" do
    c = Championship.new
    c.should_not be_valid
    c.errors.on(:name).should_not be_blank
  end
  
  it "posso adicionar várias equipes dentro do campeonato" do
    c = Factory(:championship)
    c.equipe_name = Factory(:equipe).name
    c.associate_equipe.should be_true
    c.equipe_name = Factory(:equipe).name
    c.associate_equipe.should be_true
    Championship.find(c).equipes.size.should == 2
  end
  
  it "nao posso adicionar uma equipe dentro de um campeonato que ela já esteja associada" do
    c = Factory(:championship)
    e = Factory(:equipe)
    c.equipe_name = e.name
    c.associate_equipe.should be_true
    
    c = Championship.find(c)
    c.equipe_name = e.name
    c.associate_equipe.should be_false
    
    Championship.find(c).equipes.size.should == 1
  end
end