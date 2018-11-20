###############################################################################################################################################
# Merchant Management with merchant_id  30MER will be created.
###############################################################################################################################################
Feature: Feature File for Merchant Management

  @iPayMerMgmt
  Scenario: Go to Add Merchant
    Given I Click the "Merchant Related" icon to ipay Merchant Management
    Then I should see the "Merchant Related" page to ipay Merchant Management
    And I Click the "Merchant Management" icon to ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Add Merchant
    Given I Click the "Add Merchant" icon to ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management
    And I fill the Add_Merchant form
      | field                                | value                |
      | merchant_id                          | 30MER                |
      | business_type_id                     | 27myBusinessTest     |
      | url                                  | http://www.gogle.com |
      | date_of_application_d                |                   01 |
      | date_of_application_m                |                   01 |
      | date_of_application_y                |                 2016 |
      | account_manager                      | Test ACC Manager     |
      | success_static_return_link           | http://www.gogle.com |
      | fail_static_return_link              | http://www.gogle.com |
      | do_credit_pre_auth                   | Y                    |
      | custom_payment_screens               | N                    |
      | auto_settle_txn                      | N                    |
      | Allow_sale_transaction_without_pages | N                    |
      | Allow_mobile_transactions            | N                    |
      | capture_billing_address              | N                    |
      | show_captcha                         | N                    |
      | inapp_payment                        | Y                    |
      | txn_ref_num_uniqueness_period        | 24_HOURS             |
      | fixed_service_fee_period             | MONTHLY              |
      | fixed_service_fee_amount             |                 5.00 |
      | fixed_service_fee_currency           | NPR                  |
      | merchant_multi_purpose_1             | MERCH NAME TWO       |
      | merchant_multi_purpose_2             | LINE 1               |
      | merchant_multi_purpose_3             | LINE 2               |
      | merchant_multi_purpose_4             | Line 3               |
      | merchant_multi_purpose_5             | LINE 4               |
      | merchant_multi_purpose_6             | emailAccMan@ib.com   |
      | merchant_multi_purpose_7             |          07123658974 |
      | merchant_multi_purpose_8             |                      |
      | merchant_multi_purpose_9             |                      |
      | merchant_multi_purpose_10            |                      |
      | merchant_multi_purpose_11            |                      |
      | merchant_multi_purpose_12            |                      |
      | product_code                         | VISA                 |
      | bin_length                           |                    6 |
      | bin                                  |               536205 |
      | bank_code                            |                 0001 |
      | bank_name                            | nibl                 |
      | iss_country_code                     | NP                   |
      | card_no_length                       |                   16 |
      | currency_code                        | NPR                  |
      | product_terminal_id                  |             90019959 |
      | global_limit_category                | 27gts                 |
      | per_sale_txn_limit_alwd              | I                    |
      | per_sale_txn_limit_value             |                      |
      | daily_sale_txn_limit_alwd            | I                    |
      | daily_sale_txn_limit_value           |                      |
      | monthly_sale_txn_limit_alwd          | I                    |
      | monthly_sale_txn_limit_value         |                      |
      | debit_void_alwd                      | I                    |
      | credit_card_void_alwd                | I                    |
      | debit_refund_alwd                    | I                    |
      | credit_card_refund_alwd              | I                    |
      | per_refund_txn_limit_alwd            | I                    |
      | per_refund_txn_limit_value           |                      |
      | daily_refund_txn_limit_alwd          | I                    |
      | daily_refund_txn_limit_value         |                      |
      | monthly_refund_txn_limit_alwd        | I                    |
      | monthly_refund_txn_limit_value       |                      |
      | off_us_credit_card_alwd              | I                    |
      | plain_text_txn_req_alwd              | I                    |
      | void_allowed_period_alwd             | I                    |
      | void_allowed_period_value            |                      |
      | refund_allowed_period_alwd           | I                    |
      | refund_allowed_period_value          |                      |
      | clearance_allowed_period_alwd        | I                    |
      | clearance_allowed_period_value       |                      |
      | language_code                        | eng                  |
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant successfully added and is pending approval." in ipay "Add Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  1 |
      | IPG   | select count(*) from ipg_prod_issu_dtl_for_auth where merchant_id='30MER' and  PRODUCT_CODE='VISA' and STATUS_CODE=3                                         |                  1 |
      | IPG   | select count(*) from ipg_merch_alwd_cur_for_auth WHERE merchant_id='30MER' and CURRENCY_CODE='NPR' and GLOBAL_LIMIT_CATEGORY='27gts' and STATUS_CODE=3        |                  1 |
      | IPG   | select count(*) from ipg_merchant_limit_for_auth WHERE merchant_id='30MER' and CURRENCY_CODE='NPR' and STATUS_CODE=3                                         |                 18 |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_LANGUAGE_F_A WHERE merchant_id='30MER' and LANGUAGE_CODE='eng' and STATUS_CODE=3                                      |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Reject
    Given I Click the "Approve Merchant" icon to ipay Merchant Management
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I Enter the Comment "Rejected Merchant" in "Approve Merchant"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in ipay "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Merchant successfully rejected." in ipay "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=4 |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Reapply
    Given I Click the "Reapply Merchant" icon to ipay Merchant Management
    Then I should see the "Reapply Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Reapply Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Reapply Merchant" page to ipay Merchant Management
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant successfully reapplied and is pending approval." in ipay "Reapply Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Approve
    Given I Click the "Approve Merchant" icon to ipay Merchant Management
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I Enter the Comment "Approved Reapplied Merchant" in "Approve Merchant"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in ipay "Approve Merchant"
    Then I Check for Success Message "Merchant successfully approved." in ipay "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  0 |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=1          |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Edit
    Given I Click the "Edit Merchant" icon to ipay Merchant Management
    Then I should see the "Edit Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Edit Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Edit Merchant" page to ipay Merchant Management
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant successfully edited." in ipay "Edit Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Approve
    Given I Click the "Approve Merchant" icon to ipay Merchant Management
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I Enter the Comment "Approved Modified Merchant " in "Approve Merchant"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in ipay "Approve Merchant"
    Then I Check for Success Message "Merchant successfully approved." in ipay "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  0 |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=1          |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Suspend
    Given I Click the "Suspend Merchant" icon to ipay Merchant Management
    Then I should see the "Suspend Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Suspend Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Suspend Merchant" page to ipay Merchant Management
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant successfully suspended" in ipay "Suspend Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  0 |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=5 |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Delete
    Given I Click the "Delete Merchant" icon to ipay Merchant Management
    Then I should see the "Delete Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Delete Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Delete Merchant" page to ipay Merchant Management
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant successfully deleted and is pending approval" in ipay "Delete Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=6 |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Reject(Action Deletion Reject)
    Given I Click the "Approve Merchant" icon to ipay Merchant Management
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I Enter the Comment "Rejected Merchant" in "Approve Merchant"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in ipay "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Merchant successfully rejected." in ipay "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=5 |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Revoke
    Given I Click the "Revoke Merchant" icon to ipay Merchant Management
    Then I should see the "Revoke Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Revoke Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Revoke Merchant" page to ipay Merchant Management
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant successfully edited." in ipay "Revoke Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  1 |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=5          |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Merchant Approve
    Given I Click the "Approve Merchant" icon to ipay Merchant Management
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I fill the Search_Merchant form
      | field       | value |
      | merchant_id | 30MER  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I click the link "30MER"
    Then I should see the "Approve Merchant" page to ipay Merchant Management
    And I Enter the Comment "Approved Revoked Merchant " in "Approve Merchant"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in ipay "Approve Merchant"
    Then I Check for Success Message "Merchant successfully approved." in ipay "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                         | Expected Row Count |
      | IPG   | select count(*) from ipg_merchant_for_auth where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=3 |                  0 |
      | IPG   | select count(*) from ipg_merchant where merchant_id='30MER' and business_type_id='27myBusinessTest' and url='http://www.gogle.com' and STATUS_CODE=1          |                  1 |

  Scenario: Back to ipay Merchant Management
    And I click on "Merchant Management" icon to back ipay Merchant Management
    Then I should see the "Merchant Management" page to ipay Merchant Management

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
