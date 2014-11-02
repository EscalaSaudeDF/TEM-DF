#language: en

Feature: Admin Comment Report
	To prevent improper comments 
	As a system administrator
	I would like to disable a comment

Scenario: Deactivate a comment
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Denúncias' link
 	Then report's page is loaded

 	When I click on 'Desativar' link
 	And I confirm popup
 	Then report's page is loaded

 Scenario: Reactivate a comment
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Denúncias' link
 	Then report's page is loaded

 	When I click on 'Reativar' link
 	Then report's page is loaded

  Scenario: Disable report of a comment
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Denúncias' link
 	Then report's page is loaded

 	When I click on 'Tirar Dunúncia' link
 	Then report's page is loaded