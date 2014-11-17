#language: en

Feature: Generate medics per work unit graph
	To monitor the medic distribution 
	As a system user
	I would like to see a graph

Scenario: access the graph
	Given I am on the index page
	When I click on 'Gráficos' link
	Then the graph page is loaded
	And I click on 'DRS - GAMA' link
	Then I wait 5 seconds


