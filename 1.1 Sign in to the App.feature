Feature: 1.1 Sign in to the App
    Background: 
        Given https://www.saucedemo.com/ is opened 
        And login page is displayed 
        
    Scenario: 1.1.1 "standard_user" should be able to sign in into the App
        Given user entered "standard_user" into "Username" input 
        And user entered "secret_sauce" into "Password" input
        When user clicks on the "Login" button
        Then user should be signed in
        And user should be able to use the functionality of the App 
        
    Scenario: 1.1.2 "locked_out_user" should not be able to sign in into the App
        Given user entered "locked_out_user" into "Username" input 
        And user entered "secret_sauce" into "Password" input
        When user clicks on the "Login" button
        Then user should not be able to sign in
        And pop-up with "Sorry, this user has been locked out" text should become visible 