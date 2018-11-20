####################################################################################
#Changeable input values
#input filed		value
#ProdTyp				30MERACCUC
####################################################################################
Feature: iCore Account Product Management(Merchant product)

  @MerProduct
  Scenario: Go to Account Product in iCore module
    Given I Click the "Account Management" icon to Account Product Management
    Then I should see the "Account Management" page to Account Product Management
    And I Click the "Account Product Management" icon
    Then I should see the "Account Product Management" page

  Scenario: Create Account Product in iCore module
    Given I Click the "Add Account Product" icon
    Then I should see the "Add Account Product" page
    And I fill the account product Creation form for Account Type "MERC"
      | field       | value                     |
      | AcctTyp     | MERC                      |
      | ProdTyp     | 30MERACCUC                |
      | Description | MERCHANT PRODUCT CUCUMBER |
      | CurrTyp     |                       524 |
      | StmtTyp     | H_CPY_CLCT                |
      #| StmtPrd     | MONTHLY                   |
      #| StmtDt      |                        10 |
    And I Click on Button "Submit"
    Then I Check for Error "The Product Type already exists"
    Then I Check for Success Message "Account Product Added successfully" in "Add Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=5 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Reject Account Product
    Given I Click the "Approve Account Product" icon
    Then I should see the "Approve Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I check whether No Records Found
    Then I should see the "Approve Account Product" page
    And I click the link "Details"
    Then I should see the "Approve Account Product" page
    And I Enter the Comment "Reject Account Product" in "Approve Account Product"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit2"
    Then I Check for Success Message "Account Product Rejected successfully" in "Approve Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=4 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: ReApply Account Product
    Given I Click the "Reapply Account Product" icon
    Then I should see the "Reapply Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Reapply Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Reapply Account Product" page
    And I fill Account Product edit details
      | field       | value                     |
      | Description | MERCHANT PRODUCT CUCUMBER |
    And I Enter the Comment "Reapply Account Product" in "Reapply Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Error "Please Select"
    Then I Check for Success Message "Account Product Reapplied successfully" in "Reapply Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=2 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Approve Account Product
    Given I Click the "Approve Account Product" icon
    Then I should see the "Approve Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Approve Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account Product" page
    And I Enter the Comment "Approve reapplied Account Product" in "Approve Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Account Product Approved successfully" in "Approve Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Edit Account Product
    Given I Click the "Edit Account Product" icon
    Then I should see the "Edit Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Edit Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Edit Account Product" page
    And I fill Account Product edit details
      | field       | value                     |
      | Description | MERCHANT PRODUCT CUCUMBER |
    And I Enter the Comment "Edit Account Product" in "Edit Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Account Product Modified successfully" in "Edit Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=3 |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Approve Account Product
    Given I Click the "Approve Account Product" icon
    Then I should see the "Approve Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Approve Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account Product" page
    And I Enter the Comment "Approve edited Account Product" in "Approve Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Account Product Approved successfully" in "Approve Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Suspend Account Product
    Given I Click the "Suspend Account Product" icon
    Then I should see the "Suspend Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Suspend Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Suspend Account Product" page
    And I Enter the Comment "Suspend Account Product" in "Suspend Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Account Product Suspended successfully" in "Suspend Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=6 |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=6 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Revoke Account Product
    Given I Click the "Revoke Account Product" icon
    Then I should see the "Revoke Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Revoke Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Revoke Account Product" page
    And I Enter the Comment "Revoke Account Product" in "Revoke Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Account Product Revoked successfully" in "Revoke Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=7 |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=6 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Approve Revoked Account Product
    Given I Click the "Approve Account Product" icon
    Then I should see the "Approve Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "Approve Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account Product" page
    And I Enter the Comment "Approve revoked Account Product" in "Approve Account Product"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Account Product Approved successfully" in "Approve Account Product"
    Then I call verify method
      | Alias | SQL                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROD WHERE PRODUCT_TYPE_ID='30MERACCUC' AND ACCT_TYP='MERC' AND STATUS_CODE=1 |                  1 |

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: View Account Product
    Given I Click the "View Account Product" icon
    Then I should see the "View Account Product" page
    And I fill Account Product search form
      | field   | value      |
      | ProdTyp | 30MERACCUC |
    And I Click on Button "Submit"
    Then I should see the "View Account Product" page
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "View Account Product" page

  Scenario: Back to Account Product Management
    And I click on "Account Product Management" icon to back
    Then I should see the "Account Product Management" page 
  
  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page
