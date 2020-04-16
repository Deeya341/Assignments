*** Settings ***
Library    SeleniumLibrary    
Library    Collections
Library    String        
Resource    ../Object Repository/Locators.robot
Resource    ../TestData/ConfigData.robot

*** Keywords ***
Launch Application
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Application is Launched
    Wait Until Element Is Visible    ${LOGIN_MENU}    ${wait15}
    Log    URL Launched Successfully    
    
Select the Category
    Wait Until Element Is Visible    ${WOMEN_CATEGORY}    
    Click Element    ${WOMEN_CATEGORY}
        
Category is selected
    Wait Until Element Is Visible    ${WOMEN_CATEGORY_HEADING}    ${wait15}
    Log    Category successfully selected    
    
Sort the items by Price
    Wait Until Element Is Visible    ${SORT_BUTTON}    ${wait15}    
    Mouse Over    ${SORT_BUTTON}
    Mouse Over    ${SORT_PRICE}
    Click Element    ${SORT_PRICE} 

Items Sorted with respect to Price
    Wait Until Element Is Visible    ${SORT_BUTTON_VALUE}    ${wait5}
    ${actualSort}    Get Text    ${SORT_BUTTON_VALUE}
    ${actualSort}    Convert To String    ${actualSort}
    Should Contain    ${actualSort}    ${expectedSort}            
    
Select the item to be purchased
    [Arguments]    ${product}
    Wait Until Element Is Visible    ${product}    ${wait15}
    Scroll Element Into View    ${product}
    Mouse Over    ${product}
    Click Element    ${product}
    Wait Until Element Is Visible    ${PRODUCT_SIZE}    ${wait5}    
    Click Element    ${PRODUCT_SIZE} 
    Scroll Element Into View    ${ADDTOCART_BUTTON}
    Click Element    ${ADDTOCART_BUTTON}    
    Go Back
    
Product was added to cart
    [Arguments]    ${expectedcount}
    Wait Until Element Is Visible    ${CART_COUNT}    ${wait15}
    ${actualCount}    Get Text    ${CART_COUNT}
    Should Be Equal    ${actualCount}    ${expectedCount}     
        
Goto Cart
    Wait Until Element Is Visible    ${CARTLINK}    ${wait15}
    Click Element    ${CARTLINK}
    Wait Until Element Is Visible    ${CARTHEADER}    ${wait15}
    
Cart is opened
    Wait Until Element Is Visible    ${CARTHEADER}    ${wait15}
        
Validate that two items selected
    ${actualCartCount}=    Get Element Count    ${CARTITEMSTITLE}
    Should Be Equal As Numbers    ${countTwo}    ${actualCartCount}
    
Items are validated
    Log    Two products were added to cart    
