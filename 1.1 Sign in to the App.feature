Feature: 1.1 Sign in to the App

    Background:
        Given application URL is opened
        And users are signed up

    @Smoke
    Scenario: 1.1_01 Main scenario: A "standard_user" should be able to sign in into the App
        Given user entered "standard_user" into "Username" input
        And user entered "secret_sauce" into "Password" input
        When user clicks on the "Login" button
        Then "Products" page should become visible

    @Sanity
    Scenario: 1.1_02 A "locked_out_user" should not be able to sign in into the App
        Given user entered "locked_out_user" into "Username" input
        And user entered "secret_sauce" into "Password" input
        When user click on the "Login" button
        Then "Sorry, this user has been locked out" text should be visible