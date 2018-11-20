###############################################################################################################################################
# Merchant Category Code 3475 will be created.
###############################################################################################################################################
Feature: Feature File for Merchant Category Management

  @MerCatMgmt
  Scenario: Click iPay Application Menu
    Given I Click the "Merchant Related" icon to "Merchant Category Mgmt."
    Then I should see the "Merchant Related" page to "Merchant Category Mgmt."
    And I Click the "Merchant Category Mgmt." icon
    Then I should see the "Merchant Category Mgmt." page

  Scenario: Add Merchant Category
    Given I Click the "Add Merchant Category" icon
    Then I should see the "Add Merchant Category" page
    Then I should be on Add Merchant Category Page
      | field        | value                   |
      | mer_cat_code |                    3475 |
      | mer_cat_des  | Added Merchant Category |
    And I Click on Button "submit"
    Then I Check for Success Message "Successfully added Merchant Category." in "Add Merchant Category"
    Then I call verify method
      | Alias | SQL                                                                           | Expected Row Count |
      | IPG   | select count(*) FROM ipg_marchant_category  WHERE merch_category_code ='3475' |                  1 |

  Scenario: Back to Merchant Category Management
    And I click on "Merchant Category Mgmt." icon to back
    Then I should see the "Merchant Category Mgmt." page
  
  Scenario: Edit Merchant Category
    Given I Click the "Edit Merchant Category" icon
    Then I should see the "Edit Merchant Category" page
    And I fill the Search Merchant Category "Edit" Form
      | field        | value                   |
      | mer_cat_code |                    3475 |
      | mer_cat_des  | Added Merchant Category |
    And I Click on Button "submit"
    Then I should see the "Edit Merchant Category" page
    And I click the link "Added Merchant Category"
    Then I should see the "Edit Merchant Category" page
    And I edit description
      | field       | value                    |
      | mer_cat_des | Edited Merchant Category |
    And I Click on Button "submit"
    Then I Check for Success Message "Successfully edited Merchant Category." in "Edit Merchant Category"
    Then I call verify method
      | Alias | SQL                                                                           | Expected Row Count |
      | IPG   | select count(*) FROM ipg_marchant_category  WHERE merch_category_code ='3475' |                  1 |

  Scenario: Back to Merchant Category Management
    And I click on "Merchant Category Mgmt." icon to back
    Then I should see the "Merchant Category Mgmt." page
  
  Scenario: View Merchant Category
    Given I Click the "View Merchant Category" icon
    Then I should see the "View Merchant Category" page
    And I fill the Search Merchant Category "Edit" Form
      | field        | value                    |
      | mer_cat_code |                     3475 |
      | mer_cat_des  | Edited Merchant Category |
    And I Click on Button "submit"
    Then I should see the "View Merchant Category" page
    And I click the link "Edited Merchant Category"
    Then I should see the "View Merchant Category" page
    Then I call verify method
      | Alias | SQL                                                                           | Expected Row Count |
      | IPG   | select count(*) FROM ipg_marchant_category  WHERE merch_category_code ='3475' |                  1 |

  Scenario: Back to Merchant Category Management
    And I click on "Merchant Category Mgmt." icon to back
    Then I should see the "Merchant Category Mgmt." page
  
  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
