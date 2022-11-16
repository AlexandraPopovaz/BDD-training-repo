Feature: 1 Sign in to the app

Background:
    Given login page of the applocation is opened (URL: https://www.saucedemo.com/)
    And 'standard_user' and 'locked_out_user' profiles have been registered in the system
    And 'secret_sauce' added into "Password" input field 

Scenario: 1.1 'standard_user' is able to sign in the system
    Given 'standard_user' added into "Username" input field

    When user clicks "LOGIN"
    Then "PRODUCTS" page is opened with a list of products 

Scenario: 1.2 'locked_out_user' is not able to sign in the system, when they try, message "Sorry, this user has been locked out" is shown
    Given 'locked_out_user' added into "Username" input field

    When user clicks "LOGIN"
    Then user stays on the sane page
    And red toaster with a message: "Sorry, this user has been locked out" is seen