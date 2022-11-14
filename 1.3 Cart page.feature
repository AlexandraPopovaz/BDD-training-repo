Feature: 1.3 Cart page
    
Background: 
Given user logged in SwagLabs with valid credentials as a standard_user

@Sanity   
Scenario Outline: 1.3.1 User should be able to add items into the cart and see number of goods in the cart
    Given user went to "Inventory" page
    And there were no items in the cart
    When user cliks on "Add to cart" button for an <item> 
    Then the button should change to “Remove” button
    And user should see the number of goods on the icon of a cart button in the right upper corner
    And the <number of items> in the cart should increase by one
        
Examples: 
    | item                    | number of items |
    | Sauce Labs Backpack     | 1               |
    | Sauce Labs Bike Light   | 2               |
    | Sauce Labs Bolt T-Shirt | 3               |

@Sanity      
Scenario Outline: 1.3.2 User should be able to delete items from the cart
    Given user went to "Cart" page
    And there were three items in the cart
    When user cliks on "Remove" button of an <item> in the cart
    Then item should disappear from the cart
    And user should see the number on the icon of the cart button decreased by one
    
Examples: 
    | item                    |
    | Sauce Labs Backpack     |
    | Sauce Labs Bike Light   |
    | Sauce Labs Bolt T-Shirt |

@Regression    
Scenario: 1.3.3 User should be able to continue shopping after adding goods into the cart
    Given user added two items in the cart   
    And user went to "Cart" page
    When user clicks “Continue shopping” button
    Then user should be redirected to "Inventory" page

@Smoke   
Scenario: 1.3.4 User should be redirected to the "Checkout information" page
    Given user went to "Cart" page
    When user clicks “Checkout” button
    Then user should be redirected to “Checkout information" page
    And following elements should be displayed on the page
        | control name    | control type |
        | First name      | input        |
        | Last name       | input        |
        | Zip/Postal Code | input        |
        | Cancel          | button       |
        | Continue        | button       |
    
   