*** Settings ***
Documentation    Test Suite to add two items to the cart
Library    Selenium2Library    
Resource    ../Keywords/Commons.robot
Resource    ../Object Repository/Locators.robot

Test Setup    Launch Application
Test Teardown    Close Browser

*** Test Cases ***
TC01
    Select the Category
    ${Screenshot}=    Capture Page Screenshot    CategorySelected.png    
    Sort the items by Price
    ${Screenshot}=    Capture Page Screenshot    ItemsSorted.png
    Select the item to be purchased    ${PRODUCT1}
    ${Screenshot}=    Capture Page Screenshot    Item1Added.png
    Select the item to be purchased    ${PRODUCT2}
    ${Screenshot}=    Capture Page Screenshot    Item2Added.png
    Goto Cart
    Validate that two items selected
    ${Screenshot}=    Capture Page Screenshot    CartValidation.png