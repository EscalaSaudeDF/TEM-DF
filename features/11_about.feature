Feature: About
	To know about the project
	As a system's user
	I would like to see infomartion about the project

Scenario: See about
	Given I am on the index page
	When I click on 'Sobre' link
	Then the about page is loaded