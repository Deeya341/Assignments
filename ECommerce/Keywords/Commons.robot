*** Settings ***
Library    Selenium2Library    
Library    Collections    
Resource    ../Object Repository/Locators.robot
Resource    ../TestData/ConfigData.robot

*** Keywords ***
Launch Application
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Application is Launched
    Log    URL Launched Successfully    
    
Select the Category
    Wait Until Element Is Visible    ${WOMEN_CATEGORY}    
    Click Element    ${WOMEN_CATEGORY}
    Wait Until Element Is Visible    ${WOMEN_CATEGORY_HEADING}    ${wait15}    
   
Category is selected
    Log    Category successfully selected    
    
Sort the items by Price
    Wait Until Element Is Visible    ${SORT_BUTTON}    ${wait15}    
    Mouse Over    ${SORT_BUTTON}
    Mouse Over    ${SORT_PRICE}
    Click Element    ${SORT_PRICE} 
    
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
    
Goto Cart
    Wait Until Element Is Visible    ${CARTLINK}    ${wait15}
    Click Element    ${CARTLINK}
    Wait Until Element Is Visible    ${CARTHEADER}    ${wait15}
    
Validate that two items selected
    ${actualCartCount}=    Get Element Count    ${CARTITEMSTITLE}
    Should Be Equal As Numbers    ${expectedCartCount}    ${actualCartCount}