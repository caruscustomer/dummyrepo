*** Settings ***
Documentation       Suite description
Library             DateTime
Resource            ../base/setup.robot
Resource            ../base/base.robot
Resource            ../pages/cart_page.robot
Resource            ../pages/home_page.robot
Resource            ../pages/product_detail_page.robot
Resource            ../pages/checkout_page.robot
Resource            ../pages/login_page.robot
Variables           ../resources/locators/scv2_locator.py

Test Setup          Start Test Case
Test Teardown       End Test Case


*** Test Cases ***
G-TCCHG1.Login with invalid whatsapp number format
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductVirtualSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductVirtualNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=0
    SCV2 Submit Login
    Invalid Login Validation

G-TCCHG3.Add shipping address
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    ${AddressIsEmty}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${ButtonAddAddressCheckoutPage}
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    IF    ${AddressIsEmty}
        Click Element    ${ButtonAddAddressCheckoutPage}
    ELSE
        Click Element    ${ButtonChangeSelectedAddressCheckoutPage}
    END
        Click Element    ${ButtonAddNewAddressInAddressList}
    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address

    Change Selected Address
    Save Selected Address
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG4.Add shipping address with empty fields
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}


    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    
    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}
    
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    ${AddressIsEmty}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${ButtonAddAddressCheckoutPage}
    IF    ${AddressIsEmty}
        Click Element    ${ButtonAddAddressCheckoutPage}
    ELSE
        Click Element    ${ButtonChangeSelectedAddressCheckoutPage}
    END
        Click Element    ${ButtonAddNewAddressInAddressList}
    Validate Blank Pinpoint
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${EMPTY}
    Save Address
    SCV Validate Blank Pinpoint New Address
    
    Input Address Form
    ...    ${EMPTY}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${EMPTY}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${EMPTY}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${EMPTY}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${EMPTY}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

G-TCCHG5.Change shipping address
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}


    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    # Melakukan pengechekan, jika alamat yang di miliki user kurang dari 2, maka akan melakukan penambahan data alamat
    Wait Until Element Is Visible With Long Time    ${ButtonChangeSelectedAddressCheckoutPage}
    Click Element    ${ButtonChangeSelectedAddressCheckoutPage}
    Count and Add address If Less Than Two

    Change Selected Address
    Save Selected Address
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG6.Billing address same as Shipping address
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    Select Billing Address Same As Shipping Address

    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG7.Add New Billing Address
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    UnSelect Billing Address Same As Shipping Address
    Adding New a Billing Address

    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG8.Use different billing address
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    UnSelect Billing Address Same As Shipping Address
    Selecting or Adding New a Billing Address

    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG11.Home Delivery checkout with no shipping method
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName} =    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue} =    Get Product Name From Minicart
    &{Arguments} =    Create Dictionary    productName=@{productName}    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=081234567890
    SCV2 Submit Login
    SCV2 Request OTP
    SCV2 Send OTP
    Wait Until Element Is Visible With Long Time    ${SCVHomeDeliveryButton}
    Click Element    ${SCVHomeDeliveryButton}
    Element Should Be Disabled    ${SCVPayButton}

G.TCCHG13.Checkout with Midtrans BRI Virtual Account (VA) Payment Method for Registered
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}


    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownBRIVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG14.Checkout with Midtrans Permata Virtual Account (VA) Payment Method for Registered
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}
    Select Shipping Method
    Select Payment Method    ${DropdownPermataVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG15.Checkout with Midtrans BNI Virtual Account (VA) Payment Method for Registered
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}


    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownBNIVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

G-TCCHG18.Apply invalid coupon code 
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}


    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Select Promotion
    ${PromotionCode}    Generate Random Keyword
    Input Promo Code    ${PromotionCode}
    Select Button Apply Promo    
    Invalid Promo Code Validation

G-TCCHG22.Continue shopping after checkout
    [Tags]    checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductSimpleNameForSearch}
    Validate Search Product And Go To PDP    ${ProductSimpleNameForSearch}
    @{productName}    Add To Cart    Qty=3
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation
    Continue Shopping

