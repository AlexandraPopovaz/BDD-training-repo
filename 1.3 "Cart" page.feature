Feature: 1.3 "Cart" page
    Background:
        Given https://www.saucedemo.com/ is opened
        And user is signed in as Standard User

    Scenario: 1.3.1 The user should be able to add one item into the Cart
        Given "Inventory" page was opened
        When user chooses an item
        And user clicks on "ADD TO CART" button on item card
        Then an item should be added into the Cart
        And Clicked "ADD TO CART" button  should be changed to "REMOVE" button
        And number of items displayed on "Cart" icon should increase by one

    Scenario: 1.3.2 The user should be able to add several items into the Cart
        Given "Inventory" page was opened
        When user chooses an item
        And user clicks on "ADD TO CART" button on item card
        And user chooses another item
        And user clicks on "ADD TO CART" button on item card
        Then all chosen items should be added into the Cart
        And Clicked "ADD TO CART" buttons should be changed to "REMOVE" buttons
        And number of items displayed on "Cart" icon should increase by the number of added items

    Scenario: 1.3.3 The user should be able to remove one item from the Cart
        Given "Inventory" page was opened
        And items were added into the Cart
        When user clicks on "Cart" icon
        And user chooses an item to remove
        And clicks on "REMOVE" button on item card
        Then chosen item should be removed from the Cart
        And number of items displayed on "Cart" icon should decrease by one

    Scenario: 1.3.4 The user should be able to remove one item from the Cart on "Inventory" page
        Given "Inventory" page was opened
        And user clicked on "ADD TO CART" on chosen item card
        And clicked "ADD TO CART" button was changed to "REMOVE" button
        When user clicks on "REMOVE" button
        Then the item should be removed from the Cart
        And clicked "REMOVE" button should be changed to "ADD TO CART" button
        And number of items displayed on "Cart" icon should decrease by one

    Scenario: 1.3.5 The user should be able to remove several items from the Cart
        Given "Inventory" page was opened
        And items were added into the Cart
        When user clicks on "Cart" icon
        And chooses an item to remove
        And clicks "REMOVE" button on item card
        And chooses another item to remove
        And clicks "REMOVE" button on item card
        Then chosen items should be removed from the Cart
        And number of items displayed on "Cart" icon should decrease by the number of removed items

    Scenario: 1.3.6 The user should be able to remove several items from the Cart on "Inventory" page
        Given "Inventory" page was opened
        And user clicked on "ADD TO CART" on chosen item cards
        And clicked "ADD TO CART" buttons were changed to "REMOVE" buttons
        When user chooses items to remove
        And clicks on "REMOVE" button on item card
        And clicks on "REMOVE" button on another item card
        Then the items should be removed from the Cart
        And Clicked "REMOVE" buttons should be changed to "ADD TO CART" buttons
        And number of items displayed on "Cart" icon should decrease by the number of removed items

    Scenario: 1.3.7 The user should be able to continue shopping after adding items into the Cart
        Given "Inventory" page was opened
        And items were added into the Cart
        When user clicks on "Cart" icon
        And the list of items is displayed
        And user clicks on "CONTINUE SHOPPING" button
        Then the "Inventory" page should be opened
        And user should be able to add other items into the Cart

    Scenario: 1.3.8 The user should be able to see number of items in the Cart
        Given "Inventory" page was opened
        When user adds items into the Cart
        Then the number of items added into the Cart should be displayed on "Cart" icon

    Scenario: 1.3.9 The user should be redirected to the "Checkout information" page
        Given "Inventory" page was opened
        And user added items into the Cart
        When user clicks on "Cart" icon
        And list of items is displayed
        And user clicks on "CHECKOUT" button
        Then user should be redirected to "Checkout information" page
