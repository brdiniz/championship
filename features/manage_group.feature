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
		And I fill in "group_name" with "Série A"
		And I press "Salvar"
		Then I should see "Criação de Grupo realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		And I should see "Grupos"
		And I should see "Série A"
		
	Scenario: Edit a group
		Given I have a new championship with name "Word Cup 2010"
		And I have a new group with name "A" in championship "Word Cup 2010"
		And I am on the list of championship
		And I follow "Word Cup 2010"
		And I follow "Editar"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		And I should see "Grupos"
		And I should not see "Ex: a simple text"
		And I fill in "group_name" with "Série A"
		And I press "Salvar"
		Then I should see "Alteração de Grupo realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		And I should see "Grupos"
		And I should see "Série A"

	Scenario: Index group in championship
		Given I have a new championship with name "Brasileirao 2010"
		And I have a new group with name "A" in championship "Brasileirao 2010"
		And I am on the list of championship
		And I follow "Brasileirao 2010"
		And I follow "Visualizar"
		When I follow "Grupos"
		And I should see "Campeonatos"
		And I should see "Brasileirao 2010"
		And I should see "Grupos"
		And I should see "A"
		And I should not see "Lista de Groups"
		And I should not see "Created at"

	Scenario: Associate an equipe in group
		Given I have a new equipe with name "Palmeiras"
		And I have a new championship with name "libertadores"
		And I have a new group with name "A" in championship "libertadores"
		And I am on the list of championship
		And I follow "libertadores"
		And I should see "Campeonatos"
		And I should see "libertadores"
		And I follow "Visualizar"
		When I follow "Associar uma Equipe"
		And I should see "Campeonatos"
		And I should see "libertadores"
		And I fill in "group_equipe_name" with "Palmeiras"
		And I press "Salvar"
		Then I should see "Associação de Equipe realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "libertadores"
		And I should see "Palmeiras"
		And I should see "Desassociar"