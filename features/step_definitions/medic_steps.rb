#Feature 1
#scenario 1
Given( /^I am on the index page$/ )do
	visit 'http://0.0.0.0:3000/'
end

When /^I select speciality as MED. DA FAMILIA E COMUNIDADE$/ do
	page.select 'MED. DA FAMILIA E COMUNIDADE', :from => 'list_specility'
end

And /^I click on 'Confirmar' button$/ do
	click_button ('Confirmar')
end

Then /^the list of medics is loaded$/ do
	visit 'http://0.0.0.0:3000/medics/results?utf8=%E2%9C%93&list_specility=%09MED.+DA+FAMILIA+E+COMUNIDADE&list_work_unit_name=Informe+a+Regi%C3%A3o'
end

When /^I click on HUDSON DE OLIVEIRA VIRGINI$/ do
	click_link ('HUDSON DE OLIVEIRA VIRGINI')
end

Then /^the profile is loaded$/ do
	visit 'http://0.0.0.0:3000/medics/profile/1'
end

#scenario 2
Given(/^I am on the medic's profile$/) do
	visit 'http://0.0.0.0:3000/medics/profile/1'
end

When(/^I click on schedules's button$/) do
	click_button ("Escala")
end

Then(/^the HUDSON DE OLIVEIRA VIRGINI's schedule is loaded$/) do
	within('#myModal') do
  		#page.should have_content('2014-10-01 07:00:00 UTC')
  	end
end

#medic_comment

When(/^I click on 'Entrar' link$/) do
	click_link ('Entrar')
end

Then(/^the login page is loaded$/) do
	visit 'http://0.0.0.0:3000/login'
end

Then(/^I fill 'Nome de Usuário' field$/) do
	fill_in 'username', :with => 'admin'
end

Then(/^I fill 'Senha' field$/) do
	fill_in 'password', :with => 'admin'
end

Then(/^I click on 'Entrar' button$/) do
	click_button ("Entrar")
end

Then(/^the index page is loaded$/) do
	visit 'http://0.0.0.0:3000'
end

When(/^I fill 'Comentário' field$/) do
	fill_in 'content', :with => 'ola senhor pepino!'
end

And(/^I click on 'Enviar' button$/) do
	click_button ("Enviar")
end

#comment_relevance

When(/^I click on 'sim' link$/) do
	first(:link, 'sim').click
end

When(/^I click on 'admin' link$/) do
	click_link('admin')
end

And (/^I click on 'Denúncias' link$/) do
	click_link('Denúncias')
end

Then (/^report's page is loaded$/) do
	visit 'localhost:3000/comments/reports'
end

When (/^I click on 'Desativar' link$/) do
	click_link('Desativar')
end

And(/^I confirm popup$/) do
  page.driver.browser.switch_to.alert.accept
end

When (/^I click on 'Reativar' link$/) do
	click_link('Reativar')
end

When (/^I click on 'Tirar Denúncia' link$/) do
	click_link('Tirar Denúncia')
end
#comment_report

When(/^I click on '!' link$/) do
  first(:link, 'Denunciar').click
end

#contact_mail

When(/^I click on 'Contato' link$/) do
	click_link('Contato')  
end

Then(/^the contact page is loaded$/) do
	visit 'localhost:3000/contact'
end

Then(/^I fill 'Nome' field$/) do
	fill_in 'name', :with => 'Teste Funcional'
end

Then(/^I fill 'Email' field$/) do
	fill_in 'email', :with => 'teste@hotmail.com'
end

Then(/^I fill 'Assunto' field$/) do
	fill_in 'subject', :with => 'Teste Funcional'
end

Then(/^I fill 'Message' field$/) do
	fill_in 'message', :with => 'Este assunto é um teste, dos testes funcionais'
end

#medic graph
When(/^I click on 'Grafico' link$/) do
  click_link('Grafico')
end

Then(/^the graph page is loaded$/) do
  visit 'http://0.0.0.0:3000/workunits_graph'
end

