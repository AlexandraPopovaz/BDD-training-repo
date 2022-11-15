Feature: 1.2. Inventory page

Background: valid username and password for User

Scenario: 1.2_01. User should be able to see Add to Cart button
Given application URL is opened with Inventory page on main page
When user can see all items listed on main page 
Then user can see Add to Cart button for each item.

Scenario: 1.2_02. User should be able to add one item into the cart
Given application URL is opened with Inventory page on main page
When user press Add to Cart button
Then remove button will become inactive
And the item added is displayed in the cart

Scenario: 1.2_3. User should be able to add several items into the cart
Given application URL is opened with Inventory page on main page
When user press Add to Cart button for three items on Inventory page
Then all the items added will have Remove button inactive
And all three items are shown in the Cart

Scenario: 1.2_4 User should be able to add all items into the cart
Given application URL is opened with Inventory page on main page
When user press Select all button 
And press Add to Cart button
Then all items are added to the cart
And all items have Remove button

Scenario: 1.2_5 User should be able to remove one item from the cart
Given application URL is opened with Inventory page on main page
When user press Cart button to see added items
And pressed Remove button for one item in the cart
Then the item dissapeared from the list
And the item is displayed in the main page with Add to Cart button

Scenario: 1.2_6 User should be able to remove several items from the cart
Given application URL is opened with Inventory page on main page
When user press Cart button to see added items
And pressed Remove button for three items
Then the items dissapeared from the list
And the items removed from the cart are displayed in the inventory page with Add to Cart button

Scenario: 1.2_7 User should be able to remove all items from the cart
Given application URL is opened with Inventory page on main page
When user press Cart button to see added items
And pressed Select all to select all item from the list
And pressed Remove button
Then all the items dissapeared from the list
And the items removed from the cart are displayed in the minventory page with Add to Cart button