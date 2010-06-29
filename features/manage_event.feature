Feature: Manage events
  In order to manage events
  As a admin operator
  I want be able to create, update and delete events


	Scenario: Create a new event
		Given I have a new championship with name "Brasileirão 2010"
		And I have a new group with name "Série A" in championship "Brasileirão 2010"
		And I have a new round with name "1" in group "Série A"
		And I have a new equipe with name "África do Sul"
		And I have an equipe named "África do Sul" associated with the group "Série A"
		And I have a new equipe with name "México"
		And I have an equipe named "México" associated with the group "Série A"
		And I have a new game with "África do Sul" and "México" in round "1"
		And I am on the list of championship
		And I follow "Brasileirão 2010"
		And I follow "Visualizar"
		And I follow "1"
		And I follow "Visualizar"
		And I should see "Time da Casa"
		And I should see "Time Visitante"
		When I follow "Criar Evento"
		And I should see "Jogo"
		And I should see "África do Sul X México"
		And I should see "Evento"
		And I should see "Novo"
		And I fill in "event_name" with "CARTAO AMARELO"
		And I fill in "event_equipe_name" with "México"
		And I fill in "event_kind" with "1 TEMPO"
		And I fill in "event_linetime" with "13"
		And I press "Salvar"
		And I should see "Criação de Evento realizada com sucesso"