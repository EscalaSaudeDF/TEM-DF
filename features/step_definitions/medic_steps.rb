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

When /^I click on ANA PAULA DELGADO CAVALCANTE$/ do
	click_link ('ANA PAULA DELGADO CAVALCANTE')
end

Then /^the profile is loaded$/ do
	visit 'http://0.0.0.0:3000/medics/profile/77'
end
 
#scenario 2
Given(/^I am on the medic's profile$/) do
	visit 'http://0.0.0.0:3000/medics/profile/77'
end

When(/^I click on schedules's button$/) do
	click_button ("medicModal")
end

Then(/^the ANA PAULA DELGADO CAVALCANTE's schedule is loaded$/) do
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


