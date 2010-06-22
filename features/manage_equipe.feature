Feature: Manage equipes
  In order to manage equipes
  As a admin operator
  I want be able to create, update and delete equipes

	Scenario: Create a new Equipe
	  Given I am on the list of equipe
		And I should see "Equipes"
		And I should not see "Lista de Equipes"
		And I should not see "Created at"
		And I should not see "New"
		And I should see "Voltar"
		And I follow "Criar equipe"
		And I should see "Equipes"
		And I should see "Novo"	
		And I should not see "Novo Equipe"
		And I should not see "Ex: a simple text"
		And I fill in "equipe_name" with "Palmeiras"
		And I press "Salvar"
	  Then I should see "Criação de Equipe realizada com sucesso"
		And I should see "Equipes"
		And I should see "Palmeiras"
		And I should not see "Novo"
		And I should not see "Visualizar"
		
	Scenario: Edit an equipe
		Given I have a new equipe with name "Brasil"
		And I am on the list of equipe
		When I follow "Editar"
		And I should not see "Listar"
		And I should not see "Novo"
		And I should see "Equipes"
		And I should see "Brasil"
		And I fill in "equipe_name" with "Seleção Brasileira"
		And I press "Salvar"
		Then I should see "Alteração de Equipe realizada com sucesso"
		And I should see "Seleção Brasileira"