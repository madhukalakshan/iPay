###############################################################################################################################################
# Dependancies to create a terminal link:
# 1-Merchant Category groups assigned for selcted merchant should have Merchant Category codes assigned.
# 2-There should be unlinked active terminals to create a terminal link.
# 3-There should be active Merchant Accounts and Merchant Commision Accoutns to create a terminal link.
###############################################################################################################################################
Feature: iCore Terminal Management

  @iCoreTerMgmt
  Scenario: Go to Link Terminal in iCore module
    Given I Click the "Merchant Management" icon to Terminal Management
    Then I should see the "Merchant Management" page to Terminal Management
    And I Click the "Terminal Management" icon
    Then I should see the "Terminal Management" page

  Scenario: Add  Link Terminal in iCore module
    Given I Click the "Link Merchant Terminal" icon
    Then I should see the "Link Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Link Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Link Merchant Terminal" page
    And I should enter Merchant Terminal Details
      | field   | value    |
      | TermId  | 90019959 |
      | CatCode |        1 |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Terminal Added successfully" in "Link Merchant Terminal"
    Then I retrive generated TeminalLinkID
      | field   | value                                                         |
      | vTermId | Merchant Terminal Added successfully, Merchant Terminal ID is |
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=5 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Reject Link Terminal to Delete
    Given I Click the "Approve Merchant Terminal" icon
    Then I should see the "Approve Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Approve Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Approve Merchant Terminal" page
    And I Enter the Comment "Reject Merchant Terminal" in "Approve Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit2"
    Then I Check for Success Message "Merchant Terminal Rejected successfully" in "Approve Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=4 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Delete Link Terminal
    Given I Click the "Delete Merchant Terminal" icon
    Then I should see the "Delete Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Delete Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Delete Merchant Terminal" page
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Terminal Deleted successfully" in "Delete Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=5 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  0 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  0 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                  0 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Add  Link Terminal again in iCore module
    Given I Click the "Link Merchant Terminal" icon
    Then I should see the "Link Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Link Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Link Merchant Terminal" page
    And I should enter Merchant Terminal Details
      | field   | value    |
      | TermId  | 90019959 |
      | CatCode |        1 |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Terminal Added successfully" in "Link Merchant Terminal"
    Then I retrive generated TeminalLinkID
      | field   | value                                                         |
      | vTermId | Merchant Terminal Added successfully, Merchant Terminal ID is |
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=5 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Close Link Terminal
    Given I Click the "Close Merchant Terminal" icon
    Then I should see the "Close Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Close Merchant Terminal" page
    Then I click the link "Close"
    Then I should see the "Close Merchant Terminal" page
    When I Select terminal closure reason Icon
      | field   | value |
      | RsnCode |     1 |
    And I Enter the Comment "Close Merchant Terminal" in "Close Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Terminal Closed successfully" in "Close Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=15 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                   |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                            |                 12 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ACTN_TYP='8' AND ATTR_TYP='TERM' AND ADDED_BY='MADHUKA' AND ATTR='90019959'                                                                                |                  1 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Reject Link Terminal
    Given I Click the "Approve Merchant Terminal" icon
    Then I should see the "Approve Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Approve Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Approve Merchant Terminal" page
    And I Enter the Comment "Reject Merchant Terminal" in "Approve Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit2"
    Then I Check for Success Message "Merchant Terminal Rejected successfully" in "Approve Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=4 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Reapply Link Terminal
    Given I Click the "Reapply Merchant Terminal" icon
    Then I should see the "Reapply Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Reapply Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Reapply Merchant Terminal" page
    And I should enter Terminal Reapply Details
      | field   | value |
      | CatCode |     1 |
    And I Enter the Comment "Reapply Merchant Terminal" in "Reapply Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Terminal Reapplied successfully" in "Reapply Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=2 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Approve reapplied Link Terminal
    Given I Click the "Approve Merchant Terminal" icon
    Then I should see the "Approve Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Approve Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Approve Merchant Terminal" page
    And I Enter the Comment "Approve reapplied Merchant Terminal" in "Approve Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Terminal Approved successfully" in "Approve Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Edit Link Terminal
    Given I Click the "Modify Merchant Terminal" icon
    Then I should see the "Modify Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Modify Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Modify Merchant Terminal" page
    And I should enter Terminal Edit Details
      | field   | value |
      | CatCode |     1 |
    And I Enter the Comment "Edit Merchant Terminal" in "Modify Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Terminal edited successfully" in "Modify Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=3 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Approve edit Link Terminal
    Given I Click the "Approve Merchant Terminal" icon
    Then I should see the "Approve Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Approve Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Approve Merchant Terminal" page
    And I Enter the Comment "Approve edited Merchant Terminal" in "Approve Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Terminal Approved successfully" in "Approve Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Suspend Link Terminal
    Given I Click the "Suspend Merchant Terminal" icon
    Then I should see the "Suspend Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Suspend Merchant Terminal" page
    Then I click the link "Suspend"
    Then I should see the "Suspend Merchant Terminal" page
    When I Select terminal suspension reason Icon
      | field   | value |
      | RsnCode |     1 |
    And I Enter the Comment "Suspend Merchant Terminal" in "Suspend Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Terminal Suspended successfully" in "Suspend Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=6 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ACTN_TYP='6' AND ATTR_TYP='TERM' AND ADDED_BY='MADHUKA' AND ATTR='90019959'                                                                               |                  1 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Revoke Link Terminal
    Given I Click the "Revoke Merchant Terminal" icon
    Then I should see the "Revoke Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Revoke Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Revoke Merchant Terminal" page
    And I Enter the Comment "Revoke Merchant Terminal" in "Revoke Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit"
    Then I Check for Success Message "Merchant Terminal Revoked successfully" in "Revoke Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=7 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ACTN_TYP='6' AND ATTR_TYP='TERM' AND ADDED_BY='MADHUKA' AND ATTR='90019959'                                                                               |                  1 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Approve revoked Link Terminal
    Given I Click the "Approve Merchant Terminal" icon
    Then I should see the "Approve Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "Approve Merchant Terminal" page
    And I click the link "Details"
    Then I should see the "Approve Merchant Terminal" page
    And I Enter the Comment "Approve revoked Merchant Terminal" in "Approve Merchant Terminal"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Terminal Approved successfully" in "Approve Merchant Terminal"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_TERM WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='TERM' AND  LINK_TYP IN ('CHG','TERM','CMSN') AND MODIFIED_BY='MADHUKA' AND ATTR='90019959'                                                  |                  3 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC_TERM' AND ADDED_BY='MADHUKA' AND CNCT_REF='90019959'                                                                           |                 12 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ACTN_TYP='6' AND ATTR_TYP='TERM' AND ADDED_BY='MADHUKA' AND ATTR='90019959'                                                                               |                  1 |

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: View Link Terminal
    Given I Click the "View Merchant Terminal" icon
    Then I should see the "View Merchant Terminal" page
    And I fill Link Terminal search Page
      | field    | value     |
      | MercDesc | 30MERCHANT |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    Then I should see the "View Merchant Terminal" page
    And I click the link "Details"

  Scenario: Back to Terminal Management
    And I click on "Terminal Management" icon to back
    Then I should see the "Terminal Management" page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page

  Scenario: Logout from merchant application
    And I click on "Log Out" button in "Add Merchant API Details"
      | Element                          | option |
      | //div[contains(text(),'Logout')] | xpath  |
    And I close the console
