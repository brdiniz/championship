Feature: Manage championship
  In order to manage championships
  As a admin operator
  I want be able to create, update and delete championships

	Scenario: Create a new Championship
	  Given I am on the list of championship
		And I should see "Campeonatos"
		And I should not see "Lista de Championships"
		And I should not see "Created at"
		And I should not see "New"
		And I should see "Voltar"
		When I follow "Criar campeonato"
		And I should see "Campeonatos"
		And I should see "Novo"	
		And I should not see "Novo Campeonato"
		And I should not see "Ex: a simple text"
		And I fill in "championship_name" with "Campeonato Brasileiro 2010"
		And I press "Salvar"
	  Then I should see "Criação de Campeonato realizada com sucesso"
		And I should not see "Listar"
		And I should not see "Novo"
		And I should not see "Visualizar"
		And I should see "Campeonatos"
		And I should see "Campeonato Brasileiro 2010"
		
	Scenario: Show and Edit a Championship
		Given I have a new championship with name "Word Cup 2010"
		And I am on the list of championship
		And I follow "Word Cup 2010"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		When I follow "Editar"
		And I should see "Campeonatos"
		And I should see "Word Cup 2010"
		And I should see "Editar"
		And I should not see "Editar Championship"
		And I fill in "championship_name" with "Word Cup 2014 - Brazil"
		Then I press "Salvar"
		And I should see "Alteração de Campeonato realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "Word Cup 2014 - Brazil"
		
		
	Scenario: Associate an equipe in Championship
		Given I have a new equipe with name "Palmeiras"
		And I have a new championship with name "libertadores"
		And I am on the list of championship
		And I follow "libertadores"
		And I should see "Campeonatos"
		And I should see "libertadores"
		When I follow "Associar uma Equipe"
		And I should see "Campeonatos"
		And I should see "libertadores"
		And I fill in "championship_equipe_name" with "Palmeiras"
		And I press "Salvar"
		Then I should see "Associação de Equipe para o Campeonato realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "libertadores"
		And I should see "Palmeiras"
		And I should see "Desassociar"