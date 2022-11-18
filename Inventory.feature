Feature: 1.2. Inventory page

Background: 
Given username standard_user with password secret_sauce
And application URL is opened with Inventory page on main page

Scenario: 1.2_01. User should be able to see Add to Cart/Remove button
Given list of items in the apps
When user sees items listed on main page 
Then user should see Add to Cart or Remove button for each item.

Scenario Outline: 1.2_02. User should be able to add one/several items into the cart
Given list of items in the apps on the main page
When user presses Add to Cart button of the <item>
Then remove button of the <item> should become active
And the number of items in the cart should change to <quantity>
And the <item> should be displayed in the cart

Examples:
|Item                            |Quantity|
|Sauce Labs Backpack             |1       |
|Test.allTheThings() T-shirt(Red)|2       |


Scenario: 1.2_03 User should be able to add all items into the cart
Given list of items on the main page with Add to Cart button active
When user presses Select all - Add to Cart button
Then all items should be added to the cart
And all items should have Remove button active

Scenario Outline: 1.2_04 User should be able to remove one / several  items from the cart
Given list of items in the Cart with Remove button available
And the number of items in the cart is 2
When user presses Remove button of the <item>
Then the <item> should dissapear from the Card 
And the number of items in the cart should become <quantity>
And the <item> should be displayed on the main page with Add to Cart button

Examples:
|Item                            |Quantity|
|Sauce Labs Backpack             |1       |
|Test.allTheThings() T-shirt(Red)|null    |

Scenario: 1.2_05 User should be able to remove all items from the cart
Given list of all items in the cart with Remove button active
When user presses Select all - Remove button
Then all the items should dissapear from the cart
And the items removed from the cart should be displayed on the main page with Add to Cart button
