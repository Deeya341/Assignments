*** Settings ***
Documentation    Test Suite to add two items to the cart
Library    SeleniumLibrary    
Resource    ../Keywords/Commons.robot
Resource    ../Object Repository/Locators.robot


Test Teardown    Close Browser

*** Test Cases ***
TC01
    Launch Application
    Application is Launched
    Select the Category
    Category is selected
    ${Screenshot}=    Capture Page Screenshot    CategorySelected.png
    Sort the items by Price
    Items Sorted with respect to Price
    ${Screenshot}=    Capture Page Screenshot    ItemsSorted.png
    Select the item to be purchased    ${PRODUCT1}
    Product was added to cart    ${countOne}
    ${Screenshot}=    Capture Page Screenshot    Item1Added.png
    Select the item to be purchased    ${PRODUCT2}
    Product was added to cart    ${countTwo}
    ${Screenshot}=    Capture Page Screenshot    Item2Added.png
    Goto Cart
    Cart is opened
    ${Screenshot}=    Capture Page Screenshot    Cart.png
    Validate that two items selected
    Items are validated
    ${Screenshot}=    Capture Page Screenshot    CartValidation.png
