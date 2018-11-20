Feature: Feature File for InApp

  @Inapp
  Scenario: Configure InApp Client
    Given I Modify MerchantId for "inapp"
      | field       | value |
      | $MerchantId | 30MER |
    And I modify Key value for "inapp"
  
  Scenario: Navigate to inapp
    Given I am at "Inapp" Login page to "ipay inapp"
    Then I verify "Registration form Template | PrepBootstrap" title in "ipay inapp"

  Scenario: Add To Wallet
    And I click on "Add To Wallet" button in "ipay inapp"
      | Element | option |
      | butz1   | id     |
    And I "fill" data criteria of "Add To Wallet"
      | Element     | value          | option   | ElementType |
      | fName       | INAPPUSEAX     | Id       | Textbox     |
      | mName       | middle         | Id       | Textbox     |
      | lName       | lastname       | Id       | Textbox     |
      | emailz      | test@gmail.com | Id       | Textbox     |
      | mobile      |     0771285187 | Id       | Textbox     |
      | nic         | 872283501v     | Id       | Textbox     |
      | addrs1      | colombo        | Id       | Textbox     |
      | addrs2      | colombo        | Id       | Textbox     |
      | addrs3      | colombo        | Id       | Textbox     |
      | addrs4      | colombo        | Id       | Textbox     |
      | sel_Country | NP             | Id,value | Dropdown    |
    And I click on "Register" button in "Add To Wallet"
      | Element   | option |
      | addwallet | id     |
    Then I verify "success" message for "Add To Wallet"
      | Element                |
      | //*[@id='alertz']/h4/b |
    And I got "wallet id"
      | Element                                   |
      | //*[@id='phpVal']/table/tbody/tr[4]/td[3] |
  #Then I verify DB values to Add To Wallet
  
  Scenario: Close Add To Wallet
    And I click on "close" button in "Add To Wallet"
      | Element                                     | Option |
      | //*[@id='largeModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: List Wallet
    And I click on "List Wallet" button in "ipay inapp"
      | Element | option |
      | butz5   | id     |
    And I fill "wallet ID" in "List Wallet"
      | Element   | Value    |
      | walletId4 | walletId |
    And I click on "show" button in "List Wallet"
      | Element    | option |
      | listWallet | id     |
    Then I verify "success" message for "List Wallet"
      | Element                            |
      | //*[@id='alertzOklistWallet']/h4/b |
    Then I verify fields value in "List Wallet"
      | Element                                              | Value          |
      | //*[@id='phpVallistWallet']/table/tbody/tr[1]/td[3]  | INAPPUSEAX     |
      | //*[@id='phpVallistWallet']/table/tbody/tr[2]/td[3]  | middle         |
      | //*[@id='phpVallistWallet']/table/tbody/tr[3]/td[3]  | lastname       |
      | //*[@id='phpVallistWallet']/table/tbody/tr[4]/td[3]  | test@gmail.com |
      | //*[@id='phpVallistWallet']/table/tbody/tr[5]/td[3]  |     0771285187 |
      | //*[@id='phpVallistWallet']/table/tbody/tr[6]/td[3]  | 872283501v     |
      | //*[@id='phpVallistWallet']/table/tbody/tr[7]/td[3]  | colombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[8]/td[3]  | colombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[9]/td[3]  | colombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[10]/td[3] | colombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[11]/td[3] | NP             |

  Scenario: Close List Wallet
    And I click on "close" button in "List Wallet"
      | Element                                         | Option |
      | //*[@id='listWaletModal']/div/div/div[1]/button | xpath  |

  Scenario: Edit Wallet
    And I click on "Edit Wallet" button in "ipay inapp"
      | Element | option |
      | butz6   | id     |
    And I fill "wallet ID" in "Edit Wallet"
      | Element   | Value    |
      | walletId7 | walletId |
    And I "fill" data criteria of "Edit Wallet"
      | Element      | value           | option   | ElementType |
      | fName2       | EINAPPUSEAX     | Id       | Textbox     |
      | mName2       | emiddle         | Id       | Textbox     |
      | lName2       | elastname       | Id       | Textbox     |
      | emailz2      | etest@gmail.com | Id       | Textbox     |
      | mobile2      |      0771285187 | Id       | Textbox     |
      | nic2         | 872283501v      | Id       | Textbox     |
      | addrs21      | ecolombo        | Id       | Textbox     |
      | addrs22      | ecolombo        | Id       | Textbox     |
      | addrs23      | ecolombo        | Id       | Textbox     |
      | addrs24      | ecolombo        | Id       | Textbox     |
      | sel_Country2 | NP              | Id,value | Dropdown    |
    And I click on "update" button in "Edit Wallet"
      | Element    | option |
      | editWallet | id     |
    Then I verify "success" message for "Edit Wallet"
      | Element                          |
      | //*[@id='alertzEditWallet']/h4/b |
  #Then I call verify method
  #| Alias | SQL                                                                                                                                                                                                                                                                                                         | Expected Row Count |
  #| USR   | SELECT count(*) FROM USR_DM_RETL_USR WHERE FIRST_NAME='EINAPPUSEAX' AND MIDDLE_NAME='emiddle' AND LAST_NAME='elastname' AND EMAIL_ADDRESS='etest@gmail.com' AND MOBILE_PHONE='0771285187' AND NIC_NO='872283501v' AND STREET_1='ecolombo' AND STREET_2='ecolombo' AND CITY_1='ecolombo' AND STATE='ecolombo' |                  1 |
  
  Scenario: Close Edit Wallet
    And I click on "close" button in "Edit Wallet"
      | Element                                         | Option |
      | //*[@id='editWaletModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: List Wallet after the edit
    And I click on "List Wallet" button in "ipay inapp"
      | Element | option |
      | butz5   | id     |
    And I fill "wallet ID" in "List Wallet"
      | Element   | Value    |
      | walletId4 | walletId |
    And I click on "show" button in "List Wallet"
      | Element    | option |
      | listWallet | id     |
    Then I verify "success" message for "List Wallet"
      | Element                            |
      | //*[@id='alertzOklistWallet']/h4/b |
    Then I verify fields value in "List Wallet"
      | Element                                              | Value           |
      | //*[@id='phpVallistWallet']/table/tbody/tr[1]/td[3]  | EINAPPUSEAX     |
      | //*[@id='phpVallistWallet']/table/tbody/tr[2]/td[3]  | emiddle         |
      | //*[@id='phpVallistWallet']/table/tbody/tr[3]/td[3]  | elastname       |
      | //*[@id='phpVallistWallet']/table/tbody/tr[4]/td[3]  | etest@gmail.com |
      | //*[@id='phpVallistWallet']/table/tbody/tr[5]/td[3]  |      0771285187 |
      | //*[@id='phpVallistWallet']/table/tbody/tr[6]/td[3]  | 872283501v      |
      | //*[@id='phpVallistWallet']/table/tbody/tr[7]/td[3]  | ecolombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[8]/td[3]  | ecolombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[9]/td[3]  | ecolombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[10]/td[3] | ecolombo        |
      | //*[@id='phpVallistWallet']/table/tbody/tr[11]/td[3] | NP              |

  Scenario: Close List Wallet
    And I click on "close" button in "List Wallet"
      | Element                                         | Option |
      | //*[@id='listWaletModal']/div/div/div[1]/button | xpath  |

  Scenario: Add Card To Wallet
    And I click on "Add Card To Wallet" button in "ipay inapp"
      | Element                                       | option |
      | //body/div[1]/div[2]/div/div[1]/div[6]/button | xpath  |
    And I fill "wallet ID" in "Add Card To Wallet"
      | Element  | Value    |
      | walletId | walletId |
    And I "fill" data criteria of "Add Card To Wallet"
      | Element        | value            | option | ElementType |
      | cardNum        | 4157390000019872 | Id     | Textbox     |
      | cardHolderName | ipg              | Id     | Textbox     |
      | cardType       | VISA             | Id     | Textbox     |
      | cvvNum         |              123 | Id     | Textbox     |
    And I select "Expiry Year" in "Add Card To Wallet"
      | Element | Option |
      | yearz   | id     |
    And I click on "add" button in "Add Card To Wallet"
      | Element | option |
      | addCard | id     |
    Then I verify "success" message for "Add Card To Wallet"
      | Element                       |
      | //*[@id='alertzaddCard']/h4/b |
    And I got "card Reference ID"
      | Element                                          |
      | //*[@id='phpValaddCard']/table/tbody/tr[4]/td[3] |

  Scenario: Close Add Card To Wallet
    And I click on "close" button in "Add Card To Wallet"
      | Element                                       | Option |
      | //*[@id='addCardModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: List Card
    And I click on "List Card" button in "ipay inapp"
      | Element                                       | option |
      | //body/div[1]/div[2]/div/div[1]/div[7]/button | xpath  |
    And I fill "wallet ID" in "List Card"
      | Element   | Value    |
      | walletId5 | walletId |
    And I click on "show" button in "List Card"
      | Element  | option |
      | listCard | id     |
    Then I verify "success" message for "List Card"
      | Element                          |
      | //*[@id='alertzOklistCard']/h4/b |
    Then I verify "Wallet ID" in "List Card"
      | Element                                           | option |
      | //*[@id='phpVallistCard']/table/tbody/tr[1]/td[3] | xpath  |

  Scenario: Close List Card
    And I click on "close" button in "List Card"
      | Element                                        | Option |
      | //*[@id='listCardModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  #Scenario: Edit Card
  #Given I click on "Edit Card" button in "ipay inapp"
  #| Element                                       | option |
  #| //body/div[1]/div[2]/div/div[1]/div[8]/button | xpath  |
  #And I fill "wallet ID" in "Edit Card"
  #| Element   | Value    |
  #| walletId6 | walletId |
  #And I "fill" data criteria of "Edit Card"
  #| Element         | value            | option | ElementType |
  #| cardRef3        | 5362050100002357 | Id     | Textbox     |
  #| cardHolderName2 | ipg              | Id     | Textbox     |
  #And I click on "update" button in "Edit Card"
  #| Element  | option |
  #| editCard | id     |
  #
  #Scenario: Close Edit Card
  #And I click on "close" button in "Edit Card"
  #| Element                                        | Option |
  #| //*[@id='editCardModal']/div/div/div[1]/button | xpath  |
  #And I refresh page
  
  Scenario: Active Card
    Given I click on "Active Card" button in "ipay inapp"
      | Element | option |
      | butz8   | id     |
    And I fill "wallet ID" in "Active Card"
      | Element        | Value    |
      | walletIdActCrd | walletId |
    And I fill "card Reference ID" in "Active Card"
      | Element       | Value     |
      | cardRefActCrd | cardRefID |
    And I got "Activation Code" from db
    And I fill "Activation Code" in "Active Card"
      | Element        | Value          |
      | activationCode | activationCode |
    And I click on "Active" button in "Active Card"
      | Element      | option |
      | activateCard | id     |
    Then I verify "success" message for "Active Card"
      | Element                            |
      | //*[@id='alertzactivateCard']/h4/b |

  Scenario: Close Active Card
    And I click on "close" button in "Active Card"
      | Element                                            | Option |
      | //*[@id='activateCardModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: Sale Wallet Transaction
    Given I click on "Sale Wallet Transaction" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[11]/button | xpath  |
    And I fill "wallet ID" in "Sale Wallet Transaction"
      | Element   | Value    |
      | walletId2 | walletId |
    And I fill "inapp merchant ID" in "Sale Wallet Transaction"
      | Element     | Value      |
      | merchantId2 | INAPPMERCH |
    And I fill "card Reference ID" in "Sale Wallet Transaction"
      | Element | Value     |
      | cardRef | cardRefID |
    And I "fill" data criteria of "Sale Wallet Transaction"
      | Element | value  | option | ElementType |
      | txtAmt  | 100.00 | id     | Textbox     |
    And I click on "Pay Now" button in "Sale Wallet Transaction"
      | Element    | option |
      | saleWallet | id     |
    Then I verify "success" message for "Sale Wallet Transaction"
      | Element                          |
      | //*[@id='alertzSaleWallet']/h4/b |
    And I got "Transaction Ref ID"
      | Element                                             |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[1]/td[3] |
    And I save all display values in "Sale Wallet Transaction"
      | Element                                              |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[1]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[2]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[3]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[4]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[5]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[6]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[7]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[8]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[9]/td[3]  |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[10]/td[3] |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[11]/td[3] |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[12]/td[3] |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[15]/td[3] |

  Scenario: Close Sale Wallet Transaction
    And I click on "close" button in "Sale Wallet Transaction"
      | Element                                          | Option |
      | //*[@id='saleWalletModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: Transaction Status Inquiry
    Given I click on "Transaction Status Inquiry" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[12]/button | xpath  |
    And I fill "wallet ID" in "Transaction Status Inquiry"
      | Element    | value    |
      | walletId10 | walletId |
    And I fill "inapp merchant ID" in "Transaction Status Inquiry"
      | Element     | Value      |
      | merchantId3 | INAPPMERCH |
    And I fill "merchant Reference ID" in "Transaction Status Inquiry"
      | Element | Value    |
      | merRef  | merRefID |
    And I click on "Pay Now" button in "Transaction Status Inquiry"
      | Element       | option |
      | inquireStatus | id     |
    Then I verify "success" message for "Transaction Status Inquiry"
      | Element                                |
      | //*[@id='alertztxnStatusInquiry']/h4/b |
    Then I verify all fields in "Transaction Status Inquiry"
      | Element                                                 |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[1]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[2]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[3]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[4]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[5]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[6]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[7]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[8]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[9]/td[3]  |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[10]/td[3] |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[11]/td[3] |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[12]/td[3] |
      | //*[@id='phpValInquireStatus']/table/tbody/tr[15]/td[3] |

  Scenario: Close Transaction Status Inquiry
    And I click on "close" button in "Transaction Status Inquiry"
      | Element                                                | Option |
      | //*[@id='txnStatusInquiryModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: PreAuth Wallet Transaction
    Given I click on "PreAuth Wallet Transaction" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[13]/button | xpath  |
    And I fill "wallet ID" in "PreAuth Wallet Transaction"
      | Element   | Value    |
      | walletId8 | walletId |
    And I fill "inapp merchant ID" in "PreAuth Wallet Transaction"
      | Element     | Value      |
      | merchantId8 | INAPPMERCH |
    And I fill "card Reference ID" in "Sale Wallet Transaction"
      | Element  | Value     |
      | cardRef8 | cardRefID |
    And I "fill" data criteria of "PreAuth Wallet Transaction"
      | Element | value  | option | ElementType |
      | txtAmt5 | 100.00 | id     | Textbox     |
    And I click on "Submit" button in "PreAuth Wallet Transaction"
      | Element | option |
      | preauth | id     |
    Then I verify "Transaction Success" message for "PreAuth Wallet Transaction"
      | Element                       |
      | //*[@id='alertzPreauth']/h4/b |
    And I got "Transaction Ref ID"
      | Element                                             |
      | //*[@id='phpValPreauth']/table/tbody/tr[1]/td[3]    |
    And I got "Transaction ID"
      | Element                                             |
      | //*[@id='phpValPreauth']/table/tbody/tr[10]/td[3]   |

  Scenario: Close PreAuth Wallet Transaction
    And I click on "close" button in "PreAuth Wallet Transaction"
      | Element                                       | Option |
      | //*[@id='preAuthModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: Sale Completion
    Given I click on "Sale Completion" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[14]/button | xpath  |
    And I fill "wallet ID" in "Sale Completion"
      | Element   | value    |
      | walletId9 | walletId |
    And I fill "inapp merchant ID" in "Sale Completion"
      | Element     | Value      |
      | merchantId6 | INAPPMERCH |
    And I fill "merchant Reference ID" in "Sale Completion"
      | Element | Value    |
      | merRef6 | merRefID |
    And I fill "transaction ID" in "Sale Completion"
      | Element  | Value         |
      | ipgTxnId | transactionID |
    And I "fill" data criteria of "Sale Completion"
      | Element | value  | option | ElementType |
      | txtAmt6 | 100.00 | id     | Textbox     |
    And I click on "Submit" button in "Sale Completion"
      | Element   | option |
      | salecompt | id     |
    Then I verify "success" message for "Sale Completion"
      | Element                         |
      | //*[@id='alertzsalecompt']/h4/b |

  Scenario: Close Sale Completion
    And I click on "close" button in "Sale Completion"
      | Element                                         | Option |
      | //*[@id='salecomptModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: Sale Transaction Reversal
    Given I click on "Sale Transaction Reversal" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[15]/button | xpath  |
    And I fill "wallet ID" in "Sale Transaction Reversal"
      | Element          | value    |
      | walletIdReversal | walletId |
    And I fill "inapp merchant ID" in "Sale Wallet Transaction"
      | Element            | Value      |
      | merchantIdReversal | INAPPMERCH |
    And I fill "merchant Reference ID" in "Sale Transaction Reversal"
      | Element       | Value    |
      | txnidReversal | merRefID |
    And I "fill" data criteria of "Sale Transaction Reversal"
      | Element        | value  | option | ElementType |
      | txtAmtReversal | 100.00 | id     | Textbox     |
    And I click on "Submit" button in "Sale Transaction Reversal"
      | Element         | option |
      | saleTxnReversal | id     |
    Then I verify "Transaction Reversal Success" message for "Sale Transaction Reversal"
      | Element                        |
      | //*[@id='alertzReversal']/h4/b |

  Scenario: Close Sale Transaction Reversal
    And I click on "close" button in "Sale Transaction Reversal"
      | Element                                      | Option |
      | //*[@id='txtReversal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: Sale Wallet Transaction for Sale Transaction Timeout Reversal
    Given I click on "Sale Wallet Transaction" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[11]/button | xpath  |
    And I fill "wallet ID" in "Sale Wallet Transaction"
      | Element   | Value    |
      | walletId2 | walletId |
    And I fill "inapp merchant ID" in "Sale Wallet Transaction"
      | Element     | Value      |
      | merchantId2 | INAPPMERCH |
    And I fill "card Reference ID" in "Sale Wallet Transaction"
      | Element | Value     |
      | cardRef | cardRefID |
    And I "fill" data criteria of "Sale Wallet Transaction"
      | Element | value  | option | ElementType |
      | txtAmt  | 100.00 | id     | Textbox     |
    And I click on "Pay Now" button in "Sale Wallet Transaction"
      | Element    | option |
      | saleWallet | id     |
    Then I verify "success" message for "Sale Wallet Transaction"
      | Element                          |
      | //*[@id='alertzSaleWallet']/h4/b |
    And I got "	Transaction Ref ID"
      | Element                                             |
      | //*[@id='phpValSaleWallet']/table/tbody/tr[1]/td[3] |

  Scenario: Close Sale Wallet Transaction
    And I click on "close" button in "Sale Wallet Transaction"
      | Element                                          | Option |
      | //*[@id='saleWalletModal']/div/div/div[1]/button | xpath  |
    And I refresh page

  Scenario: Sale Transaction Timeout Reversal
    Given I click on "Sale Transaction Timeout Reversal" button in "ipay inapp"
      | Element                                        | option |
      | //body/div[1]/div[2]/div/div[1]/div[16]/button | xpath  |
    And I fill "wallet ID" in "Sale Transaction Timeout Reversal"
      | Element                 | value    |
      | walletIdTimeoutReversal | walletId |
    And I fill "inapp merchant ID" in "Sale Transaction Timeout Reversal"
      | Element     | Value      |
      | merchantId4 | INAPPMERCH |
    And I fill "merchant Reference ID" in "Sale Transaction Timeout Reversal"
      | Element        | Value    |
      | merRefReversal | merRefID |
    And I "fill" data criteria of "Sale Transaction Timeout Reversal"
      | Element               | value  | option | ElementType |
      | txtAmtTimeoutReversal | 100.00 | id     | Textbox     |
    And I click on "Submit" button in "Sale Transaction Timeout Reversal"
      | Element                | option |
      | saleTxnTimeoutReversal | id     |
    Then I verify "Transaction Timeout Reversal Success" message for "Sale Transaction Timeout Reversal"
      | Element                               |
      | //*[@id='alertzTimeoutReversal']/h4/b |

  Scenario: Close Sale Transaction Reversal
    And I click on "close" button in "Sale Transaction Timeout Reversal"
      | Element                                             | Option |
      | //*[@id='txtTimeoutReversal']/div/div/div[1]/button | xpath  |

  Scenario: Delete Card
    Given I click on "Delete Card" button in "ipay inapp"
      | Element | option |
      | butz4   | id     |
    And I fill "wallet ID" in "Delete Card"
      | Element   | Value    |
      | walletId3 | walletId |
    And I fill "card Reference ID" in "Active Card"
      | Element  | Value     |
      | cardRef2 | cardRefID |
    And I click on "Delete" button in "Delete Card"
      | Element    | option |
      | deleteCard | id     |
    Then I verify "success" message for "Delete Card"
      | Element                         |
      | //*[@id='alertzdeletCard']/h4/b |

  Scenario: Close Delete Card
    And I click on "close" button in "Delete Card"
      | Element                                          | Option |
      | //*[@id='deleteCardModal']/div/div/div[1]/button | xpath  |
    And I refresh page