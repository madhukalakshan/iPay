Feature: Feature File for iPay Merchant Onboarding Management

  @MerOnboardMana
  Scenario: Navigate to Transaction Management
    Given I am at "IAdmin" Login page to "Merchant Onboarding Management"
    Given I am at "IAdmin" Login page to "iAdmin Login"
    And I "fill" data criteria of "Login to Merchant Onboarding Management"
      | Element     | value   | option | ElementType |
      | user_id     | madhuka | Name   | Textbox     |
      | user_suffix |   00000 | Name   | Textbox     |
      | user_bank   |    0001 | Name   | Textbox     |
    And I click on "Login" button in "Login to Merchant Onboarding Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I "fill" data criteria of "Login to Merchant Onboarding Management"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "Login to Merchant Onboarding Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    Then I should see the "Application Menu" Application Page
    And I Click the "iPay" icon to "Merchant Onboarding Management"
    Then I should see "iPay" Home Page
    And I Click the "Merchant Related" icon to "Merchant Onboarding Management"
    Then I should see the "Merchant Related" page to "Merchant Onboarding Management"
    And I Click the "Merchant Onboarding Management" icon
    Then I should see the "Merchant Onboarding Management" page

  Scenario: Add Online Merchant Request
    Given I Click the "Add Online Merchant Request" icon
    Then I should see the "Add Online Merchant Request" page
    And I "fill" data criteria of "Add Online Merchant Request"
      | Element      | value            | option | ElementType |
      | merchantName | NIBLONBOARDMERAS | Name   | Textbox     |
    And I click on "submit" button in "Add Online Merchant Request"
      | Element | option |
      | submit  | Name   |
    And I click on Merchant Ref Number
    Then I should see the "Add Online Merchant Request" page
    And I "fill" data criteria of "Add Online Merchant Request"
      | Element                              | value               | option     | ElementType |
      | business_type_id                     | 26myBusinessTest    | Name,Value | Dropdown    |
      | url                                  | http://www.test.com | Name       | Textbox     |
      | success_static_return_link           | http://www.test.com | Name       | Textbox     |
      | fail_static_return_link              | http://www.test.com | Name       | Textbox     |
      | MonthySaleVal                        |            10007.00 | Name       | Textbox     |
      | do_credit_pre_auth                   | Y                   | Name,value | Dropdown    |
      | custom_payment_screens               | N                   | Name,value | Dropdown    |
      | auto_settle_txn                      | N                   | Name,value | Dropdown    |
      | Allow_sale_transaction_without_pages | N                   | Name,value | Dropdown    |
      | Allow_mobile_transactions            | N                   | Name,value | Dropdown    |
      | capture_billing_address              | N                   | Name,value | Dropdown    |
      | show_captcha                         | N                   | Name,value | Dropdown    |
      | inapp_payment                        | Y                   | Name,value | Dropdown    |
      | recurr_payment                       | N                   | Name,value | Dropdown    |
      | txn_ref_num_uniqueness_period        | 24_HOURS            | Name,value | Dropdown    |
      | merchant_multi_purpose_1             | MERCHNAMETWO        | Name       | Textbox     |
      | address1                             | LINE 1              | Name       | Textbox     |
      | address2                             | LINE 2              | Name       | Textbox     |
      | address3                             | Line 3              | Name       | Textbox     |
      | address4                             | Line 4              | Name       | Textbox     |
      | account_manager                      | Account             | Name       | Textbox     |
      | field1                               | fieldone            | Name       | Textbox     |
      | field2                               | fieldtwo            | Name       | Textbox     |
      | field3                               | fieldthree          | Name       | Textbox     |
      | field4                               | fieldfour           | Name       | Textbox     |
      | bank_code                            |                0001 | Name,value | Dropdown    |
      | bin_length                           |                   6 | Name       | Textbox     |
      | bin                                  |              536205 | Name       | Textbox     |
      | iss_country_code                     | NP                  | Name,value | Dropdown    |
      | card_no_length                       |                  16 | Name       | Textbox     |
      | include_exclude                      | Y                   | Name,value | Dropdown    |
      | currency_code                        | NPR                 | Name,value | Dropdown    |
      | settleCurrency_code                  | NPR                 | Name,value | Dropdown    |
      | global_limit_category                | 26gts               | Name,value | Dropdown    |
      | merchant_account_number              |          1111111111 | Name       | Textbox     |
      | per_sale_txn_limit_alwd              |                   0 | Nam,index  | Dropdown    |
      | daily_sale_txn_limit_alwd            |                   0 | Nam,index  | Dropdown    |
      | monthly_sale_txn_limit_alwd          |                   0 | Nam,index  | Dropdown    |
      | debit_void_alwd                      |                   0 | Nam,index  | Dropdown    |
      | credit_card_void_alwd                |                   0 | Nam,index  | Dropdown    |
      | debit_refund_alwd                    |                   0 | Nam,index  | Dropdown    |
      | credit_card_refund_alwd              |                   0 | Nam,index  | Dropdown    |
      | daily_refund_txn_limit_alwd          |                   0 | Nam,index  | Dropdown    |
      | monthly_refund_txn_limit_alwd        |                   0 | Nam,index  | Dropdown    |
      | off_us_credit_card_alwd              |                   0 | Nam,index  | Dropdown    |
      | plain_text_txn_req_alwd              |                   0 | Nam,index  | Dropdown    |
      | void_allowed_period_alwd             |                   0 | Nam,index  | Dropdown    |
      | refund_allowed_period_alwd           |                   0 | Nam,index  | Dropdown    |
      | clearance_allowed_period_alwd        |                   0 | Nam,index  | Dropdown    |
      | fixed_service_fee_period             | NONE                | Name,value | Dropdown    |
      | fixed_service_fee_amount             |               10.00 | Name       | Textbox     |
      | fixed_service_fee_currency           | NPR                 | Name,value | Dropdown    |
      | fixed_service_fee_account            |               10.00 | Name       | Textbox     |
      | language_code                        | eng                 | Name,value | Dropdown    |
      | tittle                               | Mr.                 | Name,value | Dropdown    |
      | contact_firstname                    | COREONBODMERAS      | Name       | Textbox     |
      | lname                                | lastname            | Name       | Textbox     |
      | contact_mobile_phone_no              |           111111111 | Name       | Textbox     |
      | office_phone_no                      |           111111111 | Name       | Textbox     |
      | homePhone                            |           111111111 | Name       | Textbox     |
      | fax_no                               |           111111111 | Name       | Textbox     |
      | email_address                        | 44test@gmail.com    | Name       | Textbox     |
      | account_email                        | 44test@gmail.com    | Name       | Textbox     |
      | account_phone                        | 44test@gmail.com    | Name       | Textbox     |
    And I click on "Add" button in "Add Online Merchant Request"
      | Element               | option |
      | //input[@value='Add'] | Xpath  |
    Then I Check for Success Message "Merchant Online Request successfully added" in "Add Online Merchant Request"
    Then I call verify method
      | Alias | SQL                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE='1'                                                  |                  1 |
      | IPG   | SELECT count(*) FROM IPG_MERCH_ONLINE_REQ WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='6' AND MERCHANT_NAME='NIBLONBOARDMERAS'      |                  1 |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCH_ONLINE_FOR_AUTH WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='5' AND MERCHANT_NAME='NIBLONBOARDMERAS' |                  1 |

  Scenario: Back to Merchant Onboarding Management
    And I click on "Merchant Onboarding Management" icon to back
    Then I should see the "Merchant Onboarding Management" page

  Scenario: Edit Online Merchant
    Given I Click the "Edit Online Merchant" icon
    Then I should see the "Edit Online Merchant" page
    And I "fill" data criteria of "Edit Online Merchant"
      | Element      | value            | option | ElementType |
      | merchantName | NIBLONBOARDMERAS | Name   | Textbox     |
    And I click on "submit" button in "Edit Online Merchant"
      | Element | option |
      | submit  | Name   |
    And I click on Merchant Ref Number
    Then I should see the "Edit Online Merchant" page
    And I "modify" data criteria of "Edit Online Merchant"
      | Element                              | value               | option     | ElementType |
      | business_type_id                     | 26myBusinessTest    | Name,Value | Dropdown    |
      | url                                  | http://www.test.com | Name       | Textbox     |
      | success_static_return_link           | http://www.test.com | Name       | Textbox     |
      | fail_static_return_link              | http://www.test.com | Name       | Textbox     |
      | MonthySaleVal                        |            10007.00 | Name       | Textbox     |
      | do_credit_pre_auth                   | Y                   | Name,value | Dropdown    |
      | custom_payment_screens               | N                   | Name,value | Dropdown    |
      | auto_settle_txn                      | N                   | Name,value | Dropdown    |
      | Allow_sale_transaction_without_pages | N                   | Name,value | Dropdown    |
      | Allow_mobile_transactions            | N                   | Name,value | Dropdown    |
      | capture_billing_address              | N                   | Name,value | Dropdown    |
      | show_captcha                         | N                   | Name,value | Dropdown    |
      | inapp_payment                        | N                   | Name,value | Dropdown    |
      | recurr_payment                       | N                   | Name,value | Dropdown    |
      | txn_ref_num_uniqueness_period        | 24_HOURS            | Name,value | Dropdown    |
      | merchant_multi_purpose_1             | MERCHNAMETWO        | Name       | Textbox     |
      | address1                             | LINE 1              | Name       | Textbox     |
      | address2                             | LINE 2              | Name       | Textbox     |
      | address3                             | Line 3              | Name       | Textbox     |
      | address4                             | Line 4              | Name       | Textbox     |
      | account_manager                      | Account             | Name       | Textbox     |
      | field1                               | fieldone            | Name       | Textbox     |
      | field2                               | fieldtwo            | Name       | Textbox     |
      | field3                               | fieldthree          | Name       | Textbox     |
      | field4                               | fieldfour           | Name       | Textbox     |
      | bank_code                            |                0001 | Name       | Textbox     |
      | bin_length                           |                   6 | Name       | Textbox     |
      | bin                                  |              536205 | Name       | Textbox     |
      | iss_country_code                     | NP                  | Name,value | Dropdown    |
      | card_no_length                       |                  16 | Name       | Textbox     |
      | include_exclude                      | Y                   | Name,value | Dropdown    |
      | currency_code                        | NPR                 | Name,value | Dropdown    |
      | settleCurrency_code                  | NPR                 | Name,value | Dropdown    |
      | global_limit_category                | 26gts               | Name,value | Dropdown    |
      | merchant_account_number              |          1111111111 | Name       | Textbox     |
      | per_sale_txn_limit_alwd              |                   0 | Nam,index  | Dropdown    |
      | daily_sale_txn_limit_alwd            |                   0 | Nam,index  | Dropdown    |
      | monthly_sale_txn_limit_alwd          |                   0 | Nam,index  | Dropdown    |
      | debit_void_alwd                      |                   0 | Nam,index  | Dropdown    |
      | credit_card_void_alwd                |                   0 | Nam,index  | Dropdown    |
      | debit_refund_alwd                    |                   0 | Nam,index  | Dropdown    |
      | credit_card_refund_alwd              |                   0 | Nam,index  | Dropdown    |
      | daily_refund_txn_limit_alwd          |                   0 | Nam,index  | Dropdown    |
      | monthly_refund_txn_limit_alwd        |                   0 | Nam,index  | Dropdown    |
      | off_us_credit_card_alwd              |                   0 | Nam,index  | Dropdown    |
      | plain_text_txn_req_alwd              |                   0 | Nam,index  | Dropdown    |
      | void_allowed_period_alwd             |                   0 | Nam,index  | Dropdown    |
      | refund_allowed_period_alwd           |                   0 | Nam,index  | Dropdown    |
      | clearance_allowed_period_alwd        |                   0 | Nam,index  | Dropdown    |
      | fixed_service_fee_period             | NONE                | Name,value | Dropdown    |
      | fixed_service_fee_amount             |               10.00 | Name       | Textbox     |
      | fixed_service_fee_currency           | NPR                 | Name,value | Dropdown    |
      | fixed_service_fee_account            |               10.00 | Name       | Textbox     |
      | language_code                        | eng                 | Name,value | Dropdown    |
      | tittle                               | Mr.                 | Name,value | Dropdown    |
      | contact_firstname                    | COREONBODMERAS      | Name       | Textbox     |
      | lname                                | lastname            | Name       | Textbox     |
      | contact_mobile_phone_no              |           111111111 | Name       | Textbox     |
      | office_phone_no                      |           111111111 | Name       | Textbox     |
      | homePhone                            |           111111111 | Name       | Textbox     |
      | fax_no                               |           111111111 | Name       | Textbox     |
      | email_address                        | 44test@gmail.com    | Name       | Textbox     |
      | account_email                        | 44test@gmail.com    | Name       | Textbox     |
      | account_phone                        | 44test@gmail.com    | Name       | Textbox     |
    And I click on "Edit" button in "Edit Online Merchant"
      | Element                | option |
      | //input[@value='Edit'] | xpath  |
    Then I Check for Success Message "Merchant Online Request successfully edited" in "Edit Online Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE='1'                                                  |                  1 |
      | IPG   | SELECT count(*) FROM IPG_MERCH_ONLINE_REQ WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='6' AND MERCHANT_NAME='NIBLONBOARDMERAS'      |                  1 |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCH_ONLINE_FOR_AUTH WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='5' AND MERCHANT_NAME='NIBLONBOARDMERAS' |                  1 |

  Scenario: Back to Merchant Onboarding Management
    And I click on "Merchant Onboarding Management" icon to back
    Then I should see the "Merchant Onboarding Management" page

  Scenario: Reject Online Merchant
    Given I Click the "Approve Online Merchant" icon
    Then I should see the "Approve Online Merchant" page
    And I "fill" data criteria of "Approve Online Merchant"
      | Element      | value            | option | ElementType |
      | merchantName | NIBLONBOARDMERAS | Name   | Textbox     |
    And I click on "submit" button in "Approve Online Merchant"
      | Element | option |
      | submit  | Name   |
    And I click on Merchant Ref Number
    Then I should see the "Approve Online Merchant" page
    And I click on "Reject" button in "Approve Online Merchant"
      | Element                  | option |
      | //input[@value='Reject'] | xpath  |
    Then I Check for Success Message "Merchant Online Request successfully Rejected" in "Approve Online Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE='1'                                                  |                  1 |
      | IPG   | SELECT count(*) FROM IPG_MERCH_ONLINE_REQ WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='6' AND MERCHANT_NAME='NIBLONBOARDMERAS'      |                  1 |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCH_ONLINE_FOR_AUTH WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='3' AND MERCHANT_NAME='NIBLONBOARDMERAS' |                  1 |

  Scenario: Back to Merchant Onboarding Management
    And I click on "Merchant Onboarding Management" icon to back
    Then I should see the "Merchant Onboarding Management" page

  Scenario: Reapply Online Merchant
    Given I Click the "Reapply Online Merchant" icon
    Then I should see the "Reapply Online Merchant" page
    And I "fill" data criteria of "Reapply Online Merchant"
      | Element      | value            | option | ElementType |
      | merchantName | NIBLONBOARDMERAS | Name   | Textbox     |
    And I click on "submit" button in "Reapply Online Merchant"
      | Element | option |
      | submit  | Name   |
    And I click on Merchant Ref Number
    Then I should see the "Reapply Online Merchant" page
    And I "modify" data criteria of "Reapply Online Merchant"
      | Element                              | value               | option     | ElementType |
      | business_type_id                     | 26myBusinessTest    | Name,Value | Dropdown    |
      | url                                  | http://www.test.com | Name       | Textbox     |
      | success_static_return_link           | http://www.test.com | Name       | Textbox     |
      | fail_static_return_link              | http://www.test.com | Name       | Textbox     |
      | MonthySaleVal                        |            10007.00 | Name       | Textbox     |
      | do_credit_pre_auth                   | Y                   | Name,value | Dropdown    |
      | custom_payment_screens               | N                   | Name,value | Dropdown    |
      | auto_settle_txn                      | N                   | Name,value | Dropdown    |
      | Allow_sale_transaction_without_pages | N                   | Name,value | Dropdown    |
      | Allow_mobile_transactions            | N                   | Name,value | Dropdown    |
      | capture_billing_address              | N                   | Name,value | Dropdown    |
      | show_captcha                         | N                   | Name,value | Dropdown    |
      | inapp_payment                        | N                   | Name,value | Dropdown    |
      | recurr_payment                       | N                   | Name,value | Dropdown    |
      | txn_ref_num_uniqueness_period        | 24_HOURS            | Name,value | Dropdown    |
      | merchant_multi_purpose_1             | MERCHNAMETWO        | Name       | Textbox     |
      | address1                             | LINE 1              | Name       | Textbox     |
      | address2                             | LINE 2              | Name       | Textbox     |
      | address3                             | Line 3              | Name       | Textbox     |
      | address4                             | Line 4              | Name       | Textbox     |
      | account_manager                      | Account             | Name       | Textbox     |
      | field1                               | fieldone            | Name       | Textbox     |
      | field2                               | fieldtwo            | Name       | Textbox     |
      | field3                               | fieldthree          | Name       | Textbox     |
      | field4                               | fieldfour           | Name       | Textbox     |
      | bank_code                            |                0001 | Name       | Textbox     |
      | bank_name                            | nibl                | Name       | Textbox     |
      | bin_length                           |                   6 | Name       | Textbox     |
      | bin                                  |              536205 | Name       | Textbox     |
      | iss_country_code                     | NP                  | Name,value | Dropdown    |
      | card_no_length                       |                  16 | Name       | Textbox     |
      | include_exclude                      | Y                   | Name,value | Dropdown    |
      | currency_code                        | NPR                 | Name,value | Dropdown    |
      | settleCurrency_code                  | NPR                 | Name,value | Dropdown    |
      | global_limit_category                | 26gts               | Name,value | Dropdown    |
      | merchant_account_number              |          1111111111 | Name       | Textbox     |
      | per_sale_txn_limit_alwd              |                   0 | Nam,index  | Dropdown    |
      | daily_sale_txn_limit_alwd            |                   0 | Nam,index  | Dropdown    |
      | monthly_sale_txn_limit_alwd          |                   0 | Nam,index  | Dropdown    |
      | debit_void_alwd                      |                   0 | Nam,index  | Dropdown    |
      | credit_card_void_alwd                |                   0 | Nam,index  | Dropdown    |
      | debit_refund_alwd                    |                   0 | Nam,index  | Dropdown    |
      | credit_card_refund_alwd              |                   0 | Nam,index  | Dropdown    |
      | daily_refund_txn_limit_alwd          |                   0 | Nam,index  | Dropdown    |
      | monthly_refund_txn_limit_alwd        |                   0 | Nam,index  | Dropdown    |
      | off_us_credit_card_alwd              |                   0 | Nam,index  | Dropdown    |
      | plain_text_txn_req_alwd              |                   0 | Nam,index  | Dropdown    |
      | void_allowed_period_alwd             |                   0 | Nam,index  | Dropdown    |
      | refund_allowed_period_alwd           |                   0 | Nam,index  | Dropdown    |
      | clearance_allowed_period_alwd        |                   0 | Nam,index  | Dropdown    |
      | fixed_service_fee_period             | NONE                | Name,value | Dropdown    |
      | fixed_service_fee_amount             |               10.00 | Name       | Textbox     |
      | fixed_service_fee_currency           | NPR                 | Name,value | Dropdown    |
      | fixed_service_fee_account            |               10.00 | Name       | Textbox     |
      | language_code                        | eng                 | Name,value | Dropdown    |
      | tittle                               | Mr.                 | Name,value | Dropdown    |
      | contact_firstname                    | COREONBODMERAS      | Name       | Textbox     |
      | lname                                | lastname            | Name       | Textbox     |
      | contact_mobile_phone_no              |           111111111 | Name       | Textbox     |
      | office_phone_no                      |           111111111 | Name       | Textbox     |
      | homePhone                            |           111111111 | Name       | Textbox     |
      | fax_no                               |           111111111 | Name       | Textbox     |
      | email_address                        | 44test@gmail.com    | Name       | Textbox     |
      | account_email                        | 44test@gmail.com    | Name       | Textbox     |
      | account_phone                        | 44test@gmail.com    | Name       | Textbox     |
    And I click on "Reapply" button in "Reapply Online Merchant"
      | Element                   | option |
      | //input[@value='Reapply'] | xpath  |
    Then I Check for Success Message "Merchant Online Request successfully reapplied" in "Reapply Online Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE='1'                                                  |                  1 |
      | IPG   | SELECT count(*) FROM IPG_MERCH_ONLINE_REQ WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='6' AND MERCHANT_NAME='NIBLONBOARDMERAS'      |                  1 |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCH_ONLINE_FOR_AUTH WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='5' AND MERCHANT_NAME='NIBLONBOARDMERAS' |                  1 |

  Scenario: Back to Merchant Onboarding Management
    And I click on "Merchant Onboarding Management" icon to back
    Then I should see the "Merchant Onboarding Management" page

  Scenario: Approve Online Merchant
    Given I Click the "Approve Online Merchant" icon
    Then I should see the "Approve Online Merchant" page
    And I "fill" data criteria of "Approve Online Merchant"
      | Element      | value            | option | ElementType |
      | merchantName | NIBLONBOARDMERAS | Name   | Textbox     |
    And I click on "submit" button in "Approve Online Merchant"
      | Element | option |
      | submit  | Name   |
    And I click on Merchant Ref Number
    Then I should see the "Approve Online Merchant" page
    And I click on "submit" button in "Approve Online Merchant"
      | Element                   | option |
      | //input[@value='Approve'] | xpath  |
    Then I Check for Success Message "Merchant Online Request successfully Approved" in "Approve Online Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                    | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCH_ONLINE_FOR_AUTH WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='99' AND MERCHANT_NAME='NIBLONBOARDMERAS' |                  1 |
      | IPG   | SELECT count(*) FROM IPG_MERCHANT WHERE MERCHANT_NAME='NIBLONBOARDMERAS' AND STATUS_CODE='1'                                           |                  1 |
      | IPG   | SELECT count(*) FROM IPG_MERCHANT_USER WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='1'                                               |                  1 |

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page

  Scenario: Logout from merchant application
    And I click on "Log Out" button in "Transaction Management"
      | Element | option |
      | logout  | id     |
    And I close the console
