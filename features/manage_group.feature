Feature: Manage groups
  In order to manage groups
  As a admin operator
  I want be able to create, update and delete groups

	Scenario: Create a new group
		Given I have a new championship with name "Word Cup 2010"
		And I am on the list of championship
		And I follow "Word Cup 2010"
		And I follow "Criar Grupo"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		And I should see "Grupos"
		And I should see "Novo"
		And I should not see "Ex: a simple text"
		And I fill in "group_name" with "A"
		And I press "Salvar"
		Then I should see "Criação de Grupo realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		And I should see "Grupos"
		And I should see "A"