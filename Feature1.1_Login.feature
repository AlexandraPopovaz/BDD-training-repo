Feature: 1.1 Sign in to the App 

Background: 
    Given application URL is opened
        
Scenario: 1.1_01 Standard user  should be able to sign in into the application
    Given user entered "standard_user" into 'Username' input
    And user entered "secret_sauce" into 'Password' input 
    When user clicks on the "Login" button
    Then "Inventory" page should become visible 

Scenario: 1.1_02 Locked out user should not be able to sign in into the application
    Given user entered "locked_out_user" into 'Username' input
    And user entered "secret_sauce" into 'Password' input
    When user clicks on the "Login" button
    Then pop-up with "Sorry, this user has been locked out" text should become visible
    And input fields should become highlighted with red