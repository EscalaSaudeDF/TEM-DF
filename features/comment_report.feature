#language: en

Feature: Comment Report
	To report a comment
	As a system's user
	I would like to report a comment

Scenario: Reporting a comment
	Given I am on the index page
	When I select speciality as MED. DA FAMILIA E COMUNIDADE
	And I click on 'Confirmar' button
	Then the list of medics is loaded
	When I click on ANA PAULA DELGADO CAVALCANTE
	Then the profile is loaded

	When I click on '!' link
	And I confirm popup
	Then the profile is loaded