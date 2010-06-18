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
end