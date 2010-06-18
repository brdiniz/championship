require 'spec_helper'

describe Equipe do
  
  it "nao posso criar um time sem os campos obrigatorios" do
    e = Equipe.new
    e.should_not be_valid
    e.errors.on(:name).should_not be_blank
  end
  
  it "nao posso criar um time com mesmo nome" do
    Factory(:equipe, :name => "Flamengo")
    e = Factory.build(:equipe, :name => "Flamengo")
    e.should_not be_valid
    e.errors.on(:name).should_not be_blank
    e.name = "Palmeiras"
    e.should be_valid
  end
end