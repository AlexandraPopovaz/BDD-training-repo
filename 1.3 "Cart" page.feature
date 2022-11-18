Feature: 1.3 "Cart" page
    Background:
        Given user signed in as Standard User on https://www.saucedemo.com/
        And "Inventory" page was opened

    Scenario Outline: 1.3.1 The user should be able to add one/several items into the Cart
        When user adds <number> items by clicking on "ADD TO CART" button
        Then <number> items should be added into the Cart
        And "REMOVE" button should be displayed for items added into the Cart
        And <number> items should be displayed on "Cart" icon

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario Outline: 1.3.2 The user should be able to remove one/several items from the Cart
        Given <number> items were added into the Cart
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
        Given user added <number> items by clicking on "ADD TO CART" button
        And "REMOVE" button was displayed for items added into the Cart
        When user clicks on "REMOVE" button on <number> item cards
        Then <number> items should be removed from the Cart
        And "ADD TO CART" button should be displayed on items removed from the Cart
        And number of items displayed on "Cart" icon should decrease by <number>

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario: 1.3.4 The user should be able to continue shopping after adding items into the Cart
        Given items were added into the Cart
        When user clicks on "Cart" icon
        And the list of items is displayed
        And user clicks on "CONTINUE SHOPPING" button
        Then "Inventory" page should be displayed
        And user should be able to add <number> items into the Cart

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario Outline: 1.3.5 The user should be able to see number of items in the Cart
        When user adds <number> items into the Cart
        Then <number> of items added into the Cart should be displayed on "Cart" icon

        Examples:
            | number |
            | 1      |
            | 2      |
            | 3      |

    Scenario: 1.3.6 The user should be redirected to the "Checkout information" page
        Given user added items into the Cart
        When user clicks on "Cart" icon
        And list of items is displayed
        And user clicks on "CHECKOUT" button
        Then user should be redirected to "Checkout information" page


