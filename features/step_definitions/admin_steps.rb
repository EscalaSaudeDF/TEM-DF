And (/^I click on 'Usuários' link$/) do
	click_link('Usuário')
end

Then (/^the users's page is loaded$/) do
	visit ('http://0.0.0.0:3000/users')
end

When (/^I click on 'Desativar' button$/) do
	click_link('Desativar')
end

When (/^I click on 'Reativar' button$/) do
	click_link('Reativar')
end

And (/^I click on 'Carregar Dados' link$/) do
	click_link('Carregar Dados')
end

Then (/^the csv page is loaded$/) do
	visit('http://0.0.0.0:3000/parsers')
end


And (/^I select a csv file$/) do
	attach_file(:document, './public/csv/schedules_test.csv')
end
 	
And (/^I click on 'Enviar' link$/) do
	click_button('Enviar')
end