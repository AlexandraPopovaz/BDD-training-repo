Feature: 1.1 Sign in to the App

a 'standard_use' should be able to sign in into the App 
in order to use the functionality of the application
a 'locked_out_user' should not be able to sign in into the App 
and should be able to see the message with the text "Sorry, this user has been locked out"

Background: 
       Given user with usernames 'standard_user' was registered in the App
       And user with username 'locked_out_user' were registered in the App 
       And user with username 'locked_out_user' was locked for logging-in into the App

@Sanity
Scenario Outline: 1.1_01 Logging-in to the App with different users
	   Given Login page was opened
	   And <name> was entered in username field
	   And password "secret_sauce" was entered in password field
	   When press the "Login" button
	   Then <action>

       Examples:
	          | name            | action                                                                                 |
	          | standard_user   | The Inventory page should be opened                                                    |
	          | locked_out_user | The text "Sorry, this user has been locked out" should be able to see on the same page |

@Smoke
Scenario: 1.1_02 App functionality is available for standard user
		Given 'Standard_User' was logged-in into the App
		And 'Products' page was opened
		And items were put to the cart
		When click on cart icon
		Then chosen items should be in the cart
