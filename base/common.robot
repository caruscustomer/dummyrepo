*** Settings ***
Library     SeleniumLibrary
Library     String
Variables   ../resources/data/testdata.py
Variables   ../resources/locators/base_locator.py
Variables   ../resources/locators/cart_page_locator.py
Resource    ../base/base.robot

*** Keywords ***
Alert Success Validation
    Wait Until Element Is Visible           ${MessageSuccessAlert}
    Click Element                           ${CloseMessageBtn}
    
Wait Until Element Is Visible With Long Time
    [Arguments]    ${Element}
    Wait Until Element Is Visible    ${Element}    60

Wait Until Element Is Not Visible With Long Time
    [Arguments]    ${Element}
    Wait Until Element Is Not Visible    ${Element}    60

Alert Warning Validation Register
   [Arguments]                              ${AlertMessage}
    Wait Until Element Is Visible           ${AlertMessage}

Empty the items in MiniCart
    Go To Home Page
    Click Element   ${HeaderShoppingCartButton}
    ${present}=     Run Keyword and Return Status           Wait Until Page Contains Element        ${MinicartDeleteItem}
    WHILE  ${present}
        Click Element                                       ${MinicartDeleteItem}
        Wait Until Element Is Not Visible                   ${LoadingPage}
        ${present}=     Run Keyword and Return Status       Wait Until Page Contains Element        ${MinicartDeleteItem}
    END
    Close The Minicart
    Go To Home Page 

Open Minicart
    Click Element   ${HeaderShoppingCartButton}

Close The Minicart
    Wait Until Element Is Visible                           ${BtnCloseMiniCart}
    Click Element                                           ${BtnCloseMiniCart}

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y}-100)

