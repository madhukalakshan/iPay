###############################################################################################################################################
#Merchant Category group with name 27MCG will be created.A new MCG ID will be created for it.
#Merchant Category group with name 27MCGDEL is created to to deletion.
###############################################################################################################################################
Feature: iCore Merchant Category Group Maintenance

  @MCG
  Scenario: GoTo Merchant Category Group in iCore module
    Given I Click the "Merchant Management" icon to Merchant Cat. Group Maintenance
    Then I should see the "Merchant Management" page to Merchant Cat. Group Maintenance
    And I Click the "Merchant Cat. Maintenance" icon to Merchant Cat. Group Maintenance
    Then I should see the "Merchant Cat. Maintenance" page to Merchant Cat. Group Maintenance
    And I Click the "Merchant Cat. Group Maintenance" icon
    Then I should see the "Merchant Cat. Group Maintenance" page

  Scenario: Add Merchant Category Group in iCore module
    Given I Click the "Add Merchant Cat. Group" icon
    And I should see the "Add Merchant Cat. Group" page
    And I fill "MCG Description"
      | field       | value |
      | Description | 27MCG  |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Category Group Added successfully" in "Add Merchant Cat. Group"
    Then I call verify method
      | Alias | SQL                                                                                                    | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_GRP WHERE MCG_DES='27MCG' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  1 |

  Scenario: Back to Merchant Category Group
    And I click on "Merchant Cat. Group Maintenance" icon to back
    Then I should see the "Merchant Cat. Group Maintenance" page

  Scenario: View Merchant Category Group in iCore module
    Given I Click the "Manage Merchant Cat. Group" icon
    And I should see the "Manage Merchant Cat. Group" page
    And I fill "MCG Description"
      | field   | value |
      | GrpDesc | 27MCG  |
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "View"
    Then I should see the "Manage Merchant Cat. Group" page

  Scenario: Back to Merchant Category Group
    And I click on "Merchant Cat. Group Maintenance" icon to back
    Then I should see the "Merchant Cat. Group Maintenance" page

  Scenario: Modified Merchant Category Group in iCore module
    Given I Click the "Manage Merchant Cat. Group" icon
    And I should see the "Manage Merchant Cat. Group" page
    And I fill "MCG Description"
      | field   | value |
      | GrpDesc | 27MCG  |
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Modify"
    And I fill "MCG Description"
      | field       | value |
      | Description | 27MCG  |
    Then I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Category Group modified successfully" in "Manage Merchant Cat. Group"
    Then I call verify method
      | Alias | SQL                                                                                                    | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_GRP WHERE MCG_DES='27MCG' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  1 |

  Scenario: Back to Merchant Category Group
    And I click on "Merchant Cat. Group Maintenance" icon to back
    Then I should see the "Merchant Cat. Group Maintenance" page

  Scenario: Add Merchant Category Group for deletion in iCore module
    Given I Click the "Add Merchant Cat. Group" icon
    And I should see the "Add Merchant Cat. Group" page
    And I fill "MCG Description"
      | field       | value   |
      | Description | 27MCGDEL |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Category Group Added successfully" in "Add Merchant Cat. Group"
    Then I call verify method
      | Alias | SQL                                                                                                       | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_GRP WHERE MCG_DES='27MCGDEL' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  1 |

  Scenario: Back to Merchant Category Group
    And I click on "Merchant Cat. Group Maintenance" icon to back
    Then I should see the "Merchant Cat. Group Maintenance" page

  Scenario: Delete Merchant Category Group in iCore module
    Given I Click the "Manage Merchant Cat. Group" icon
    And I should see the "Manage Merchant Cat. Group" page
    And I fill "MCG Description"
      | field   | value   |
      | GrpDesc | 27MCGDEL |
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Delete"
    And I Click on Button "Submit1"
    Then I Check for Error "Cannot delete this merchant category group, If you want to delete it delete assigned merchant category code first"
    Then I Check for Success Message "Merchant Category Group Deleted successfully" in "Manage Merchant Cat. Group"
    Then I call verify method
      | Alias | SQL                                                                                                       | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DR_MERC_CAT_GRP WHERE MCG_DES='27MCGDEL' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' |                  0 |

  Scenario: Back to Merchant Category Group
    And I click on "Merchant Cat. Group Maintenance" icon to back
    Then I should see the "Merchant Cat. Group Maintenance" page

  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page
