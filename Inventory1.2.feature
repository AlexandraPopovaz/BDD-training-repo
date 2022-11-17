Feature:1.2"Inventory" Page

Background:
    Given application URL is opened
    And the user logged in with username(standard_user) and password(secret_sauce).


   @smoke
   Scenario Outline: 1.2.01: User should be able to add one, several or all items into the Cart using "Inventory" page
   Given Inventory page was displayed
   When user clicks "ADD TO CART" button 
   Then user should  see <number> item(s) in the cart

   Examples: 
        |number|
        |1     |
        |2     |
        |3     |
        |4     |
        |5     |
        |6     |

   @sanity
   Scenario Outline: 1.2.02: User should be able to remove one, several or all items from the Cart using "Inventory" page
   Given added number of item(s) were displayed 
   When user clicks "REMOVE" button 
   Then user should see <number>-1 item(s) in the cart
   But see no number if <number>-1==0

   Examples: 
        |number|
        |1     |
        |2     |
        |3     |
        |4     |
        |5     |
        |6     |
