Feature: Manage rounds
  In order to manage rounds
  As a admin operator
  I want be able to create, update and delete rounds

	Scenario: Create a new round
		Given I have a new championship with name "Brasileirão 2010"
		And I have a new group with name "Série A" in championship "Brasileirão 2010"
		And I am on the list of championship
		And I follow "Brasileirão 2010"
		And I follow "Visualizar"
		When I follow "Criar Rodada"
		And I should see "Campeonatos"
		And I should see "Brasileirão 2010"
		And I should see "Grupos"
		And I should see "Série A"
		And I should see "Rodadas"
		And I should see "Novo"
		And I should not see "Novo Round"
		And I should not see "Ex: a simple text"
		And I fill in "round_name" with "primeira rodada"
		And I press "Salvar"
		Then I should see "Criação de Rodada realizada com sucesso"
		And I should see "Campeonatos"
		And I should see "Brasileirão 2010"
		And I should see "Grupos"
		And I should see "Série A"
		And I should see "Rodadas"
		And I should see "primeira rodada"