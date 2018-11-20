###############################################################################################################################################
# POS Terminal with TermId 90019959 will be created.
# POS Terminal with TermId 60019958 is created for deletion.
# POS Terminal with TermId 69019982 is created for Onboard Merchant
###############################################################################################################################################
Feature: Testing iAdmin POS Terminal Management Functionalites

  @POSTerminalMgmt
  Scenario: Navigate to Pos Terminal
    Given I am at "iAdmin" Home Page
    Then I should see "iAdmin" Home Page
    Given I Click the "Maintainance" icon to "POS Terminal Management"
    Then I should see the "Maintainance" page to "POS Terminal Management"
    And I Click the "POS Terminal Management" icon
    Then I should see the "POS Terminal Management" page

  Scenario: Create Pos Terminal
    Given I Click the "Add POS Terminal" icon
    Then I should see the "Add POS Terminal" page
    And I fill the Pos Creation form
      | field          | value             |
      | TermId         |          90019959 |
      | Description    | CucumberTest      |
      | TermLoc        |                 1 |
      | TermTyp        | Purchase          |
      | TermTypChannel |                06 |
      | TermModel      | West Int Terminal |
      | BrnchId        |             00000 |
      | CurrId         |               524 |
      | IPAddr1        |               192 |
      | IPAddr2        |               168 |
      | IPAddr3        |                23 |
      | IPAddr4        |               103 |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS Terminal Added successfully" in "Add POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 15 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Approve Pos Terminal (Action Reject)
    Given I Click the "Approve POS Terminal" icon
    Then I should see the "Approve POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Approve POS Terminal" page
    And I click the link "Details"
    Then I should see the "Approve POS Terminal" page
    And I Enter the Comment "Reject" in "Approve POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit2"
    Then I Check for Success Message "POS Rejected successfully" in "Approve POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 14 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Reapply Pos Terminal
    Given I Click the "Reapply POS Terminal" icon
    Then I should see the "Reapply POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Reapply POS Terminal" page
    And I click the link "Details"
    Then I should see the "Reapply POS Terminal" page
    And I fill the Pos Edit form
      | field       | value             |
      | Description | TestChanged       |
      | TermLoc     |                 1 |
      | TermTyp     | Purchase          |
      | TermModel   | West Int Terminal |
      | BrnchId     |             00000 |
      | CurrId      |               524 |
      | IPAddr1     |               191 |
      | IPAddr2     |               167 |
      | IPAddr3     |                22 |
      | IPAddr4     |               102 |
    And I Enter the Comment "Reapply POS" in "Reapply POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS reapplied successfully" in "Reapply POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 12 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Approve Pos Terminal (Action Approve)
    Given I Click the "Approve POS Terminal" icon
    Then I should see the "Approve POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Approve POS Terminal" page
    And I click the link "Details"
    Then I should see the "Approve POS Terminal" page
    And I Enter the Comment "Approve POS" in "Approve POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Successfully Approved the POS Terminal" in "Approve POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 11 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Edit Pos Terminal
    Given I Click the "Edit POS Terminal" icon
    Then I should see the "Edit POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Edit POS Terminal" page
    And I click the link "Details"
    Then I should see the "Edit POS Terminal" page
    And I fill the Pos Edit form
      | field       | value             |
      | Description | Testedit          |
      | TermLoc     |                 1 |
      | TermTyp     | Purchase          |
      | TermModel   | West Int Terminal |
      | BrnchId     |             00000 |
      | CurrId      |               524 |
      | IPAddr1     |               192 |
      | IPAddr2     |               168 |
      | IPAddr3     |                23 |
      | IPAddr4     |               103 |
    And I Enter the Comment "Edit POS" in "Edit POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS modified successfully" in "Edit POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 13 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Approve Pos Terminal (Action Edit Approve)
    Given I Click the "Approve POS Terminal" icon
    Then I should see the "Approve POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Approve POS Terminal" page
    And I click the link "Details"
    Then I should see the "Approve POS Terminal" page
    And I Enter the Comment "Approve POS" in "Approve POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Successfully Approved the POS Terminal" in "Approve POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 11 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Suspend Pos Terminal
    Given I Click the "Suspend POS Terminal" icon
    Then I should see the "Suspend POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Suspend POS Terminal" page
    And I click the link "Details"
    Then I should see the "Suspend POS Terminal" page
    And I Enter the Comment "Suspend POS" in "Suspend POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS Suspended successfully" in "Suspend POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 16 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Revoke Pos Terminal
    Given I Click the "Revoke POS Terminal" icon
    Then I should see the "Revoke POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Revoke POS Terminal" page
    And I click the link "Details"
    Then I should see the "Revoke POS Terminal" page
    And I Enter the Comment "Revoke POS" in "Revoke POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS Revoked successfully" in "Revoke POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 17 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Approve Pos Terminal (Action Revoke Approve)
    Given I Click the "Approve POS Terminal" icon
    Then I should see the "Approve POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "Approve POS Terminal" page
    And I click the link "Details"
    Then I should see the "Approve POS Terminal" page
    And I Enter the Comment "Approve revoked POS" in "Approve POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Successfully Approved the POS Terminal" in "Approve POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '90019959' and bank_code = '0001' and status_code = 11 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: View Pos Terminal
    Given I Click the "View POS Terminal" icon
    Then I should see the "View POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 90019959 |
    And I Click on Button "Submit"
    Then I should see the "View POS Terminal" page
    And I click the link "Details"
    Then I should see the "View POS Terminal" page

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Create Pos Terminal(Action Deletion)
    Given I Click the "Add POS Terminal" icon
    Then I should see the "Add POS Terminal" page
    And I fill the Pos Creation form
      | field          | value             |
      | TermId         |          60019958 |
      | Description    | DeletionTest      |
      | TermLoc        |                 1 |
      | TermTyp        | Purchase          |
      | TermTypChannel |                06 |
      | TermModel      | West Int Terminal |
      | BrnchId        |             00000 |
      | CurrId         |               524 |
      | IPAddr1        |               192 |
      | IPAddr2        |               168 |
      | IPAddr3        |                23 |
      | IPAddr4        |               103 |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS Terminal Added successfully" in "Add POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '60019958' and bank_code = '0001' and status_code = 15 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Delete Pos Terminal
    Given I Click the "Delete POS Terminal" icon
    Then I should see the "Delete POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 60019958 |
    And I Click on Button "Submit"
    Then I should see the "Delete POS Terminal" page
    And I click the link "Details"
    Then I should see the "Delete POS Terminal" page
    And I Enter the Comment "Delete POS" in "Delete POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS Deleted successfully" in "Delete POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                    | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '60019958' and bank_code = '0001' and status_code = 9 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Create Pos Terminal(IPay Merchant Onbording)
    Given I Click the "Add POS Terminal" icon
    Then I should see the "Add POS Terminal" page
    And I fill the Pos Creation form
      | field          | value             |
      | TermId         |          69019982 |
      | Description    | OnboardingTest    |
      | TermLoc        |                 1 |
      | TermTyp        | Purchase          |
      | TermTypChannel |                06 |
      | TermModel      | West Int Terminal |
      | BrnchId        |             00000 |
      | CurrId         |               524 |
      | IPAddr1        |               192 |
      | IPAddr2        |               168 |
      | IPAddr3        |                23 |
      | IPAddr4        |               103 |
    And I Click on Button "Submit"
    Then I Check for Success Message "POS Terminal Added successfully" in "Add POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '69019982' and bank_code = '0001' and status_code = 15 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Approve Pos Terminal (IPay Merchant Onbording)
    Given I Click the "Approve POS Terminal" icon
    Then I should see the "Approve POS Terminal" page
    And I fill the POS Search form
      | field  | value    |
      | TermId | 69019982 |
    And I Click on Button "Submit"
    Then I should see the "Approve POS Terminal" page
    And I click the link "Details"
    Then I should see the "Approve POS Terminal" page
    And I Enter the Comment "Approve POS" in "Approve POS Terminal"
      | Element | Option |
      | Comment | name   |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Successfully Approved the POS Terminal" in "Approve POS Terminal"
    Then I call verify method
      | Alias   | SQL                                                                                                     | Expected Row Count |
      | ISWITCH | select count(*) from swt_dr_term where term_id = '69019982' and bank_code = '0001' and status_code = 11 |                  1 |

  Scenario: Back to POS Terminal Management
    And I click on "POS Terminal Management" icon to back
    Then I should see the "POS Terminal Management" page

  Scenario: Moving to iAdmin Home Menu
    Given I click on Home Page
    Then I should see "iAdmin" Home Page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page
