Feature: 1.3 Cart page

Background:
	Given user signed in as a "standard_user"
	And user was redirected to the "inventory" page

@Regression
Scenario Outline: 1.3_01 user should be able to add one item into the cart
	Given user clicked on the "ADD TO CART" button for the <this> item
	When user clicks on the cart icon in the header of the website
	Then user should be redirected to the "cart" page
	And the <that> item should be displayed

	Examples:
		| this                              | that                              |
		| Sauce Labs Backpack               | Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           | Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) | Test.allTheThings() T-Shirt (Red) |

@Regression
Scenario: 1.3_02 user should be able to add several items into the cart
	Given user clicked on the "ADD TO CART" button for the following items:
		| items                             |
		| Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) |
	When user clicks on the cart icon in the header of the website
	Then user should be redirected to the "cart" page
	And following items should be displayed:
		| items                             |
		| Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) |

@Smoke
Scenario Outline: 1.3_03 user should be able to remove one item from the cart
	Given the <this> item was added to the cart
	And the "cart" page was opened
	When user clicks on the "REMOVE" button for the <that> item
	Then the <those> item should no longer be displayed

	Examples:
		| this                              | that                              | those                             |
		| Sauce Labs Backpack               | Sauce Labs Backpack               | Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           | Sauce Labs Bolt T-Shirt           | Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) | Test.allTheThings() T-Shirt (Red) | Test.allTheThings() T-Shirt (Red) |

@Sanity
Scenario: 1.3_04 user should be able to remove several items from the cart
	Given the following item were added to the cart:
		| items                             |
		| Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) |
	And the "cart" page was opened
	When user clicks on the "REMOVE" button for following items:
		| items                             |
		| Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) |
	Then the following items should no longer be displayed:
		| items                             |
		| Sauce Labs Backpack               |
		| Sauce Labs Bolt T-Shirt           |
		| Test.allTheThings() T-Shirt (Red) |

@Smoke
Scenario: 1.3_05 user should be able to continue shopping after adding goods into the cart
	Given the following items were added to the cart:
		| items                   |
		| Sauce Labs Onesie       |
		| Sauce Labs Bolt T-Shirt |
	And the "cart" page was opened
	And "CONTINUE SHOPPING" button was located on the page
	When user clicks on the "CONTINUE SHOPPING" button
	Then user should be redirected to the "inventory" page
	And all items should be displayed

@Smoke
Scenario Outline: 1.3_06 user should be able to see the number of goods in the cart
	Given user added <this> item(s) into the cart
	When user locates the cart icon in the header of the website
	Then notification that corresponds to <that> item(s) should be displayed on the cart icon

	Examples:
		| this | that |
		| 1    | 1    |
		| 3    | 3    |
		| 6    | 6    |

@Smoke
Scenario: 1.3_07 user should be able to be redirected to the “Checkout information” page
	Given the following items were added to the cart:
		| items                   |
		| Sauce Labs Onesie       |
		| Sauce Labs Bolt T-Shirt |
	And the "cart" page was opened
	And "CHECKOUT" button was located on the page
	When user clicks on the "CHECKOUT" button
	Then user should be redirected to the "Checkout information" page
	And following input fields should be displayed on the page:
		| input fields    |
		| First Name      |
		| Last Name       |
		| Zip/Postal Code |