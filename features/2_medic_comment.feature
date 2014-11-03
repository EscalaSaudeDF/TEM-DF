#language: en

Feature: Medic's comment
	To comment about a medic's reputation
	As a system's user
	I would like to write a comment

Scenario: Logging in
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

	When I select speciality as MED. DA FAMILIA E COMUNIDADE
	And I click on 'Confirmar' button
	Then the list of medics is loaded
	When I click on HUDSON DE OLIVEIRA VIRGINI
	Then the profile is loaded

	When I fill 'Comentário' field
	And I click on 'Enviar' button
	Then the profile is loaded
