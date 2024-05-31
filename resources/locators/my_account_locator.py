ButtonEditContactInformation    = "//a[@aria-label='Edit contact information']"

#MyAccountMenu
MyWishlistMenu                  = "//div[@id='account-nav']//a[contains(@href,'wishlist')]"
MyAccountEmail                  = "//div[@class='grow']//p[@class='mt-3 mb-[20px]']"
ChangeInfoBtn                   = "//div[@class='grow']//a[@aria-label='Edit contact information']//span[@class='text-primary-700']"
InfoWhatsAppNumber              = "//input[@id='whatsapp_number']"
RegisterWhatsappCheckbox        = "//input[@id='isWhatsapp']"
SaveInfoBtn                     = "//button[@title='Save']"
AccountInformationMenu          = "//main[@id='maincontent']//a[normalize-space()='Account Information']"

#MyOrder
MyOrdersMenu                    = "//li[@class='nav item']//a[normalize-space()='My Orders']"
MyOrderPage                     = "//h2[@id='my-orders-title']"
MyOrderTable                    = "//tr[@class='swift-table-row even:bg-white odd:bg-neutral-50']"

#WishlishPage
WishlishPage                    = "//body[contains(@class,'wishlist-index-index page')]"
WishlistPageProductName     	= "//a[contains(@class,'product-item-link')]"
WishlistItemList                = "//form[@id='wishlist-view-form']"
DeleteWishlistItemButton        = "//div[contains(@class,'product-item-info')]//a[@data-role='remove']"

#MyProductReview
MyProductReviewMenu             = "//div[@id='account-nav']//a[contains(@href,'review')]"
MyProductReviewPage             = "//div[@class='columns']//div[@class='column main']//div[@class='mb-6 text-2xl']"

#StoreCredit&Refund
StoreCreditMenu                 = "//div[@id='account-nav']//a[contains(@href,'aw_store_credit')]"
StoreCreditPage                 = "//div[@class='column main']//div[@class='block store-credit']"

#RewardPoint
RewardPointsMenu                = "//div[@id='account-nav']//a[contains(@href,'aw_rewardpoints')]"
RewardPointsPage                = "//div[@class='column main']//div[@class='block rewardpoints']"

#Newsletter Subscriptions
NewsletterMenu                  = "//div[@id='account-nav']//a[contains(@href,'newsletter')]"
NewsletterCheckBox              = "//input[@id='subscription']"

#GiftCard
GiftCardMenu                            = "//div[@id='account-nav']//a[contains(@href,'awgiftcard')]"
GiftcardCheckStatusandBalanceButton     = "//div[@class='secondary m-1']//button[@data-role='aw-giftcard-check-code-action']"
EnterGiftCardCode                       = "//div[@class='control']//input[@placeholder='Enter Gift Card code']"
InvalidGiftCardAlertMessage             = "//div[@id='aw_giftcard__code_info']//div[@class='message error']"
BalanceGiftcardAmount                   = "//div[@id='aw_giftcard__code_info']//span[@class='price']"
GiftCardCodeInformation                 = "//div[@id='aw_giftcard__code_info']//td[@ha='gc-code']"
GiftCardCodeInformationForm             = "//div[@id='aw_giftcard__code_info_block']"
ExistingGiftCode                        = "//div[@x-data='awGiftCardManagement()']//li//button[@ha='giftcard-code']"

#SignOut
SignOutMenu                             = "//div[@id='account-nav']//a[contains(@href,'logout')]"