Feature: Feature File for Merchant Currency Management

  @MerCurrMgmt
  Scenario: Click iPay Application Menu
    Given I Click the "Merchant Related" icon to Merchant Currency Management
    Then I should see the "Merchant Related" page to Merchant Currency Management
    And I Click the "Merchant Currency Management" icon
    Then I should see the "Merchant Currency Management" page

  Scenario: Add merchant currency
    Given I Click the "Add Merchant Currency" icon
    Then I should see the "Add Merchant Currency" page
    And I fill the Add Merchant Currency Form
      | field                          | value    |
      | merchant_id                    | 30MER     |
      | currency_code                  | NPR      |
      | terminal_id                    | 90019959 |
      | global_limit_category          | 27gts     |
      | per_sale_txn_limit_alwd        | I        |
      | per_sale_txn_limit_value       |          |
      | daily_sale_txn_limit_alwd      | I        |
      | daily_sale_txn_limit_value     |          |
      | monthly_sale_txn_limit_alwd    | I        |
      | monthly_sale_txn_limit_value   |          |
      | debit_void_alwd                | I        |
      | credit_card_void_alwd          | I        |
      | debit_refund_alwd              | I        |
      | credit_card_refund_alwd        | I        |
      | debit_clearance_alwd           | I        |
      | credit_clearance_alwd          | I        |
      | per_refund_txn_limit_alwd      | I        |
      | per_refund_txn_limit_value     |          |
      | daily_refund_txn_limit_alwd    | I        |
      | daily_refund_txn_limit_value   |          |
      | monthly_refund_txn_limit_alwd  | I        |
      | monthly_refund_txn_limit_value |          |
      | off_us_credit_card_alwd        | I        |
      | plain_text_txn_req_alwd        | I        |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I Check for Success Message "Currency NPR is already added to" in "Add Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                   | Expected Row Count |
      | IPG   | select count(*) from ipg_merch_alwd_cur_for_auth where merchant_id = '30MER' and currency_code = 'NPR' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Reject
    Given I Click the "Approve Merchant Currency" icon
    Then I should see the "Approve Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I should see the "Approve Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Approve Merchant Currency" page
    And I Enter the Comment "Rejected Merchant Currency" in "Approve Merchant Currency"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully rejected." in "Approve Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from ipg_merch_alwd_cur_for_auth where merchant_id = '30MER' and currency_code = 'NPR' and status_code='4' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Reapply
    Given I Click the "Reapply Merchant Currency" icon
    Then I should see the "Reapply Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I should see the "Reapply Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Reapply Merchant Currency" page
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant assigned currency successfully reapplied and is pending approval." in "Reapply Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from ipg_merch_alwd_cur_for_auth where merchant_id = '30MER' and currency_code = 'NPR' and status_code='3' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Approve(Action Reapplied approve)
    Given I Click the "Approve Merchant Currency" icon
    Then I should see the "Approve Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I should see the "Approve Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Approve Merchant Currency" page
    And I Enter the Comment "Approve Reapplied Merchant Currency" in "Approve Merchant Currency"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully approved." in "Approve Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_CURRENCY where merchant_id = '30MER' and currency_code = 'NPR' and status_code='1' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Edit
    Given I Click the "Edit Merchant Currency" icon
    Then I should see the "Edit Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Edit Merchant Currency"
    Then I should see the "Edit Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Edit Merchant Currency" page
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant assigned currency successfully edited and is pending approval." in "Edit Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_CURRENCY where merchant_id = '30MER' and currency_code = 'NPR' and status_code='1'  |                  1 |
      | IPG   | select count(*) from ipg_merch_alwd_cur_for_auth where merchant_id = '30MER' and currency_code = 'NPR' and status_code='3' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Approve(Action Edited Approve)
    Given I Click the "Approve Merchant Currency" icon
    Then I should see the "Approve Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I should see the "Approve Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Approve Merchant Currency" page
    And I Enter the Comment "Approve Edited Merchant Currency" in "Approve Merchant Currency"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully approved." in "Approve Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_CURRENCY where merchant_id = '30MER' and currency_code = 'NPR' and status_code='1' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Suspend
    Given I Click the "Suspend Merchant Currency" icon
    Then I should see the "Suspend Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Suspend Merchant Currency"
    Then I should see the "Suspend Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Suspend Merchant Currency" page
    And I Click on Button "submit" in "Suspend Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully suspended" in "Suspend Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_CURRENCY where merchant_id = '30MER' and currency_code = 'NPR' and status_code='5' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Delete
    Given I Click the "Delete Merchant Currency" icon
    Then I should see the "Delete Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Delete Merchant Currency"
    Then I should see the "Delete Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Delete Merchant Currency" page
    And I Click on Button "submit" in "Delete Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully deleted and is pending approval" in "Delete Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_CURRENCY where merchant_id = '30MER' and currency_code = 'NPR' and status_code='6' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Reject(Action Deletion Reject)
    Given I Click the "Approve Merchant Currency" icon
    Then I should see the "Approve Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I should see the "Approve Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Approve Merchant Currency" page
    And I Enter the Comment "Rejected Merchant Currency" in "Approve Merchant Currency"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully rejected." in "Approve Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from ipg_merch_allowed_currency where merchant_id = '30MER' and currency_code = 'NPR' and status_code='5' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Revoke
    Given I Click the "Revoke Merchant Currency" icon
    Then I should see the "Revoke Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Revoke Merchant Currency"
    Then I should see the "Revoke Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Revoke Merchant Currency" page
    And I Click on Button "submit" in "Revoke Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully edited and is pending approval." in "Revoke Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from ipg_merch_alwd_cur_for_auth where merchant_id = '30MER' and currency_code = 'NPR' and status_code='3' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency Approve(Action Revoked Approve)
    Given I Click the "Approve Merchant Currency" icon
    Then I should see the "Approve Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "Approve Merchant Currency"
    Then I should see the "Approve Merchant Currency" page
    And I click the link "30MER"
    Then I should see the "Approve Merchant Currency" page
    And I Enter the Comment "Approve Revoked Merchant Currency" in "Approve Merchant Currency"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merchant Currency"
    Then I Check for Success Message "Merchant assigned currency successfully approved." in "Approve Merchant Currency"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_CURRENCY where merchant_id = '30MER' and currency_code = 'NPR' and status_code='1' |                  1 |

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Merchant Currency View
    Given I Click the "View Merchant Currency" icon
    Then I should see the "View Merchant Currency" page
    And I fill the Search Merchant Currency Form
      | field         | value |
      | merchant_id   | 30MER  |
      | currency_code | NPR   |
    And I Click on Button "submit" in "View Merchant Currency"
    Then I should see the "View Merchant Currency" page
    And I click the link "Active (Approved)"
    Then I should see the "View Merchant Currency" page

  Scenario: Back to Merchant Currency Management
    And I click on "Merchant Currency Management" icon to back
    Then I should see the "Merchant Currency Management" page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
