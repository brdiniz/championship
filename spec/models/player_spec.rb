require 'spec_helper'

describe Player do
  
  it "Nao pode ser criado um jogador com attributos" do
    p = Player.new
    p.should_not be_valid
    p.errors.on(:equipe_id).should_not be_blank
    p.errors.on(:number).should_not be_blank
    p.errors.on(:name).should_not be_blank
  end
  
  it "Nao pode ser criado um jogador com o mesmo número no time" do
    p = Factory(:player)
    p1 = Factory.build(:player, :number => p.number, :equipe_id => p.equipe.id)
    p1.should_not be_valid
    p1.errors.on(:number).should_not be_blank
  end
end