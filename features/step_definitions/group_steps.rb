Given /^I have an equipe named "([^\"]*)" associated with the group "([^\"]*)"$/ do |equipe_name, group_name|
  g = Group.find_by_name(group_name)
  g.equipe_name = equipe_name
  g.associate_equipe
end
