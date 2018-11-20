Feature: Feature File for Merchant Product Management

  @MerProMgmt
  Scenario: Click iPay Application Menu
    Given I Click the "Merchant Related" icon to Merchant Product Management
    Then I should see the "Merchant Related" page to Merchant Product Management
    And I Click the "Merchant Product Management" icon
    Then I should see the "Merchant Product Management" page

  #Scenario: Add merchant product
  #Given I Click the "Add Merchant Product" icon
  #Then I should see the "Add Merchant Product" page
  #And I fill the Add Merchant Product Form
  #| field            | value           |
  #| merchant_id      | 30MER |
  #| product_code     | VISA          |
  #| bin_length       |            8 |
  #| bin              |     12347578 |
  #| bank_code        |         0001 |
  #| bank_name        | DefaultBank  |
  #| iss_country_code | LK           |
  #| card_no_length   |           16 |
  #| include_exclude  | Y            |
  #And I Click on Button "submit1"
  #And I Click on Button "submit1"
  #Then I Check for Success Message "Merchant Product successfully added and is pending approval." in "Add Merchant Product"
  #And I click on "Merchant Product Management" icon to back
  #Then I should see the "Merchant Product Management" page
  #Then I call verify method
  #| Alias | SQL                                                                                                                | Expected Row Count |
  #| IPG  | select count(*) from IPG_PROD_ISSU_DTL_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' |                  1 |
  #
  #Scenario: Back to Merchant Product Management
  #And I click on "Merchant Product Management" icon to back
  #Then I should see the "Merchant Product Management" page
  
  Scenario: Merchant Product Reject
    Given I Click the "Approve Merchant Product" icon
    Then I should see the "Approve Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant Product" page
    And I click the link "Pending Approval for Activation"
    Then I should see the "Approve Merchant Product" page
    And I Enter the Comment "Rejected Merchant Product" in "Approve Merchant Product"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merchant Product"
    Then I Check for Success Message "Merchant Product successfully rejected." in "Approve Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_PROD_ISSU_DTL_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 4 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Reapply
    Given I Click the "Reapply Merchant Product" icon
    Then I should see the "Reapply Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Reapply Merchant Product" page
    And I click the link "Rejected"
    Then I should see the "Reapply Merchant Product" page
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant Product successfully reapplied and is pending approval." in "Reapply Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_PROD_ISSU_DTL_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 3 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Approve
    Given I Click the "Approve Merchant Product" icon
    Then I should see the "Approve Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant Product" page
    And I click the link "Pending Approval for Activation"
    Then I should see the "Approve Merchant Product" page
    And I Enter the Comment "Approved Merchant Product " in "Approve Merchant Product"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merchant Product"
    Then I Check for Success Message "Merchant Product successfully approved." in "Approve Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_PRODUCT_ISSUER_DETAIL where merchant_id = '30MER' and product_code = 'VISA' and status_code = 1 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Suspend
    Given I Click the "Suspend Merchant Product" icon
    Then I should see the "Suspend Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Suspend Merchant Product" page
    And I click the link "Active (Approved)"
    Then I should see the "Suspend Merchant Product" page
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant Product successfully suspended." in "Suspend Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_PRODUCT_ISSUER_DETAIL where merchant_id = '30MER' and product_code = 'VISA' and status_code = 5 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Delete
    Given I Click the "Delete Merchant Product" icon
    Then I should see the "Delete Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Delete Merchant Product" page
    And I click the link "Suspended"
    Then I should see the "Delete Merchant Product" page
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant Product successfully deleted and is pending approval." in "Delete Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_PRODUCT_ISSUER_DETAIL where merchant_id = '30MER' and product_code = 'VISA' and status_code = 6 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Reject(Action Deletion Reject)
    Given I Click the "Approve Merchant Product" icon
    Then I should see the "Approve Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant Product" page
    And I click the link "Pending Approval for Deletion"
    Then I should see the "Approve Merchant Product" page
    And I Enter the Comment "Rejected Merchant Product" in "Approve Merchant Product"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merchant Product"
    Then I Check for Success Message "Merchant Product successfully rejected." in "Approve Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_PRODUCT_ISSUER_DETAIL where merchant_id = '30MER' and product_code = 'VISA' and status_code = 5 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Revoke
    Given I Click the "Revoke Merchant Product" icon
    Then I should see the "Revoke Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Revoke Merchant Product" page
    And I click the link "Suspended"
    Then I should see the "Revoke Merchant Product" page
    And I Click on Button "submit"
    Then I Check for Success Message "Merchant Product successfully edited and is pending approval." in "Revoke Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_PROD_ISSU_DTL_FOR_AUTH where merchant_id = '30MER' and product_code = 'VISA' and status_code = 3 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product Approve
    Given I Click the "Approve Merchant Product" icon
    Then I should see the "Approve Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "Approve Merchant Product" page
    And I click the link "Pending Approval for Activation"
    Then I should see the "Approve Merchant Product" page
    And I Enter the Comment "Approved Merchant Product " in "Approve Merchant Product"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merchant Product"
    Then I Check for Success Message "Merchant Product successfully approved." in "Approve Merchant Product"
    Then I call verify method
      | Alias | SQL                                                                                                                     | Expected Row Count |
      | IPG   | select count(*) from IPG_PRODUCT_ISSUER_DETAIL where merchant_id = '30MER' and product_code = 'VISA' and status_code = 1 |                  1 |

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Merchant Product View
    Given I Click the "View Merchant Product" icon
    Then I should see the "View Merchant Product" page
    And I fill the Search Merchant Product Form
      | field        | value |
      | merchant_id  | 30MER  |
      | product_code | VISA  |
    And I Click on Button "submit"
    Then I should see the "View Merchant Product" page
    And I click the link "Active (Approved)"
    Then I should see the "View Merchant Product" page

  Scenario: Back to Merchant Product Management
    And I click on "Merchant Product Management" icon to back
    Then I should see the "Merchant Product Management" page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
