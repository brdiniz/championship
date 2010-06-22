require 'spec_helper'

describe Championship do
  
  it "nao criar campeonato com attributos inválidos" do
    c = Championship.new
    c.should_not be_valid
    c.errors.on(:name).should_not be_blank
  end
end