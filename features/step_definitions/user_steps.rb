
When (/^I click on 'Cadastrar' link$/) do
	click_link('Cadastrar')
end

Then (/^the register page is loaded$/) do
	visit 'http://localhost:3000/users/new'
end

Then (/^I select 'Tipo de usuário' field$/) do
	choose('Sou usuário do sistema público de saúde')
end

Then (/^I fill 'Username' field$/) do
	fill_in 'Username', :with => 'Roberval'
end

Then (/^I fill 'Email' field  with 'roberval@hotmail.com'$/) do
	fill_in 'Email', :with => 'roberval@hotmail.com'
end

Then (/^I fill 'Password' field$/) do
	fill_in 'Password', :with => 'massaroca'
end

Then (/^I fill 'Password confirmation' field$/) do
	fill_in 'Password confirmation', :with => 'massaroca'
end

Then (/^I click on 'Criar Usuario' button$/) do
	click_button ("Criar Usuario")
end

Then (/^I fill 'Email' field with wrong email$/) do
	fill_in 'Email', :with => 'roberval'
end

Then (/^I fill 'Password confirmation' field with wrong password$/) do
	fill_in 'Password confirmation', :with => 'massaroca errada'
end

Then(/^I fill 'Nome de Usuário' field with 'roberval'$/) do
	fill_in 'username', :with => 'Roberval'
end

Then(/^I fill 'Senha' field with 'massaroca'$/) do
	fill_in 'password', :with => 'massaroca'
end

When(/^I click on 'Roberval' link$/) do
	click_link('Roberval')
end

Then (/^I click on 'Editar Perfil' link$/) do
	click_link('Editar Perfil')
end

Then (/^I fill 'Email' field with new email$/) do
	fill_in 'user[email]', :with => 'roberval10@gmail.com'
end

Then (/^I fill 'Nome' field with new name$/) do
	fill_in 'user[username]', :with => 'Roberval10'
end

Then (/^I click on 'Salvar alteração' button$/) do
	click_button('Salvar alteração')
end

Then (/^I click on 'Alterar Senha' link$/) do
	click_link('Alterar Senha')
end	

Then (/^I fill 'Senha Atual' field$/) do
	fill_in 'user[password]', :with => 'massaroca'
end

Then (/^I fill 'Nova Senha' field$/) do
	fill_in 'user[new_password]', :with => 'massarocaapimentada'
end

Then (/^I fill 'Confirmação de senha' field$/) do
	fill_in 'user[password_confirmation]', :with => 'massarocaapimentada'
end

Then (/^I click on 'Alterar Senha' button$/) do
	click_button('Alterar Senha')
end

Then(/^I fill 'Senha' field with 'massarocaapimentada'$/) do
	fill_in 'password', :with => 'massarocaapimentada'
end

						#Reset_password 

Then(/^I click on 'Esqueci minha senha' link$/) do
	click_link('Esqueci minha senha')
end

Then(/^the reset_password\/new page is loaded$/) do
  visit 'http://localhost:3000/password_resets/new'
end

Then(/^I fill 'Nome de Usuário' field with 'Lucicreide'$/) do
  fill_in 'username', :with => 'Lucicreide'
end

Then(/^I fill 'Email' field with 'lucicreide\.tia(\d+)@gmail\.com'$/) do |arg1|
  fill_in 'email', :with => 'lucicreide.tia8@gmail.com'
end

Then(/^I click on 'Requisitar' button$/) do
  click_button('Requisitar')
end

Given(/^I am on gmail login page$/) do
  visit 'https://accounts.google.com/ServiceLogin?sacu=1&scc=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&ss=1&ltmpl=default&rm=false'
end

Then(/^I fill 'E\-mail' field with 'lucicreide\.tia(\d+)@gmail\.com'$/) do |arg1|
  fill_in 'Email', :with => 'lucicreide.tia8@gmail.com'
end

Then(/^I fill 'Senha' field with '(\d+)gatinhasafada(\d+)tao'$/) do |arg1, arg2|
  fill_in 'Passwd', :with => '999gatinhasafada38tao'
end

Then(/^I click on 'Fazer login' button$/) do
  click_button('signIn')
end

Then(/^I click on 'temdf\.unb' email$/) do
  click_link('temdf.unb')
end

Then(/^I click on 'Mude sua Senha' link$/) do
  click_link('Mude sua Senha')
end

Then(/^I fill 'Nova Senha' field with 'mudeisoucrenteagora'$/) do
  fill_in 'user_password', :with => 'mudeisoucrenteagora'
end

Then(/^I fill 'Confirmação de Senha' field with 'mudeisoucrenteagora'$/) do
  fill_in 'user_password_confirmation', :with => 'mudeisoucrenteagora'
end

Then(/^i click on 'Redefinir Senha' button$/) do
  click_link('Redefinir Senha')
end

When (/^I click on 'Sobre' link$/) do
	click_link('Sobre')
end

Then (/^the about page is loaded$/) do
	visit 'http://0.0.0.0:3000/about'
end