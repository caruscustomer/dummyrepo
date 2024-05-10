*** Settings ***
Documentation   Suite description
Variables   ../resources/locators/product_list_locator.py
Variables   ../resources/locators/base_locator.py
Variables   ../resources/locators/home_locator.py
Variables   ../resources/data/testdata.py
Resource    ../base/setup.robot
Resource    ../base/base.robot
Resource    ../base/common.robot
Resource    ../pages/home_page.robot

Test Setup  Start Test Case
Test Teardown    End Test Case

*** Test Cases ***
TCPLP1.Customers able to Change product view as Grid on PLP
    [Tags]    PLP  TCPLP1
    # View as List
    CLick Element    ${MenuWoman}
    Click Element    ${ProductsListViewIcon}
    Wait Until Page Contains Element    ${ProductListViewContainer}

    # View as Grid
    Click Element    ${ProductsGridViewIcon}
    Wait Until Page Contains Element    ${ProductGridViewContainer}