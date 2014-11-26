#language: en

Feature: Admin Users
	To control the system's users
	As a system administrator
	I would like to deactivate, reactivate or delete a user


Scenario: Deactivate a user
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Usuários' link
 	Then the users's page is loaded

 	When I click on 'Desativar' button
 	Then the users's page is loaded

Scenario: Reativate a user
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'admin' link
 	And I click on 'Usuários' link
 	Then the users's page is loaded

 	When I click on 'Reativar' button
 	Then the users's page is loaded

Scenario: admin see denuncia page
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'Denuncias'
 	Then the denuncias page is loaded

Scenario: admin see users page by deactivate 
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'Usuarios Desativados'
 	Then the users's page is loaded

Scenario: admin see users page by activate 
	Given I am on the index page
	When I click on 'Entrar' link
	Then the login page is loaded
	Then I fill 'Nome de Usuário' field
	And I fill 'Senha' field
	And I click on 'Entrar' button
 	Then the index page is loaded

 	When I click on 'Usuarios Ativados'
 	Then the users's page is loaded
