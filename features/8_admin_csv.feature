#language: en

Feature: Admin Users
	To update the data
	As a system administrator
	I would like to upload a csv file

Scenario: Upload a csv file
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Carregar Dados' link
 	Then the csv page is loaded

 	And I select a csv file
 	And I click on 'Enviar' link
 	Then the index page is loaded

 Scenario: Try upload without a file
 	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Carregar Dados' link
 	Then the csv page is loaded

 	And I click on 'Enviar' link
 	Then the csv page is loaded
 	