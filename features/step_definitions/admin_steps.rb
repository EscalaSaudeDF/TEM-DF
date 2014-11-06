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