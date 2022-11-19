Feature: 1.1 Sign in to the App

Background:
	Given application URL (https://www.saucedemo.com/) is opened

Scenario: 1.1_01 a "standard_user" should be able to sign in into the App
	Given user entered "standard_user" in the "Username" input
	And user entered "secret_sauce" in the "Password" input
	When user clicks on the "Login" button
	Then user should be logged in

Scenario: 1.1_02 a "locked_out_user" should not be able to sign in into the App
	Given user entered "locked_out_user" in the "Username" input
	And user entered "secret_sauce" in the "Password" input
	When user clicks on the "Login" button
	Then user should not be logged in
	And should see the error message: "Sorry, this user has been locked out"

Scenario Outline: 1.1_03 User with wrong credentials should not be able to sign in into the App
	Given user entered <user> in the "Username" input
	And user entered <password> in the "Password" input
	When user clicks on the "Login" button
	Then user should not be logged in
	And should get an error for the <error>

Examples:
	| user            | password       | error                                 |
	| "standard-user" | "secret_sauce" | wrong "Username" input                |
	| empty           | "secret_sauce" | empty "Username" input                |
	| "standard_user" | "secret-sauce" | wrong "Password" input                |
	| "standard_user" | empty          | empty "Password" input                |
	| empty           | empty          | empty "Username" and "Password" input |