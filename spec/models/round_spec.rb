require 'spec_helper'

describe Round do
  
  it "nao posso criar uma rodada sem os campos obrigatorios" do
    r = Round.new
    r.should_not be_valid
    r.errors.on(:group_id).should_not be_blank
    r.errors.on(:name).should_not be_blank
  end
  
  it "Nao pode ser criado uma rodada com o mesmo nome no grupo de um campeonato" do
    r = Factory(:round)
    r1 = Factory.build(:round, :name => r.name, :group_id => r.group.id)
    r1.should_not be_valid
    r1.errors.on(:name).should_not be_blank
  end
end