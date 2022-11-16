Feature:1.2. Inventory Page

Background:
   Given application url was opened
   And the standard_user signed in
   

   @smoke
   Scenario Outline: 1.2.01: User should be able to add one/several and all items into the cart on the Inventory page
   Given inventory page was displayed
   When user adds <number> of itmes into the cart by clicking "add to cart" button
   Then user should be able to see <number> of items in the cart

   Examples: 
   |number|
   |1     |
   |3     |
   |all   |

   @sanity
   Scenario Outline: 1.2.02: User should be able to remove one/several and all items from the cart on the Inventory page
   Given user added <number> of item/s into the cart on the Inventory page
   When user removes <number> of items from the cart by clicking "Remove" button on the inventory page
   Then user should be able to see <number> of items disappear from the cart

   Examples: 
   |number|
   |1     |
   |3     |
   |all   |
