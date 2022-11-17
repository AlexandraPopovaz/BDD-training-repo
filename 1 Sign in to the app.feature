Feature: 1 Sign in to the app

   Additional scenarios that can be added to the feture file, however are not mentioned into the BR:
        - 'problem_user' and 'performance_glitch_user' are ablo to sign in in the system
        - sign in page has 'Username' and 'Password' input fields and active "LOGIN" button
        - clicking to the cross on the error "Epic sadface: Sorry, this user has been locked out" pop up closes the error and removes the red crosses from the right side of the input fields 

Background:
    Given login page of the applocation was opened (URL: https://www.saucedemo.com/)
    And 'standard_user' and 'locked_out_user' profiles have been registered in the system
    And 'secret_sauce' added into "Password" input field 

Scenario: 1.1 'standard_user' is able to sign in the system
    Given 'standard_user' was added into "Username" input field

    When user clicks "LOGIN"
    Then "PRODUCTS" page is opened with a list of products 

Scenario: 1.2 'locked_out_user' is not able to sign in the system, when they try, message "Sorry, this user has been locked out" is shown
    Given 'locked_out_user' added into "Username" input field

    When user clicks "LOGIN"
    Then user stays on the sane page
    And red toaster with a message: "Sorry, this user has been locked out" is seen
