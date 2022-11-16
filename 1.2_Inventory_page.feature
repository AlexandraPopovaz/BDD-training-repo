Feature: 1.2_Inventory_page As a user I want to use different possibilities of the "Inventory" page.

Background:
	Given Application https://www.saucedemo.com/URL is opened
	And User signed in with standard_user and secret_sauce password
	And "Inventory" page is shown

@smoke
#User should be able to add one/several/all items into the Cart using "Inventory" page
Scenario Outline: 1.2_01 Add items into Cart
	Given <items in the cart> were added into Cart
	And <items in the cart>  was shown on Cart icon
	But no number on Cart icon was shown if <items in the cart>==0
	When User clicks on button "ADD TO CART" of the item
	Then User should see number = <items in the cart> + 1 on Cart icon
	And Button of the item should change into "REMOVE"

Examples:
	| items in the cart | 
	| 0                 | 
	| 1                 | 
	| 2                 | 
	| 3                 | 
	| 4                 | 
	| 5                 | 

@sanity
#User should be able to remove one/several/all items into the Cart using "Inventory" page
Scenario Outline: 1.2_02 Remove items from Cart
	Given <items in the cart> were added into Cart
	And <items in the cart>  was shown on Cart icon
	When User clicks on button "REMOVE" of the item
	Then Button of the item should change into "ADD TO CART"
	And User should see number = <items in the cart> - 1 on Cart icon
	But see no number on Cart icon if <items in the cart>-1==0

Examples:
	| items in the cart |  
	| 1                 | 
	| 2                 | 
	| 3                 | 
	| 4                 | 
	| 5                 | 
	| 6                 | 