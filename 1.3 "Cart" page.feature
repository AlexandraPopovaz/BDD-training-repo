Feature: 1.3 "Cart" page

    Background:
        Given user signed in into the App
        And "Products" page is opened

    @Smoke
    Scenario Outline: 1.3_01 user should be able to add one/several items into the Cart
        Given <items> on the "Products" page
        When user clicks "add to cart" button on the <items>
        Then <items> should be added into the cart
        And the number of added <items> should become visible at the top right corner

        Examples:
          | items                            |
          | Sauce Labs Backpack              |
          | Sauce Labs T-shirt               |
          | Sauce Labs Onesie                |
          | Sauce Labs Bike Light            |
          | Sauce Labs Fleece Jacket         |
          | Test.allTheThings() T-shirt(Red) |

    @Sanity
    Scenario Outline: 1.3_02 user should be able to remove one/several items from the Cart
        Given <items> are added into the cart
        When user clicks "remove" button
        Then <items> should be removed from the cart

        Examples:
          | items                            |
          | Sauce Labs Backpack              |
          | Sauce Labs T-shirt               |
          | Sauce Labs Onesie                |
          | Sauce Labs Bike Light            |
          | Sauce Labs Fleece Jacket         |
          | Test.allTheThings() T-shirt(Red) |

    @Sanity
    Scenario Outline: 1.3_03 user should be able to be redirected to the "Cart" page
        Given <items> are added into the cart
        When user clicks on the cart sign on the top right corner of the page
        Then "Cart" page should become visible

        Examples:
          | items                            |
          | Sauce Labs Backpack              |
          | Sauce Labs T-shirt               |
          | Sauce Labs Onesie                |
          | Sauce Labs Bike Light            |
          | Sauce Labs Fleece Jacket         |
          | Test.allTheThings() T-shirt(Red) |

    @Sanity
    Scenario Outline: 1.3_04 user should be able to be redirected to the "Checkout information" page
        Given "Cart" page with added <items> is opened
        When user clicks "checkout" button
        Then "Checkout information" page should become visible

        Examples:
          | items                            |
          | Sauce Labs Backpack              |
          | Sauce Labs T-shirt               |
          | Sauce Labs Onesie                |
          | Sauce Labs Bike Light            |
          | Sauce Labs Fleece Jacket         |
          | Test.allTheThings() T-shirt(Red) |