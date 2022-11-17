Feature: 1.1 Sign in to the App

Background:
	Given application URL is opened

@Smoke
Scenario: 1.1_01 Main scenario: standart_user should be able to sign in into the App
	Given user entered "standart_user" into "Username" field
	And user entered "secret_sauce" into "Password" field
	When user clicks on the "Login" button
	Then  page "Products" should become visible

Scenario: 1.1_02 Main scenario: locked_out_user shouldn't be able to sign in into the App
	Given user entered "locked_out_user" into "Username" field
	And user entered "secret_sauce" into "Password" field
	When user clicks on the "Login" button
	Then  error message "Epic sadface: Sorry, this user has been locked out" should be visible

@Regression
Scenario Outline: 1.1_03 Validation of the login form
	Given user entered <username> into "Username" field
	And user entered <password> into "Password" field
	When user clicks on the "Login" button
	Then <error> message should be visible

	Examples:
		| username      | password     | error                                                                       |
		| standart_user | empty        | "Epic sadface: Password is required"                                        |
		| standart_user | qwerty       | "Epic sadface: Username and password do not match any user in this service" |
		| empty         | empty        | "Epic sadface: Username is required"                                        |
		| new_user      | secret_sauce | "Epic sadface: Username and password do not match any user in this service" |