Feature: 1.3 "Cart" page
    Background:
        Given https://www.saucedemo.com/ is opened
        And user is signed in as Standard User

    Scenario Outline: 1.3.1 The user should be able to add one/several items into the Cart
        Given "Inventory" page was opened
        When user adds <number> items by clicking on "ADD TO CART" button
        Then <number> items should be added into the Cart
        And clicked "ADD TO CART" buttons  should be changed to "REMOVE" buttons
        And <number> items should be displayed on "Cart" icon

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario Outline: 1.3.2 The user should be able to remove one/several items from the Cart
        Given "Inventory" page was opened
        And <number> items were added into the Cart
        When user clicks on "Cart" icon
        And removes <number> items by clicking on "REMOVE" button
        Then <number> items should be removed from the Cart
        And number of items displayed on "Cart" icon should decrease by <number>

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario Outline: 1.3.3 The user should be able to remove one/several items from the Cart on "Inventory" page
        Given "Inventory" page was opened
        And user added <number> items by clicking "ADD TO CART" button
        And clicked "ADD TO CART" buttons were changed to "REMOVE" buttons
        When user clicks on "REMOVE" button on <number> item cards
        Then <number> items should be removed from the Cart
        And clicked "REMOVE" buttons should be changed to "ADD TO CART" buttons
        And number of items displayed on "Cart" icon should decrease by <number>

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario: 1.3.4 The user should be able to continue shopping after adding items into the Cart
        Given "Inventory" page was opened
        And items were added into the Cart
        When user clicks on "Cart" icon
        And the list of items is displayed
        And user clicks on "CONTINUE SHOPPING" button
        Then the "Inventory" page should be opened
        And user should be able to add other items into the Cart

    Scenario Outline: 1.3.5 The user should be able to see number of items in the Cart
        Given "Inventory" page was opened
        When user adds <number> items into the Cart
        Then <number> items added into the Cart should be displayed on "Cart" icon

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario: 1.3.6 The user should be redirected to the "Checkout information" page
        Given "Inventory" page was opened
        And user added items into the Cart
        When user clicks on "Cart" icon
        And list of items is displayed
        And user clicks on "CHECKOUT" button
        Then user should be redirected to "Checkout information" page


