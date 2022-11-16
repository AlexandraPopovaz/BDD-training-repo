Feature: 1.1 Sign In To The App

Background:
	Given application URL: https://www.saucedemo.com/ is opened

@Smoke
Scenario: 1.1_01 Standard user is able to sign in to the application
	Given user entered "standard_user" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should become visible

@Smoke
Scenario: 1.1_02 Locked user is not able to sign in into the app
	And user entered "locked_out_user" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Inventorye" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Sorry, this user has been locked out."
	And input fields should become highlighted with red

@Smoke
Scenario: 1.1_03 Sign in with incorrect password
	And user entered <username> into "Username" input
	And user entered <password> into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Username and password do not match any user in this service"
	And input fields should become highlighted with red

Examples:
	| username        | password        |
	| standard_user   | "secret_potato" |
	| locked_out_user | "secret_potato" |

@Smoke
Scenario: 1.1_04 Sign in with incorrect username
	And user entered "wronguser" into "Username" input
	And user entered "secret_sauce" into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Username and password do not match any user in this service"
	And input fields should become highlighted with red

@Smoke
Scenario: 1.1_05 Sign in with both incorrect username and password
	And user entered "wronguser" into "Username" input
	And user entered "secret_potato" into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Username and password do not match any user in this service"
	And input fields should become highlighted with red

@Smoke
Scenario: 1.1_06 Check uppercase/lowercase letter sensitivity in the username and password fields
	And user entered <username> into "Username" input
	And user entered <password> into "Password" input
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Username and password do not match any user in this service"
	And input fields should become highlighted with red

Examples:
	| username        | password       |
	| Standart_User   | "secret_sauce" |
	| Locked_OUT_User | "secret_sauce" |
	| standard_user   | "Secret_Sauce" |
	| locked_out_user | "secRet_sauce" |

@Smoke
Scenario: 1.1_07 Sign in with empty fields
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Username is required"
	And input fields should become highlighted with red

@Smoke
Scenario: 1.1_08 Sign in with empty password field
	And user entered "standard_user" into the "Username" field
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Password is required"

@Smoke
Scenario: 1.1_09 Sign in with empty username field
	And user entered "secret_sauce" into the "Password" field
	When user clicks on the "Login" button
	Then "Inventory" page should not become visible
	And error message in pop-up should be visible: "Epic sadface: Username is required"