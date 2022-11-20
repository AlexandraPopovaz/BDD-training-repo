Feature: 1.1 Sign into the App

Background: 
Given application URL is opened

@Smoke
Scenario: 1.1_01 Main scenario: "standard_user" should be able to sign into the App
	Given user entered "standard_user" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should open instantly
	And products with appropriate photos (relevant to the product name) should be displayed

@smoke
Scenario: 1.1_02 "locked_out_user" should not be able to sign into the App
	Given user entered "locked_out_user" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Login" page should remain opened
	And "Username" input field should be highlighted red
	And "Password" input field should be highlighted red
	And "Sorry, this user has been locked out" text should become visible

@smoke
Scenario: 1.1_03 Signing into the App with "problem_user" account
	Given user entered "problem_user" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should open instantly
	And products with Pug photos should be displayed

@smoke
Scenario: 1.1_04 Signing into the App with "performance_glitch_user" account
	Given user entered "performance_glitch_user" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then after a few seconds "Inventory" page should open
	And products with appropriate photos (relevant to the product name) should be displayed

@regression
Scenario Outline: 1.1_05 Signing into the App with invalid "Username"
        Given user entered <username> into the "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Login" page should remain opened
	And "Username" input field should be highlighted red
	And "Password" input field should be highlighted red
	And <error> text should be visible

Examples:
	| username                                     | error                                                         |
	| Any username other than "Accepted usernames" | "Username and password do not match any user in this service" |
	| empty                                        | "Username is required"                                        |

@regression
Scenario Outline: 1.1_06 Signing into the App with invalid "Password"
        Given user entered any of "Accepted usernames" into the "Username" input
	And user entered <password> into "Password" input
	When user clicks on the "Login" button
	Then "Login" page should remain opened
	And "Username" input field should be highlighted red
	And "Password" input field should be highlighted red
	And <error> text should be visible

Examples: 
        | password                               | error                                                         |
        | Any password other than "secret_sauce" | "Username and password do not match any user in this service" |
        | empty                                  | "Password is required"                                        |