G-TCCHG25.Successful Checkout Test with simple product using registered account
    [Tags]    Checkout
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductSimpleSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductSimpleNameForSearch}
     @{productName} =    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue} =    Get Product Name From Minicart
    &{Arguments} =    Create Dictionary    productName=@{productName}    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart
    Input SCV2 Login Phone Number    PhoneNumber=${OtpPhonenumber}

    Select First Item In Verification Method
    ${GetOTP}    Generate SCV2 Password
    Input SCV2 Login OTP    ${GetOTP}

    SCV2 Submit Login
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}

    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    # Melakukan pengechekan, jika alamat yang di miliki user kurang dari 2, maka akan melakukan penambahan data alamat
    Wait Until Element Is Visible With Long Time    ${ButtonChangeSelectedAddressCheckoutPage}
    Click Element    ${ButtonChangeSelectedAddressCheckoutPage}
    Count and Add address If Less Than Two

    Change Selected Address
    Save Selected Address
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

TCSC1.Customers can access the shopping cart page
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductVirtualSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductVirtualNameForSearch}
    @{productName} =    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue} =    Get Product Name From Minicart
    &{Arguments} =    Create Dictionary    productName=@{productName}    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart

    Wait Until Element Is Visible    ${ShoppingCartTotalPrice}
    ${PriceInShoppingCart}    Get Text    ${ShoppingCartTotalPrice}
    ${PriceShoppingCartInt}    Convert Price String To Integer    ${PriceInShoppingCart}
    Click Button    ${ButtonIncrease}
    Wait Until Element Is Not Visible With Long Time  ${ShoppingCartLoader}
    Wait Until Element Is Visible    ${ShoppingCartTotalPrice}
    ${PriceInShoppingCart}    Get Text    ${ShoppingCartTotalPrice}
    ${PriceShoppingCartIntIncrement}    Convert Price String To Integer    ${PriceInShoppingCart}
    Should Be True    ${PriceShoppingCartIntIncrement} > ${PriceShoppingCartInt}

    Click Button    ${ButtonDecrease}
    Wait Until Element Is Not Visible With Long Time    ${ShoppingCartLoader}
    Wait Until Element Is Visible    ${ShoppingCartTotalPrice}
    ${PriceInShoppingCart}    Get Text    ${ShoppingCartTotalPrice}
    ${PriceShoppingCartIntDecrement}    Convert Price String To Integer    ${PriceInShoppingCart}
    Should Be True    ${PriceShoppingCartIntDecrement} < ${PriceShoppingCartIntIncrement}

    Wait Until Element Is Enabled    ${ShoppingCartDelete}
    Click Button    ${ShoppingCartDelete}
    Wait Until Element Is Visible With Long Time  ${ButtonStartShopping}

TCSC2.Customer deleted the item
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductVirtualSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductVirtualNameForSearch}
    @{productName} =    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue} =    Get Product Name From Minicart
    &{Arguments} =    Create Dictionary    productName=@{productName}    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Wait Until Element Is Visible    ${MinicartSubtotal}
    ${PriceInMinicart}    Get Text    ${MinicartSubtotal}
    ${PriceMinicartInt}    Convert Price String To Integer    ${PriceInMinicart}
    Click Button    ${MinicartIncrease}
    Wait Until Element Is Not Visible With Long Time  ${MinicartLoader}
    Wait Until Element Is Visible    ${MinicartSubtotal}
    ${PriceInMinicart}    Get Text    ${MinicartSubtotal}
    ${PriceMinicartIntIncrement}    Convert Price String To Integer    ${PriceInMinicart}
    Should Be True    ${PriceMinicartIntIncrement} > ${PriceMinicartInt}
    Click Button    ${MinicartDecrease}
    Wait Until Element Is Not Visible With Long Time    ${MinicartLoader}
    Wait Until Element Is Visible    ${MinicartSubtotal}
    ${PriceInMinicart}    Get Text    ${MinicartSubtotal}
    ${PriceMinicartIntDecrement}    Convert Price String To Integer    ${PriceInMinicart}
    Should Be True    ${PriceMinicartIntDecrement} < ${PriceMinicartIntIncrement}
    Empty the items in MiniCart
    Wait Until Element Is Visible With Long Time  ${ButtonStartShopping}

L-TCCHR6.Add shipping address with empty fields
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    
    Scroll Down To Element    ${ButtonToCheckout}
    Click Element    ${ButtonToCheckout}
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    
    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}
    
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    ${AddressIsEmty}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${ButtonAddAddressCheckoutPage}
    IF    ${AddressIsEmty}
        Click Element    ${ButtonAddAddressCheckoutPage}
    ELSE
        Click Element    ${ButtonChangeSelectedAddressCheckoutPage}
    END
        Click Element    ${ButtonAddNewAddressInAddressList}
    Validate Blank Pinpoint
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${EMPTY}
    Save Address
    SCV Validate Blank Pinpoint New Address
    
    Input Address Form
    ...    ${EMPTY}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${EMPTY}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${EMPTY}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${EMPTY}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

    Input Address Form
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${EMPTY}
    ...    ${ShipmentPinLocation}
    Save Address
    SCV Validate Blank Field New Address

