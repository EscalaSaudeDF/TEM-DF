#language: en

Feature: Peform Contact
	To make a contact
	As a system's user
	I would like to send an email with my contact

Scenario: Peform Contact
	Given I am on the index page
	When I click on 'Contato' link
	Then the contact page is loaded

	Then I fill 'Nome' field
	And I fill 'Email' field
	And I fill 'Assunto' field
	And I fill 'Message' field
	And I click on 'Enviar' button
 	Then the index page is loaded

