Feature: 1.1 Sign in to the App 

Background: users 'standard_user' and 'locked_out_user' were registered in the App
And 'locked_out_user' was configured not to be able to sign in into the App

@Smoke
Scenario Outline: 1.1_01 Logging-in entering username and password
Given page "https://www.saucedemo.com/" was opened
And user filled in the "Username" text field with <username>
And user filled in the "Password" text field with <password>
When user clicks "LOGIN" button
Then the following action <action> displays on the screen

Examples: 
 |    username     |    password     |                           action                                                      |
 |  standard_user  |   secret_sauce  | "https://www.saucedemo.com/inventory.html" page opens                                 |
 |  standard_user  |     (empty)     | "Password required" message                                                           |
 |  standard_user  | (invalid input) | "Epic sadface: Username and password do not match any user in this service" message   |
 | locked_out_user |   secret_sauce  | "Sorry, this user has been locked out" message                                        |
 | locked_out_user |     (empty)     | "Password required" message                                                           |
 | locked_out_user | (invalid input) | "Epic sadface: Username and password do not match any user in this service" message   |
 |    (empty)      |     (empty)     | "Username required" message                                                           |
 |    (empty)      | (invalid input) | "Username required" message                                                           |
 |    (empty)      |   secret_sauce  | "Username required" message                                                           |
 | (invalid input) | (invalid input) | "Epic sadface: Username and password do not match any user in this service" message   |
 | (invalid input) |     (empty)     | "Password required" message                                                           |
 | (invalid input) |   secret_sauce  | "Epic sadface: Username and password do not match any user in this service" message   |

  # (empty) - user left the text field empty
  # (invalid input) - any input except 'secret_sauce'                                                                                                                  