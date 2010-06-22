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
end