###############################################################################################################################################
#Merchant Category Code with name 27MCC will be created.
#MercCatCode 9107 , 10007 should not be in db for this feature to succeed.
#Merchant Category Code with name 27MCCDEL is created to to deletion.
###############################################################################################################################################
Feature: iCore Merchant Category Code Maintenance

  @MCC
  Scenario: Goto Category Code in iCore module
    Given I Click the "Merchant Management" icon to Merchant Cat. Code Maintenance
    Then I should see the "Merchant Management" page to Merchant Cat. Code Maintenance
    And I Click the "Merchant Cat. Maintenance" icon to Merchant Cat. Code Maintenance
    Then I should see the "Merchant Cat. Maintenance" page to Merchant Cat. Code Maintenance
    And I Click the "Merchant Cat. Code Maintenance" icon
    Then I should see the "Merchant Cat. Code Maintenance" page

  Scenario: Add Merchant Category Code in iCore module
    Given I Click the "Add Merchant Cat. Code" icon
    Then I should see the "Add Merchant Cat. Code" page
    And I fill "MCG Description"
      | field   | value |
      | GrpDesc | 27MCG  |
    And I Click on Button "Submit"
    Then I Check if MCG exists
    And I click the link "Create"
    And I fill "Merchant Category Code Details"
      | field       | value |
      | MercCatCode |  9107 |
      | Description | 27MCC  |
    And I Click on Button "Submit"
    Then I Check for Error "Merchant Category Code already exists"
    Then I Check for Success Message "Merchant Category Code Added successfully" in "Add Merchant Cat. Code"
    Then I call verify method
      | Alias | SQL                                                                                                     | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_CODE WHERE MCC_DES='27MCC' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  1 |

  Scenario: Back to Merchant Category Code Maintenance
    And I click on "Merchant Cat. Code Maintenance" icon to back
    Then I should see the "Merchant Cat. Code Maintenance" page

  Scenario: Modified Merchant Category Code in iCore module
    Given I Click the "Manage Merchant Cat. Code" icon
    Then I should see the "Manage Merchant Cat. Code" page
    And I fill "MCG Description"
      | field    | value |
      | CodeDesc | 27MCC  |
    And I Click on Button "Submit"
    Then I Check if MCG exists
    And I click the link "Modify"
    And I modify "MCC Description"
      | field       | value |
      | Description | 27MCC  |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Category Code modified successfully" in "Manage Merchant Cat. Code"
    Then I call verify method
      | Alias | SQL                                                                                                     | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_CODE WHERE MCC_DES='27MCC' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  1 |

  Scenario: Back to Merchant Category Code Maintenance
    And I click on "Merchant Cat. Code Maintenance" icon to back
    Then I should see the "Merchant Cat. Code Maintenance" page

  Scenario: View Merchant Category Code in iCore module
    Given I Click the "Manage Merchant Cat. Code" icon
    Then I should see the "Manage Merchant Cat. Code" page
    And I fill "MCC Description"
      | field    | value |
      | CodeDesc | 27MCC  |
    And I Click on Button "Submit"
    Then I Check if MCG exists
    And I click the link "View"

  Scenario: Back to Merchant Category Code Maintenance
    And I click on "Merchant Cat. Code Maintenance" icon to back
    Then I should see the "Merchant Cat. Code Maintenance" page

  Scenario: Add Merchant Category Code for deletion in iCore module
    Given I Click the "Add Merchant Cat. Code" icon
    Then I should see the "Add Merchant Cat. Code" page
    And I fill "MCG Description"
      | field   | value |
      | GrpDesc | 27MCG  |
    And I Click on Button "Submit"
    Then I Check if MCG exists
    And I click the link "Create"
    And I fill "Merchant Category Code Details"
      | field       | value   |
      | MercCatCode |    10007 |
      | Description | 27MCCDEL |
    And I Click on Button "Submit"
    Then I Check for Error "Merchant Category Code already exists"
    Then I Check for Success Message "Merchant Category Code Added successfully" in "Add Merchant Cat. Code"
    Then I call verify method
      | Alias | SQL                                                                                                        | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_CODE WHERE MCC_DES='27MCCDEL' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  1 |

  Scenario: Back to Merchant Category Code Maintenance
    And I click on "Merchant Cat. Code Maintenance" icon to back
    Then I should see the "Merchant Cat. Code Maintenance" page

  Scenario: Delete Merchant Category Code in iCore module
    Given I Click the "Manage Merchant Cat. Code" icon
    Then I should see the "Manage Merchant Cat. Code" page
    And I fill "MCC Description"
      | field    | value   |
      | CodeDesc | 27MCCDEL |
    And I Click on Button "Submit"
    Then I Check if MCC exists
    And I click the link "Delete"
    And I Click on Button "Submit1"
    Then I Check for Error "Cannot delete this MCC, Terminal is use this MCC"
    Then I Check for Success Message "Merchant Category Code Deleted successfully" in "Manage Merchant Cat. Code"
    Then I call verify method
      | Alias | SQL                                                                                                        | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_CODE WHERE MCC_DES='27MCCDEL' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  0 |

  Scenario: Back to Merchant Category Code Maintenance
    And I click on "Merchant Cat. Code Maintenance" icon to back
    Then I should see the "Merchant Cat. Code Maintenance" page

  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page
