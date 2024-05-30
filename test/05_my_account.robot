*** Settings ***
Documentation       Suite description

Resource            ../base/setup.robot
Resource            ../base/base.robot
Resource            ../base/common.robot
Resource            ../pages/login_page.robot
Resource            ../pages/my_account_page.robot


Test Setup          Start Test Case
Test Teardown       End Test Case


*** Test Cases ***

L-TCMy1.Logged In User Can Edit Information
    [Tags]      account
    To Login Page
    Input Login Form    ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation    ${EmailAddressRegistered}
    To Account Information
    ${NewPhoneNumber}=    Generate Random Phonenumber
    ${NewWANumber}=    Generate Random Phonenumber
    ${NewName}=    Generate Random Name
    Change Information        ${FirstName}${NewName}    ${LastName}${NewName}   ${NewPhoneNumber}    ${NewWANumber}
    Save Information
    Validate Message Success Alert Is Visible

L-TCMy2.Logged In User Can Check History Order
    [Tags]      account
    To Login Page
    Input Login Form                  ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation        ${EmailAddressRegistered}
    To My Order

L-TCMy3.Logged In User Can Access Wishlist Page
    [Tags]      account
    To Login Page
    Input Login Form                  ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation        ${EmailAddressRegistered}
    To My Wishlist From Nav Bar    

L-TCMy4.Logged In User Can Edit Account Information
    [Tags]      account
    To Login Page
    Input Login Form                  ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation        ${EmailAddressRegistered}
    To Account Information by Main Menu
    ${NewPhoneNumber}=    Generate Random Phonenumber
    ${NewWANumber}=    Generate Random Phonenumber
    ${NewName}=    Generate Random Name
    Change Information        ${FirstName}${NewName}    ${LastName}${NewName}   ${NewPhoneNumber}    ${NewWANumber}
    Save Information
    Validate Message Success Alert Is Visible

L-TCMy5.Logged In User Cannot Edit Account Information with Blank Fields
    [Tags]      account
    To Login Page
    Input Login Form                  ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation        ${EmailAddressRegistered}
    To Account Information by Main Menu
    #Validate Empty First Name
    Change Information        ${EMPTY}    ${LastName}   ${PhoneNumber}    ${PhoneNumber}
    Save Information
    Alert Visible Validation                   ${AlertMessage}
    #Validate Empty Last Name
    Change Information        ${FirstName}    ${EMPTY}   ${PhoneNumber}    ${PhoneNumber}
    Save Information
    Alert Visible Validation                   ${AlertMessage}
    #Validate Empty Phone Number
    Change Information        ${FirstName}    ${LastName}   ${EMPTY}    ${PhoneNumber}
    Save Information
    Alert Visible Validation                   ${AlertMessage}
    #Validate Empty WA Number
    Change Information        ${FirstName}    ${LastName}   ${PhoneNumber}    ${EMPTY}
    Save Information
    Alert Visible Validation                   ${AlertMessage}

L-TCMy6.Logged In User Updates Phone Number and WhatsApp Number in Account Information By Filling Random Characters
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Account Information by Main Menu
    Change Phone Number and Whatsapp Number    ${FirstName}    ${Password}
    Alert Visible Validation                   ${AlertMessage}

L-TCMy7.Logged In User Review Page Access
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To My Product Review

L-TCMy8.Logged In User Vew Store Credit & Refund Historical Transaction
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Store Credit & Refund

L-TCMy9.Logged In User Vew Reward Points Historical Transaction
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Reward Points

L-TCMy10.1.Logged in users can subscribe to the newsletter through the My Account page
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Newsletter Subscriptions Page
    Subcribe Newsletter Subscriptions

L-TCMy10.2.Logged in users can unsubscribe to the newsletter through the My Account page
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Newsletter Subscriptions Page
    UnSubcribe Newsletter Subscriptions

L-TCMy11.Logged In User View Available Gift Cards and Check Balance
    [Tags]      account
    Log    "Please To Create GiftCard in the Backoffice with amount total is Rp 100.000 and update 'GiftCardCodeManually'!"
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Gift Card Page
    Submit Gift Card Code Manually             ${GiftCardCodeManually}
    Validation of Gift Card from the My Account page    ${GiftCardCodeManually}


L-TCMy13.Verify Invalid Gift Card Code
    [Tags]      account
    To Login Page
    Input Login Form                           ${EmailAddressRegistered}    ${Password}
    Submit Form Login
    My Account Page Validation                 ${EmailAddressRegistered}
    To Gift Card Page
    ${GiftCardRandom}=    Generate Random Name
    Submit Gift Card Code Manually             ${GiftCardRandom}
    Alert Visible Validation                   ${InvalidGiftCardAlertMessage}