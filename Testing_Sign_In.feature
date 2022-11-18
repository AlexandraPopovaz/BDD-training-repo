Feature: User Sign in to the saucedemo

 Background:
 	Given Saucedemo.com is opened

 @Smoke
 Scenario 1.01: Main scenario: standart_user sign in 
 	Given user entered "standart_user" into "Username" field
 	And user entered "secret_sauce" into "Password" field
 	When user clicks on the "Login" button
 	Then  user is directed to the dashboard 
 	And the dashboard displays products with corresponding images

 Scenario 1.02: Main scenario: locked_out_user error is displayed 
 	Given user entered "problem_user" into "Username" field
 	And user entered "secret_sauce" into "Password" field
 	When user clicks on the "Login" button
 	Then "Epic sadface: Sorry, this user has been locked out" is displayed

 Scenario 1.03: Problem_user sign in 
	Given user entered "locked_out_user" into "Username" field
	And user entered "secret_sauce" into "Password" field
	When user clicks on the "Login" button
	Then user is directed to the dashboard 
	And the dashboard displays a dog image for each product

 Scenario 1.04: Performance_glitch_user sign in 
	Given user entered "Performance_glitch_user" into "Username" field
	And user entered "secret_sauce" into "Password" field
	When user clicks on the "Login" button
	Then user is directed to the dashboard with a delay
	
 Scenario 1.05: Empty username sign in 
 	Given the "Username" field is empty
 	And user entered "secret_sauce" into "Password" field
	When user clicks on the "Login" button
	Then "Epic sadface: Username is required" is displayed
	
 Scenario 1.05: Empty username and password sign in 
	Given the "Username" field is empty
	And "Password" field is empty
	When user clicks on the "Login" button
	Then "Epic sadface: Username is required" is displayed

 Scenario 1.05: Empty password sign in 
	Given user entered "standart_user" into "Username" field
	And user entered "secret_sauce" into "Password" field
	When user clicks on the "Login" button
	Then "Epic sadface: Password is required" is displayed

 Scenario 1.06: Unaccepted password and username login
 	Given user entered unaccapted user name into "Username" field
 	And user entered unaccapted password into "Password" field
 	When user clicks on the "Login" button
 	Then "Epic sadface: Username and password do not match any user in this service" is displayed

 	Examples:
 		| username      | password     | error                                                                       |
        | standart_user | empty        | "Epic sadface: Password is required"                                        |
        | empty         | empty        | "Epic sadface: Username is required"                                        |
        | empty         | secret_sauce | "Epic sadface: Username is required"                                        |
        | Qwerty        | secret_sauce | "Epic sadface: Username and password do not match any user in this service" |
        | Qwerty        | qwerty       | "Epic sadface: Username and password do not match any user in this service" |
