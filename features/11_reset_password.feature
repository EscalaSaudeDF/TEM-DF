Feature: Reset Password
	To recover my account access
	As a system's user
	I would like to reset my password

Scenario: Resetting password
	Given I am on the index page
	When I click on 'Entrar' link
	Then I click on 'Esqueci minha senha' link
	Then the reset_password/new page is loaded

	Then I fill 'Nome de Usuário' field with 'Lucicreide'
	And I fill 'Email' field with 'lucicreide.tia8@gmail.com'
	And I click on 'Requisitar' button
	Then the index page is loaded

	Given I am on gmail login page
	Then I fill 'E-mail' field with 'lucicreide.tia8@gmail.com'
	And I fill 'Senha' field with '999gatinhasafada38tao'
	Then I click on 'Fazer login' button
	Then I click on 'temdf.unb' email
	Then I click on 'Mude sua Senha' link
	Then I fill 'Nova Senha' field with 'mudeisoucrenteagora'
	And I fill 'Confirmação de Senha' field with 'mudeisoucrenteagora'
	Then i click on 'Redefinir Senha' button
	Then the index page is loaded

