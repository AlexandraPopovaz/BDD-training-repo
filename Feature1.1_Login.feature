Feature: 1.1 Sign in to the App 

Background: 
    Given application URL is opened
    And the following users registered:
    | username | password |
    | standard_user  | secret_sauce | 
    | locked_out_user  | secret_sauce | 
        
Scenario: 1.1_01 Standard user  should be able to sign in into the application
    Given user entered "standard_user" into 'Username' input
    And user entered the corresponding password into 'Password' input 
    When user clicks on the "Login" button
    Then "Inventory" page should become visible  
 
Scenario: 1.1_02 Locked out user should not be able to sign in into the application
    Given user entered "locked_out_user" into 'Username' input
    And user entered the corresponding password into 'Password' input
    When user clicks on the "Login" button
    Then pop-up with "Sorry, this user has been locked out" text should become visible
    And input fields should become highlighted with red 

Scenario: 1.1_03 Logging in without Password
    Given user entered any registered username into 'Username' input
    And user did not enter anything into 'Password' input 
    When user clicks on the "Login" button
    Then pop-up with "Password is required" text should become visible
    And input fields should become highlighted with red

Scenario: 1.1_04 Logging in without Username
    Given user did not enter anything into "Username" input
    And user entered the corresponding password into "Password" input
    When user clicks on the "Login" button
    Then pop-up with "Username is required" text should become visible
    And input fields should become highlighted with red

Scenario: 1.1_05 Logging in with wrong password
    Given user entered any registered username into 'Username' input
    And user entered not the corresponding password into "Password" input
    When user clicks on the "Login" button
    Then pop-up with "Username and password do not match any user in this service" text should become visible
    And input fields should become highlighted with red

Scenario: 1.1_06 Logging in with wrong username
    Given user entered not registered username into 'Username' input
    And user enteres the "secret_sauce" password into "Password" input
    When user clicks on the "Login" button
    Then pop-up with "Username and password do not match any user in this service" text should become visible
    And input fields should become highlighted with red

Scenario: 1.1_07 Logging in without Username and Password
    Given user did not enter anything into "Username" input
    And user did not enter anything into "Password" input
    When user clicks on the "Login" button
    Then pop-up with "Username is required" text should become visible
    And input fields should become highlighted with red
