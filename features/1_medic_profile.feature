#language: en

Feature: Medic's profile
	To check a medic's reputation
	As a system's user
	I would like to view the medic's profile

Scenario: Seeing a medic's profile
	Given I am on the index page
	When I select speciality as MED. DA FAMILIA E COMUNIDADE
	And I click on 'Confirmar' button
	Then the list of medics is loaded
	When I click on HUDSON DE OLIVEIRA VIRGINI
	Then the profile is loaded

Scenario: Seeing a medic'c schedule
	Given I am on the medic's profile
	When I click on schedules's button
	Then the HUDSON DE OLIVEIRA VIRGINI's schedule is loaded
