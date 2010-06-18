Feature: Manage player
  In order to manage players
  As a admin operator
  I want be able to create, update and delete players

	Scenario: Create a new player
		Given I have a new equipe with name "Palmeiras"
		And I am on the list of equipe
		And I follow "Palmeiras"
		And I follow "Lista de Jogadores"
		And I should see "Equipes"
		And I should see "Palmeiras"
		And I should see "Jogadores"
		And I should not see "Lista de Players"
		And I should not see "Created at"
		Then I follow "Criar Jogador"
		And I should see "Equipes"
		And I should see "Palmeiras"
		And I should see "Jogadores"
		And I should see "Novo"
		And I fill in "player_number" with "12"
		And I fill in "player_name" with "Marcos"
		And I press "Salvar"
	  Then I should see "Criação de Jogador realizada com sucesso"
		And I should see "Palmeiras"
		And I should see "12"
		And I should see "Marcos"
		