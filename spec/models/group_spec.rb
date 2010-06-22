require 'spec_helper'

describe Group do
  
  it "nao posso criar um grupo com attributos inválidos" do
    g = Group.new
    g.should_not be_valid
    g.errors.on(:championship_id).should_not be_blank
    g.errors.on(:name).should_not be_blank
  end
  
  it "nao posso criar um grupo com mesmo nome dentro de um campeonato" do
    g = Factory(:group, :name => "A")
    g1 = Factory.build(:group, :name => g.name, :championship_id => g.championship.id)
    g1.should_not be_valid
    g1.errors.on(:name).should_not be_blank
  end

  it "posso adicionar várias equipes dentro do mesmo grupo" do
    c = Factory(:group)
    c.equipe_name = Factory(:equipe).name
    c.associate_equipe.should be_true
    c.equipe_name = Factory(:equipe).name
    c.associate_equipe.should be_true
    Group.find(c).equipes.size.should == 2
  end

  it "nao posso adicionar uma equipe dentro de um grupo que ela já esteja associada" do
    c = Factory(:group)
    e = Factory(:equipe)
    c.equipe_name = e.name
    c.associate_equipe.should be_true

    c = Group.find(c)
    c.equipe_name = e.name
    c.associate_equipe.should be_false

    Group.find(c).equipes.size.should == 1
  end
end