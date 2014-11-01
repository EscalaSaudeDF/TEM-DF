Given /^I am on the index page$/ do
	visit 'http://0.0.0.0:3000/'
end

When /^I select speciality as (.+)$/ do |specialities|
	specialities.split(',').each do |speciality|
		#Medic.results!(:list_specility=>speciality)
	end
end

And /^I click on (.+) button$/ do |buttons|
	buttons.split(',')
	#clicks_button (',')
end

Then /^the list of medics is loaded$/ do

end

When /^I click on ANA PAULA DELGADO CAVALCANTE$/ do
	
end

Then /^the profile is loaded$/ do

end

Given(/^I am on the medic's profile$/) do

end

Then(/^the ANA PAULA DELGADO CAVALCANTE's schedule is loaded$/) do
  
end

