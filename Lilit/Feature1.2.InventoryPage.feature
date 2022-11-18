Feature:1.2. Inventory Page

Background:
   Given application url was opened
   And the standard_user signed in
   

   @smoke
   Scenario Outline: 1.2.01: User should be able to add one/several items into the cart on the Inventory page
   Given inventory page was displayed
   When user adds <number> item/s from the <list of items> table into the cart by clicking "add to cart" button next to each item
   Then user should be able to see the same <number> item/s from the <list of items> table in the cart

   Examples: 
   |number|
   |1     |
   |3     |
   
   @sanity
   Scenario: 1.2.02: User should be able to add all items into the cart on the Inventory page
   Given inventory page was displayed
   When user adds all items from the <list of items> table into the cart by clicking "add to cart" button next to each item
   Then user should be able to see all items from the <list of items> table in the cart
   
   @smoke
   Scenario Outline: 1.2.03: User should be able to remove one/several items from the cart on the Inventory page
   Given user added <number> item/s from the <list of items> table into the cart on the Inventory page
   When user removes from the cart <number> item/s from the <list of items> table by clicking "Remove" button next to each item on the inventory page
   Then user should be able to see the same <number> item/s from the <list of items> table disappear from the cart

   Examples: 
   |number|
   |1     |
   |3     |
   
   @sanity
   Scenario: 1.2.04: User should be able to remove all the items from the cart on the Inventory page
   Given user added all the items from the <list of items> table into the cart 
   And Inventory page was displayed
   When user removes from the cart all the items from the <list of items> table by clicking "Remove" button next to each item
   Then the cart should be empty
   
