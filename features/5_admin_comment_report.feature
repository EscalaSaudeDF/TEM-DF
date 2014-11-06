#language: en

Feature: Admin Comment Report
	To prevent improper comments
	As a system administrator
	I would like to disable a comment

Scenario: Deactivate, Reactivate and Disable a comment
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

	When I click on '!' link
	And I confirm popup
	Then the profile is loaded

 	When I click on 'admin' link
 	And I click on 'Denúncias' link
 	Then report's page is loaded

 	When I click on 'Desativar' link
 	And I confirm popup
 	Then report's page is loaded

	When I click on 'admin' link
	And I click on 'Denúncias' link
	Then report's page is loaded

	When I click on 'Reativar' link
	Then report's page is loaded

	When I click on 'Tirar Denúncia' link
	Then report's page is loaded
