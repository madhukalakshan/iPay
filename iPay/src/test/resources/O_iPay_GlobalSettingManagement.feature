###############################################################################################################################################
# Global Txn. Setting with glob_txn_id 27gts will be created.
# Global Txn. Setting with glob_txn_id 27gtsdel is created for deletion.
###############################################################################################################################################
Feature: Feature File for Global Setting Management

  @GlbSettMgmt
  Scenario: Navigate to Global Setting Managment
    Given I Click the "Merchant Related" icon to Global Setting Managment
    Then I should see the "Merchant Related" page to Global Setting Managment
    And I Click the "Global Setting Mgmt" icon
    Then I should see the "Global Setting Mgmt" page

  Scenario: Add Global Setting Managment
    Given I Click the "Add Global Txn. Setting" icon
    Then I should see the "Add Global Txn. Setting" page
    And I fill the Add Global Txn.Setting Form
      | field                          | value       |
      | global_limit_category          | 27gts        |
      | currency_code                  | NPR         |
      | glob_limit_cat_desc            | Txn Setting |
      | per_sale_txn_limit_value       | 10007000.00 |
      | daily_sale_txn_limit_value     | 10007000.00 |
      | monthly_sale_txn_limit_value   | 10007000.00 |
      | debit_void_alwd                | Y           |
      | credit_card_void_alwd          | Y           |
      | debit_refund_alwd              | Y           |
      | credit_card_refund_alwd        | Y           |
      | debit_clearance_alwd           | Y           |
      | credit_clearance_alwd          | Y           |
      | per_refund_txn_limit_value     |    25000.00 |
      | daily_refund_txn_limit_value   |    50000.00 |
      | monthly_refund_txn_limit_value |   100070.00 |
      | off_us_credit_card_alwd        | Y           |
      | plain_text_txn_req_alwd        | Y           |
      | void_allowed_period_value      |          15 |
      | refund_allowed_period_value    |          15 |
      | clearance_allowed_period_value |          15 |
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully added and is pending approval" in "Add Global Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOB_TXN_LMT_CAT_FOR_AUTH where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 3 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Approve
    Given I Click the "Approve Glob. Txn. Setting" icon
    Then I should see the "Approve Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I Enter the Comment "Rejected Global Setting" in "Approve Glob. Txn. Setting"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Successfully rejected global transaction setting." in "Approve Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOB_TXN_LMT_CAT_FOR_AUTH where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 4 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Reapply
    Given I Click the "Reapply Glob. Txn. Setting" icon
    Then I should see the "Reapply Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Reapply Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Reapply Glob. Txn. Setting" page
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully reapplied and is pending approval" in "Reapply Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOB_TXN_LMT_CAT_FOR_AUTH where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 3 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Approve
    Given I Click the "Approve Glob. Txn. Setting" icon
    Then I should see the "Approve Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I Enter the Comment "Approved Global Setting" in "Approve Glob. Txn. Setting"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Successfully approved global transaction setting." in "Approve Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 1 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Edit
    Given I Click the "Edit Glob. Txn. Setting" icon
    Then I should see the "Edit Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Edit Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Edit Glob. Txn. Setting" page
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully edited and is pending approval" in "Edit Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOB_TXN_LMT_CAT_FOR_AUTH where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 3 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Approve
    Given I Click the "Approve Glob. Txn. Setting" icon
    Then I should see the "Approve Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I Enter the Comment "Approved Edited Global Setting" in "Approve Glob. Txn. Setting"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Successfully approved global transaction setting." in "Approve Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 1 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Suspend
    Given I Click the "Suspend Glob. Txn. Setting" icon
    Then I should see the "Suspend Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Suspend Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Suspend Glob. Txn. Setting" page
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully suspended." in "Suspend Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 5 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Revoke
    Given I Click the "Revoke Glob. Txn. Setting" icon
    Then I should see the "Revoke Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Revoke Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Revoke Glob. Txn. Setting" page
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully revoked and is pending approval" in "Revoke Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOB_TXN_LMT_CAT_FOR_AUTH where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 3 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Approve
    Given I Click the "Approve Glob. Txn. Setting" icon
    Then I should see the "Approve Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I click the link "27gts"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I Enter the Comment "Approved Edited Global Setting" in "Approve Glob. Txn. Setting"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Successfully approved global transaction setting." in "Approve Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                       | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gts' and status_code = 1 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN View
    Given I Click the "View Glob. Txn. Setting" icon
    Then I should see the "View Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value |
      | glob_txn_id | 27gts  |
    And I Click on Button "submit"
    Then I should see the "View Glob. Txn. Setting" page
    And I click the link "Active (Approved)"
    Then I should see the "View Glob. Txn. Setting" page

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Add Global Setting Managment(Action Deletion)
    Given I Click the "Add Global Txn. Setting" icon
    Then I should see the "Add Global Txn. Setting" page
    And I fill the Add Global Txn.Setting Form
      | field                          | value       |
      | global_limit_category          | 27gtsdel     |
      | currency_code                  | NPR         |
      | glob_limit_cat_desc            | Txn Setting |
      | per_sale_txn_limit_value       | 10007000.00 |
      | daily_sale_txn_limit_value     | 10007000.00 |
      | monthly_sale_txn_limit_value   | 10007000.00 |
      | debit_void_alwd                | N           |
      | credit_card_void_alwd          | N           |
      | debit_refund_alwd              | N           |
      | credit_card_refund_alwd        | N           |
      | debit_clearance_alwd           | N           |
      | credit_clearance_alwd          | N           |
      | per_refund_txn_limit_value     |    25000.00 |
      | daily_refund_txn_limit_value   |    50000.00 |
      | monthly_refund_txn_limit_value |   100070.00 |
      | off_us_credit_card_alwd        | Y           |
      | plain_text_txn_req_alwd        | N           |
      | void_allowed_period_value      |          15 |
      | refund_allowed_period_value    |          15 |
      | clearance_allowed_period_value |          15 |
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully added and is pending approval" in "Add Global Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                          | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOB_TXN_LMT_CAT_FOR_AUTH where description ='Txn Setting' and global_limit_category ='27gtsdel' and status_code = 3 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Approve
    Given I Click the "Approve Glob. Txn. Setting" icon
    Then I should see the "Approve Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value   |
      | glob_txn_id | 27gtsdel |
    And I Click on Button "submit"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I click the link "27gtsdel"
    Then I should see the "Approve Glob. Txn. Setting" page
    And I Enter the Comment "Approved Added Global Setting" in "Approve Glob. Txn. Setting"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Glob. Txn. Setting"
    Then I Check for Success Message "Successfully approved global transaction setting." in "Approve Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                          | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gtsdel' and status_code = 1 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Suspend(Action Deletion)
    Given I Click the "Suspend Glob. Txn. Setting" icon
    Then I should see the "Suspend Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value   |
      | glob_txn_id | 27gtsdel |
    And I Click on Button "submit"
    Then I should see the "Suspend Glob. Txn. Setting" page
    And I click the link "27gtsdel"
    Then I should see the "Suspend Glob. Txn. Setting" page
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully suspended." in "Suspend Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                          | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gtsdel' and status_code = 5 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Global TRXN Delete
    Given I Click the "Delete Glob. Txn. Setting" icon
    Then I should see the "Delete Glob. Txn. Setting" page
    And I fill the Global Setting search form
      | field       | value   |
      | glob_txn_id | 27gtsdel |
    And I Click on Button "submit"
    Then I should see the "Delete Glob. Txn. Setting" page
    And I click the link "27gtsdel"
    Then I should see the "Delete Glob. Txn. Setting" page
    And I Click on Button "submit"
    Then I Check for Success Message "Global transaction setting successfully deleted and is pending approval." in "Delete Glob. Txn. Setting"
    Then I call verify method
      | Alias | SQL                                                                                                                                          | Expected Row Count |
      | IPG   | select count(*) from IPG_GLOBAL_TXN_LIMIT_CATEGORY where description ='Txn Setting' and global_limit_category ='27gtsdel' and status_code = 6 |                  1 |

  Scenario: Back to Global Setting Management
    And I click on "Global Setting Mgmt" icon to back
    Then I should see the "Global Setting Mgmt" page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