L-TCCHR8. Billing address same as Shipping address
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart Login User

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    Select Billing Address Same As Shipping Address

    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation
    
L-TCCHR9.Add Billing address
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart Login User

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    UnSelect Billing Address Same As Shipping Address
    Adding New a Billing Address

    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

L-TCCHR10.Use different billing address
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart Login User

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    
    UnSelect Billing Address Same As Shipping Address
    Selecting or Adding New a Billing Address

    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation   

L-TCCHR14.Home Delivery checkout without selected payment method
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName} =    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue} =    Get Product Name From Minicart
    &{Arguments} =    Create Dictionary    productName=@{productName}    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Scroll Down To Element    ${ButtonToCheckout}
    Click Element    ${ButtonToCheckout}
    Wait Until Element Is Visible With Long Time    ${SCVHomeDeliveryButton}
    Click Element    ${SCVHomeDeliveryButton}
    Element Should Be Disabled    ${SCVPayButton}

L-TCCHR15.Checkout with Midtrans BRI Virtual Account (VA) Payment Method for Registered
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Scroll Down To Element    ${ButtonToCheckout}
    Click Element    ${ButtonToCheckout}
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}
    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownBRIVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

L-TCCHR16.Checkout with Midtrans Permata Virtual Account (VA) Payment Method for Registered
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=2
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart Login User

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    Select Shipping Method
    Select Payment Method    ${DropdownPermataVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

L-TCCHR19.Apply valid coupon code
    [Tags]    checkout
    Log    "Tester Perlu Membuat Promotion Dengan Code yang disimpan pada variable --PromoCode--"
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart Login User

    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}

    Select Shipping Method
    Add User Email If Emty    ${EmailAddressRegistered}
    Select Payment Method    ${DropdownVAMidtransMethodItem}

    Wait Until Element Is Visible With Long Time    ${ButtonAddPromo}
    Click Element    ${ButtonAddPromo}    
    Input Promo Code    ${PromoCode}
    Select Button Apply Promo

    Validate Message Success Alert Is Visible On Checkout Page


    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation

L-TCCHR20.Apply invalid coupon code - Logged In
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Go To Checkout Page From Shopping Cart Login User
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Select Promotion
    ${InvalidPromotionCode}    Generate Random Keyword
    Input Promo Code    ${InvalidPromotionCode}
    Select Button Apply Promo
    Invalid Promo Code Validation

L-TCCHR28.Successful Checkout Test with Configurable product using registered account
    [Tags]    checkout
    Login User
    Empty the items in MiniCart
    Search Product by Keyword in Searchbox    ${ProductConfigSKUForSearch}
    Validate Search Product And Go To PDP    ${ProductConfigNameForSearch}
    @{productName}    Add To Cart    Qty=1
    Alert Success Validation
    Open Minicart
    @{MinicartProductNameValue}    Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{MinicartProductNameValue}
    Validate The Similarity Of Item Added To Cart    &{Arguments}
    Go To Shopping Cart
    Scroll Down To Element    ${ButtonToCheckout}
    Click Element    ${ButtonToCheckout}
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Add User Email If Emty    CheckoutEmail=${EmailAddressRegistered}
    # Melakukan Add Adrees jika user belum pernah menambahkan alamat
    ${ShippingRecipient}    Generate Random Keyword
    ${ShippingOtherLabel}    Generate Random Keyword
    Add User Address If Emty
    ...    ${ShippingOtherLabel}
    ...    ${ShippingRecipient}
    ...    ${PhoneNumber}
    ...    ${ShipmentAddressDetail}
    ...    ${ShippingCity}
    ...    ${ShipmentPostalCode}
    ...    ${ShipmentPinLocation}
    Wait Until Element Is Visible With Long Time    ${CheckoutPageCountdown}
    Select Shipping Method
    Select Payment Method    ${DropdownVAMidtransMethodItem}
    Submit Place Order
    Midtrans Virtual Account Transaction
    Thankyou page Validation