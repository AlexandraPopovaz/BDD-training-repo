Feature: 1.2. Inventory page

Background: 
Given username standard_user with password secret_sauce
And application URL is opened with Inventory page on main page

Scenario: 1.2_01. User should be able to see Add to Cart button
Given list of items in the apps
When user can see all items listed on main page 
Then user can see Add to Cart button for each item.

Scenario Outline: 1.2_02. User should be able to add one/several items into the cart
Given <item>'s list on the main page
When user press Add to Cart button
Then remove button of the items will become active
And the item/s added are displayed in the cart

Examples:
|Item                            |
|Sauce Labs Backpack             |
|Sauce Labs T-shirt              |
|Sauce Labs Onesie               |
|Sauce Labs Bike Light           |
|Sauce Labs Fleece Jacket        |
|Test.allTheThings() T-shirt(Red)|


Scenario: 1.2_3 User should be able to add all items into the cart
Given list of items on the main page with Add to Cart button active
When user press Select all - Add to Cart button
Then all items are added to the cart
And all items have Remove button active

Scenario outline: 1.2_4 User should be able to remove one / several  items from the cart
Given <item>'s list in the Cart with Remove button available
When user press Remove button
Then the items dissapeared from the Card 
And the items removed are displayed in the main page with Add to Cart button

Examples:
|Item                            |
|Sauce Labs Backpack             |
|Sauce Labs T-shirt              |
|Sauce Labs Onesie               |
|Sauce Labs Bike Light           |
|Sauce Labs Fleece Jacket        |
|Test.allTheThings() T-shirt(Red)|

Scenario: 1.2_5 User should be able to remove all items from the cart
Given list of items in the cart with Remove button active
When user press Select all - Remove button
Then all the items dissapeared from the cart
And the items removed from the cart are displayed in the main page with Add to Cart button
