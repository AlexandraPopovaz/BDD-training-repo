Feature: 1.1 Sign in to the App 

Background:
Given application URL is opened

@Smoke
Scenario: 1.1_01 Main scenario: "Standard_user" should be able to sign in into the App in order to use the functionality of the application
    Given user entered "Standard_user" into "Username" input
    And user entered "secret_sauce" into "Password" input
    When user clicks on the "Login" button
    Then "Products page" should become visible

@Regression
Scenario outline: 1.1_02 Validation of the "Username" input
    When user enters <name> into the "Username" input
    Then <error> text should be visible

Examples:
    |name|error|
    |@#$%^&*|Epic sadface: Username and password do not match any user in this service|
    |empty|Epic sadface: Username is required|
    |123|Epic sadface: Username and password do not match any user in this service|
    |random username|Epic sadface: Username and password do not match any user in this service|

@Regression
Scenario outline: 1.1_03 Validation of the "Password" input
    When user enters <password> into "password" input
    Then <error> text should be visible

Examples:
    |password|error|
    |@#$%^&*|Epic sadface: Username and password do not match any user in this service|
    |empty|Epic sadface: Password is required|
    |123|Epic sadface: Username and password do not match any user in this service|
    |random password|Epic sadface: Username and password do not match any user in this service|

@Smoke
Scenario: 1.1_04 The "locked_out_user" should not be able to sign in into the App 
    Given user entered "locked_out_user" into "Username" input
    And user entered "secret_sauce" into "Password" input
    When user clicks on the "Login" button
    Then "Epic sadface: Sorry, this user has been locked out." text should be visible

@Regression
Scenario outline: 1.1_05 Validation of the "Username" input with the "locked_out_user"
    When user enteres <name> into the "Username" input
    Then <error> text should be visible

Examples:
    |name|error|
    |@#$%^&*|Epic sadface: Username and password do not match any user in this service|
    |empty|Epic sadface: Username is required|
    |123|Epic sadface: Username and password do not match any user in this service|
    |random username|Epic sadface: Username and password do not match any user in this service|

@Regression
Scenario outline: 1.1_06 Validation of the "Password" input with the "locked_out_user"
    When user enters <password> into "password" input
    Then <error> text should be visible

Examples:
    |password|error|
    |@#$%^&*|Epic sadface: Username and password do not match any user in this service|
    |empty|Epic sadface: Password is required|
    |123|Epic sadface: Username and password do not match any user in this service|
    |random password|Epic sadface: Username and password do not match any user in this service|