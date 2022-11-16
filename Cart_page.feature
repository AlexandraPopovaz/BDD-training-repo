Feature: 1.3 Cart page

Background: 
	Given the application URL:https://www.saucedemo.com/ was opened
	And user signed in to the App as a standard_user

 @Smoke
 Scenario: 1.3.01 User should be able to add one or several items into the Cart
	 Given inventory page was opened
	 When user clicks on 'add to cart' button below the <item>
	 Then the 'add to cart' button is changed to 'remove' button 
	 And at the cart page the <qty> <item> <price> and description information of the added items should be visible 

	 Examples:
		|  qty  | item                     | price |
		|  1    | Sauce Labs Backpack      |$29.99 |
		|  1    | Sauce Labs Fleece Jacket |$49.99 |
		|  1    | Sauce Labs Onesie        |$7.99  |    

 @Sanity
 Scenario: 1.3.02 User is able to remove one or several items from the Cart
	 Given <item> were added to the cart 
	 And user clicked on 'cart' button
	 And user was redirected to cart page
	 When user clicks 'remove' button below the <item>
	 Then the <item> should be removed from the cart

	 Examples:
		| item                  |  
		| Sauce Labs Bike Light |   
		| Sauce Labs Onesie     |   
		| Sauce Labs Backpack   |   

 @Regression
 Scenario: 1.3.03 User is able to continue shopping after adding goods into the Cart
	 Given items were added to the cart 
	 And the cart page was opened
	 When user clicks on 'continue shopping' button in the bottom left corner of the cart page
	 Then inventory page should be opened

 @Sanity
 Scenario: 1.3.04 User is able to see the number of goods in the Cart
	 Given user opened the inventory page
	 When user clicks on 'add to cart button' below the <item>
	 Then the number on the 'cart' button icon should become <quantity>

	 Examples:
		| item                  | quantity| 
		| Sauce Labs Bike Light |    1    |
		| Sauce Labs Onesie     |    2    |
		| Sauce Labs Backpack   |    3    |

 @Smoke
 Scenario: 1.3.05 User is able to be redirected to the "Checkout information" page
	 Given user added items into the cart 
	 And cart page was opened
	 When user clicks on 'chekout' button 
	 Then "Checkout information" page should be opened
	 And the following elements should be visible:

		|            control            |  type   |
		|   CHECKOUT: YOUR INFORMATION  |  title  |
		|   cart icon                   |  button |
		|   cancel                      |  button |
		|   continue                    |  button |
		|   First name                  |  input  |
		|   Last name                   |  input  |
		|   Zip/Postal code             |  input  |

@Sanity
Scenario: 1.3.06 Verification of the item price
	Given user added the <item> to the cart
	When user opens the cart page
	Then the <item> should be visible in the cart
	And the cost of an <item> should equal to <price>

	Examples:
		| item                     |  price |
		| Sauce Labs Backpack      | $29.99 |
		| Sauce Labs Fleece Jacket | $49.99 |
		| Sauce Labs Onesie        | $7.99  |
