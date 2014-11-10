#language: en

Feature: Generate medics per work unit graph
	To monitor the medic distribution 
	As a system user
	I would like to see a graph

Scenario: access the graph
	Given I am on the index page
	When I click on 'Grafico' link
	Then the graph page is loaded