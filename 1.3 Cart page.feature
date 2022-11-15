Feature: 1.3 Cart page
	
Background:
	Given user logged in with the user credentials
	
@Smoke	
Scenario outline: 1.3.01 The user can add one/several items into the Cart
	Given user opened “Inventory” page 
	When user adds  <number>  items  clicking on "Add to Cart" button 
	Then "Add to Cart" button should be changed to "Remove" button
	And  < number >  of items should appear in Cart icon on the top right corner
	And following item’s elements should be visible in the Cart:
		| name        | type   |
		| Quantity    | field  |
		| Name        | text   |
		| Description | text   |
		| Price       | field  |
		| Remove      | button |
Examples:
	| number | 
	| 1      | 
	| 2      | 

@Sanity
Scenario outline: 1.3.02 The user can remove one/several items from the Cart
	Given  user added 3 items into the Cart
	And user opened Cart page
	When user removes <number>  items clicking on "Remove" button 
	Then <number>  items should disappear from the Cart list
	And Cart page should remain opened
Examples:
	| number | 
	| 1      | 
	| 2      | 
 
@Regression
Scenario: 1.3.03 The user can continue shopping after adding goods into the Cart
	Given  user added 3 items into the Cart
	And user opened Cart page
	When user clicks on "Continue shopping" button
	Then "Inventory" page should be opened
	
@Sanity
Scenario outline: 1.3.04 The user can see number of goods in the Cart
	Given  user had <number> items in the Cart
	And user opened "Inventory" page 
	When user clicks on "Add to Cart" button
	Then <quantity>  items should appear in Cart icon on the top right corner
Examples:
	| number | quantity |
	| 0      | 1        |
	| 3      | 4        |
	| 5      | 6        |
 
@Smoke
Scenario: 1.3.05 The user can be redirected to the "Checkout information" page.
	Given user opened Cart page
	When user clicks on " Checkout information " button
	Then "Checkout information" page should be opened
	And following elements should be visible:
		| name                      | type   |
		| CHECKOUT: YOUR INFORMATION| title  |
		| FirstName                 | input  |
		| LastName                  | input  |
		| Zip/Postal Code           | input  |
		| Cancel                    | button |
		| Continue                  | button |