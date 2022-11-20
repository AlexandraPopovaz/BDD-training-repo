Feature: 1.1 Sign in to the App

Background: 
    Given https://www.saucedemo.com/ is opened 
    And login page is displayed 
        
Scenario: 1.1_01 "standard_user" should be able to sign in with valid password
    Given user entered "standard_user" into "Username" input 
    And user entered "secret_sauce" into "Password" input
    When user clicks on the "Login" button
    Then user should be signed in
    And "Inventory" page should be diplayed
     
Scenario: 1.1_02 "locked_out_user" should not be able to sign in with valid password
    Given user entered "locked_out_user" into "Username" input 
    And user entered "secret_sauce" into "Password" input
    When user clicks on the "Login" button
    Then user should not be able to sign in
    And "Login" page should remain open 
    And input fields should be highlighted in red
    And pop-up with "Sorry, this user has been locked out" text should become visible 
   
Scenario Outline: 1.1_03 user should not be able to sign in with invalid password
    Given user entered any of "Accepted usernames" into "Username" input 
    And user entered <password> into "Password" input 
    When user clicks on the "Login" button
    Then user should not be able to sign in
    And "Login" page should remain open 
    And input fields should be highlighted in red   
    And pop-up with <error> text should become visible 

Examples:
    | password                           | error 
    | any password except "secret_sauce" | "Epic sadface: Username and password do not match any user in this service"
    | empty                              | "Epic sadface: Password is required"
 
Scenario Outline: 1.1_04 "Username" field should be case-sensitive 
    Given user entered <user> into "Username" input 
    And user entered "secret_sauce" into "Password" input
    When user clicks on the "Login" button
    Then user should not be able to sign in
    And "Login" page should remain open 
    And input fields should be highlighted in red   
    And pop-up with "Epic sadface: Username and password do not match any user in this service" text should become visible 
   
Examples:
    | user            | 
    | Standard_user   | 
    | Locked_out_user |   

Scenario Outline: 1.1_05 user should not be able to sign in with empty "Username" input
    Given user left "Username" input empty
    And user entered <password> into "Password" input
    When user clicks on the "Login" button
    Then user should not be able to sign in
    And "Login" page should remain open 
    And input fields should be highlighted in red   
    And pop-up with "Epic sadface: Username is required" text should become visible 
   
Examples:
    | password                           |
    | any password except "secret_sauce" |
    | secret_sauce                       |
    | empty                              |


   
   

   
