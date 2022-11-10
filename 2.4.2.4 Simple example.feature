Feature: 2.4.2.4 Simple example

Background: 
Given application URL is opened

@Smoke
Scenario: 2.4.2.4_01 Main scenario: user should be able to be register using the form
	Given user entered "Maria" into "Name" input
	And user entered "maria.ivanova@gmail.com" into "Email" input
	And user entered "Qwerty13" into "Password" input
	When user clicks on the "Create" button
	Then "Home page" should become visible
	And pop-up with "Congratulations! Your account has been created" text should become visible

@Sanity
Scenario: 2.4.2.4_02 The user should be redirected to the "Authorization" page using the link
	When user clicks on "Sign in" link
	Then "https:authorization/xxxx" link should be opened

@Regression
Scenario Outline: 2.4.2.4_03 Validation of the "Name" input
	When user enters <name> into the "Name" input
	Then <error> text should be visible

Examples:
	| name  | error                            |
	| #$%^% | "Only Latin letters are allowed" |
	| empty | "The field is required"          |
	| 123   | "Only Latin letters are allowed" |