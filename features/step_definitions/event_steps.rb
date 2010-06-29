Given /^I have a new game with "([^\"]*)" and "([^\"]*)" in round "([^\"]*)"$/ do |equipe_home, equipe_visitant, round_name|
  Game.create!(:round => Round.find_by_name(round_name), :home_name => equipe_home, :visitant_name => equipe_visitant)
end