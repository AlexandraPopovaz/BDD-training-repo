Feature: 2.4.2.4 Simple example

@Smoke
Scenario: 2.4.2.4_01 Main scenario: user should be able to be register using the form
	Given application URL is opened
	When user enters "Maria" into "Name" input
	And user enters "maria.ivanova@gmail.com" into "Email" input
	And user enters "Qwerty13" into "Password" input
	And user clicks on the "Create" button
	Then "Home page" should become visible
	And pop-up with "Congratulations! Your account has been created" text should become visible

@Sanity
Scenario: 2.4.2.4_02 The user should be redirected to the "Authorization" page using the link
	Given application URL is opened
	When user clicks on "Sign in" link
	Then "https:authorization/xxxx" link should be opened