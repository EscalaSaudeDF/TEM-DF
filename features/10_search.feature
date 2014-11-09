Feature: Search
	To find a medic
	As a system's user
	I would like to seach medics

Scenario: Search without region
	Given I am on the index page
	When I select speciality as MED. DA FAMILIA E COMUNIDADE
	And I click on 'Confirmar' button
	Then the list of medics is loaded
	
	When I click on schedules's button
	Then HUDSON DE OLIVEIRA VIRGINI's schedule is loaded

Scenario: Search without speciality
	Given I am on the index page
	When I select region as DRS - GAMA
	And I click on 'Confirmar' button
	Then the list of medics is loaded
	
	When I click on schedules's button
	Then HUDSON DE OLIVEIRA VIRGINI's schedule is loaded

Scenario: Search without speciality and region
	Given I am on the index page
	And I click on 'Confirmar' button
	Then a warning is loaded

Scenario: Clear search
	Given I am on the index page
	When I select speciality as MED. DA FAMILIA E COMUNIDADE
	When I select region as DRS - GAMA
	And I click on 'Limpar' button
	Then the field 'Especialidade' is cleared
	And the field 'Região' is cleared