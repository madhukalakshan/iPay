###############################################################################################################################################
# Should have "VISA" Product approved before this feature file execute
###############################################################################################################################################
Feature: Feature File for Merchant Allowed Bin Management

  @MerAllwdBinMgmt
  Scenario: Click iPay Application Menu
    Given I Click the "Merchant Related" icon to "Merch. Allwd. BIN Mgmt."
    Then I should see the "Merchant Related" page to "Merch. Allwd. BIN Mgmt."
    And I Click the "Merch. Allwd. BIN Mgmt." icon
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Add merchant allowed bin
    Given I Click the "Add Merch. Allwd. BIN" icon
    Then I should see the "Add Merch. Allwd. BIN" page
    And I fill the Add Merchant Allowed Bin Form
      | field           | value  |
      | product_code    | VISA   |
      | merchant_id     | 30MER  |
      | bin_length      |      6 |
      | bin             | 536205 |
      | bank_code       |   0001 |
      | bank_name       | nibl   |
      | country_code    | NP     |
      | card_no_length  |     16 |
      | include_exclude | Y      |
    And I Click on Button "submit" in "Add Merch. Allwd. BIN"
    Then I Check for Success Message "BIN 536205 for Product VISA for Merchant 30MER is already added to the system" in "Add Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                              | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 3 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Reject
    Given I Click the "Approve Merch. Allwd. BIN" icon
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Approve" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Approve Merch. Allwd. BIN"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I Enter the Comment "Rejected Merchant Allowed Bin" in "Approve Merch. Allwd. BIN"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully rejected." in "Approve Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                              | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 4 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Reapply
    Given I Click the "Reapply Merch. Allwd. BIN" icon
    Then I should see the "Reapply Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Reapply" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Reapply Merch. Allwd. BIN"
    Then I should see the "Reapply Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Reapply Merch. Allwd. BIN" page
    And I Click on Button "submit" in "Reapply Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully reapplied and is pending approval." in "Reapply Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                              | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 3 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Approve(Action Reapplied Approve)
    Given I Click the "Approve Merch. Allwd. BIN" icon
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Approve" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Approve Merch. Allwd. BIN"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I Enter the Comment "Approve Reapplied Merchant Allowed Bin" in "Approve Merch. Allwd. BIN"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully approved." in "Approve Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN where merchant_id = '30MER' and product_code = 'VISA' and status_code = 1 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Edit
    Given I Click the "Edit Merch. Allwd. BIN" icon
    Then I should see the "Edit Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Edit" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Edit Merch. Allwd. BIN"
    Then I should see the "Edit Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Edit Merch. Allwd. BIN" page
    And I Click on Button "submit" in "Edit Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully edited and is pending approval." in "Edit Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                              | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 3 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Approve(Action Edited Approve)
    Given I Click the "Approve Merch. Allwd. BIN" icon
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Approve" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Approve Merch. Allwd. BIN"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I Enter the Comment "Approve modified Merchant Allowed Bin" in "Approve Merch. Allwd. BIN"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully approved." in "Approve Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN where merchant_id = '30MER' and product_code = 'VISA' and status_code = 1 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Suspend
    Given I Click the "Suspend Merch. Allwd. BIN" icon
    Then I should see the "Suspend Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Suspend" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Suspend Merch. Allwd. BIN"
    Then I should see the "Suspend Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Suspend Merch. Allwd. BIN" page
    And I Click on Button "submit" in "Suspend Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully suspended." in "Suspend Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN where merchant_id = '30MER' and product_code = 'VISA' and status_code = 5 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Delete
    Given I Click the "Delete Merch. Allwd. BIN" icon
    Then I should see the "Delete Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Delete" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Delete Merch. Allwd. BIN"
    Then I should see the "Delete Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Delete Merch. Allwd. BIN" page
    And I Click on Button "submit" in "Delete Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully deleted and is pending approval." in "Delete Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN where merchant_id = '30MER' and product_code = 'VISA' and status_code = 6 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Reject(Action Deletion Reject)
    Given I Click the "Approve Merch. Allwd. BIN" icon
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Approve" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Approve Merch. Allwd. BIN"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I Enter the Comment "Rejected Merchant Allowed Bin" in "Approve Merch. Allwd. BIN"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully rejected." in "Approve Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN where merchant_id = '30MER' and product_code = 'VISA' and status_code = 5 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Revoke
    Given I Click the "Revoke Merch. Allwd. BIN" icon
    Then I should see the "Revoke Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Revoke" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Revoke Merch. Allwd. BIN"
    Then I should see the "Revoke Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Revoke Merch. Allwd. BIN" page
    And I Click on Button "submit" in "Revoke Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully edited and is pending approval." in "Revoke Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                              | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 3 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin Approve(Action Revoked Approve)
    Given I Click the "Approve Merch. Allwd. BIN" icon
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "Approve" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "Approve Merch. Allwd. BIN"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I click the link "VISA"
    Then I should see the "Approve Merch. Allwd. BIN" page
    And I Enter the Comment "Approve revoked Merchant Allowed Bin" in "Approve Merch. Allwd. BIN"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merch. Allwd. BIN"
    Then I Check for Success Message "Merchant allowed bin successfully approved." in "Approve Merch. Allwd. BIN"
    Then I call verify method
      | Alias | SQL                                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_BIN where merchant_id = '30MER' and product_code = 'VISA' and status_code = 1 AND BIN = '536205' |                  1 |

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Merchant Allowed Bin View
    Given I Click the "View Merch. Allwd. BIN" icon
    Then I should see the "View Merch. Allwd. BIN" page
    And I fill the Search Merchant Allowed Bin "View" Form
      | field        | value  |
      | product_code | VISA   |
      | merchant_id  | 30MER  |
      | bin          | 536205 |
    And I Click on Button "submit" in "View Merch. Allwd. BIN"
    Then I should see the "View Merch. Allwd. BIN" page
    And I click the link "Active (Approved)"
    Then I should see the "View Merch. Allwd. BIN" page

  Scenario: Back to Merchant Allowed Bin Management
    And I click on "Merch. Allwd. BIN Mgmt." icon to back
    Then I should see the "Merch. Allwd. BIN Mgmt." page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
