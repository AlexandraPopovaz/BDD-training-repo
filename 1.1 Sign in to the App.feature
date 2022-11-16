Feature: 1.1 Sign in to the App

Scenario Outline: Enter username and password
    Given user on "https://www.saucedemo.com/" page
    And user have entered <Username> to the username field
    And user have entered <Password> to the password field
    When user clicks 'LOGIN'
    Then the result should be <Result> on the screen

Examples:
    |     Username     |       Password    |                Result                                                |
    | standard_user    | secret_sauce      | an opened "https://www.saucedemo.com/inventory.html" page            |
    | locked_out_user  | secret_sauce      | "Sorry, this user has been locked out" message                       |
    | standard_user    | (left empty)      | "Password is required" message                                       |
    | (left empty)     | secret_sauce      | "Username is required" message                                       |
    | (left empty)     | (left empty)      | "Username is required" message                                       |
    | standard_user    | (invalid password)| "Username and password do not match any user in this service" message|
    | (invalid user)   | secret_sauce      | "Username and password do not match any user in this service" message|
    | locked_out_user  | (left empty)      | "Password is required" message                                       |
    | locked_out_user  | (invalid password)| "Username and password do not match any user in this service" message|
    
    # (Invalid password) - characters of any length starting from 1 (to check any one random combination of characters is enough), apart from correct password "secret_sauce"
    # (left empty) - enter nothing into corresponding field