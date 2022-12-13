Feature: 1.3 Cart page                                                                                   
                                                                                                         
Background:                                                                                              
Given user logged in SwagLabs as a standard_user                                  
                                                                                                         
@Sanity                                                                                                  
Scenario Outline: 1.3_01 User should be able to add items, and see number of items in the cart 
    Given user went to "Inventory" page                                                                  
    And there were no items in the cart                                                                  
    When user cliks on "Add to cart" button for an <item>                                                 
    Then “Remove” button should be visible
    And "Add to cart" button should not be visible
    And number of goods on the "Cart" icon should be <number of items>
                                                                                                         
Examples:                                                                                                
    | item                    | number of items |                                                        
    | Sauce Labs Backpack     | 1               |                                                        
    | Sauce Labs Bike Light   | 2               |                                                        
    | Sauce Labs Bolt T-Shirt | 3               |                                                        
                                                                                                         
@Sanity                                                                                                  
Scenario Outline: 1.3_02 User should be able to delete items from the cart                                
    Given user opened "Cart" page                                                                       
    And following items are already in the cart:
    
    | items                   |                                                                          
    | Sauce Labs Backpack     |                                                                          
    | Sauce Labs Bike Light   |                                                                          
    | Sauce Labs Bolt T-Shirt |  
    
    When user cliks on "Remove" button of an <item> in the cart                                          
    Then item should not be visible                                                            
    And user should see the number on the icon of the cart button decreased by one                       
     
Examples:                                                                                                
    | item                    |                                                                          
    | Sauce Labs Backpack     |                                                                          
    | Sauce Labs Bike Light   |                                                                          
    | Sauce Labs Bolt T-Shirt |                                                                          
                                                                                                         
@Regression                                                                                              
Scenario: 1.3_03 User should be able to continue shopping after adding goods into the cart                
    Given user added two items in the cart                                                               
    And user went to "Cart" page                                                                         
    When user clicks “Continue shopping” button                                                          
    Then user should be redirected to "Inventory" page                                                   
                                                                                                         
@Smoke                                                                                                   
Scenario: 1.3_04 User should be redirected to the "Checkout information" page                             
    Given user opened "Cart" page                                                                       
    When user clicks “Checkout” button                                                                   
    Then user should be redirected to “Checkout information" page                                        
    And the following elements should be on “Checkout information" page:
        | control name    | control type |
        | First name      | input        |
        | Last name       | input        |
        | Zip/Postal Code | input        |
        | Cancel          | button       |
        | Continue        | button       |
        
