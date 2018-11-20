Feature: Feature File for Merchant Language Management

  @MerAllwdLanMgmt
  Scenario: Click iPay Application Menu
    Given I Click the "Merchant Related" icon to "Merch. Allwd. Language Mgmt."
    Then I should see the "Merchant Related" page to "Merch. Allwd. Language Mgmt."
    And I Click the "Merch. Allwd. Language Mgmt." icon
    Then I should see the "Merch. Allwd. Language Mgmt." page

  #Scenario: Add Mechant Language
    #Given I Click the "Add Merch. Allwd. Language" icon
    #Then I should see the "Add Merch. Allwd. Language" page
    #And I fill the Add Merchant Language Form
      #| field         | value |
      #| merchant_id   | 30MER  |
      #| language_code | eng   |
    #And I Click on Button "submit" in "Add Merch. Allwd. Language"
    #Then I Check for Success Message "Merchant allowed language, eng is already added" in "Add Merch. Allwd. Language"
    #Then I call verify method
      #| Alias | SQL                                                                                                      | Expected Row Count |
      #| IPG   | select count(*) from IPG_MERCH_ALLOWED_LANGUAGE_F_A where merchant_id = '30MER' and language_code = 'eng' |                  1 |
#
  #Scenario: Back to Merchant Allowed Language Management
    #And I click on "Merch. Allwd. Language Mgmt." icon to back
    #Then I should see the "Merch. Allwd. Language Mgmt." page

  Scenario: Merchant Language Approve
    Given I Click the "Approve Merch. Allwd. Language" icon
    Then I should see the "Approve Merch. Allwd. Language" page
    And I click the link "30MER" in ipay "Approve Merch. Allwd. Language"
    Then I should see the "Approve Merch. Allwd. Language" page
    And I Enter the Comment "Approve Merchant Language" in "Approve Merch. Allwd. Language"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "approve" in "Approve Merch. Allwd. Language"
    Then I Check for Success Message "Merchant allowed language successfully approved." in "Approve Merch. Allwd. Language"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_LANGUAGE where merchant_id = '30MER' and language_code = 'eng' and status_code='1' |                  1 |

  Scenario: Back to Merchant Allowed Language Management
    And I click on "Merch. Allwd. Language Mgmt." icon to back
    Then I should see the "Merch. Allwd. Language Mgmt." page

  Scenario: Merchant Language Delete
    Given I Click the "Delete Merch. Allwd. Language" icon
    Then I should see the "Delete Merch. Allwd. Language" page
    And I click the link "30MER" in ipay "Delete Merch. Allwd. Language"
    Then I should see the "Delete Merch. Allwd. Language" page
    And I Click on Button "submit" in "Delete Merch. Allwd. Language"
    Then I Check for Success Message "Merchant allowed language successfully deleted and is pending approval." in "Delete Merch. Allwd. Language"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_LANGUAGE where merchant_id = '30MER' and language_code = 'eng' and status_code='6' |                  1 |

  Scenario: Back to Merchant Allowed Language Management
    And I click on "Merch. Allwd. Language Mgmt." icon to back
    Then I should see the "Merch. Allwd. Language Mgmt." page

  Scenario: Merchant Language Reject(Action Deletion Reject)
    Given I Click the "Approve Merch. Allwd. Language" icon
    Then I should see the "Approve Merch. Allwd. Language" page
    And I click the link "30MER" in ipay "Approve Merch. Allwd. Language"
    Then I should see the "Approve Merch. Allwd. Language" page
    And I Enter the Comment "Reject DeFleted Merchant Language" in "Approve Merch. Allwd. Language"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on Button "reject" in "Approve Merch. Allwd. Language"
    Then I Check for Success Message "Merchant allowed language successfully rejected." in "Approve Merch. Allwd. Language"
    Then I call verify method
      | Alias | SQL                                                                                                                      | Expected Row Count |
      | IPG   | select count(*) from IPG_MERCH_ALLOWED_LANGUAGE where merchant_id = '30MER' and language_code = 'eng' and status_code='1' |                  1 |

  Scenario: Back to Merchant Allowed Language Management
    And I click on "Merch. Allwd. Language Mgmt." icon to back
    Then I should see the "Merch. Allwd. Language Mgmt." page

  Scenario: Merchant Language View
    Given I Click the "View Merch. Allwd. Language" icon
    Then I should see the "View Merch. Allwd. Language" page
    And I click the link "Active (Approved)" in ipay "View Merch. Allwd. Language"
    Then I should see the "View Merch. Allwd. Language" page

  Scenario: Back to Merchant Allowed Language Management
    And I click on "Merch. Allwd. Language Mgmt." icon to back
    Then I should see the "Merch. Allwd. Language Mgmt." page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
