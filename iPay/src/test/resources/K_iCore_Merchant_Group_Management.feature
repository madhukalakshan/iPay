###############################################################################################################################################
#Merchant Group with name 30MERCGROUP will be created.
#Merchant Group with name 30MERCGROUPDEL , will be created to test Delte and Close function.
#Customer details will not be edited from iCore module, a complete customer is a prerequisite for Merchant Group creation.
###############################################################################################################################################
Feature: iCore Merchant Group Maintenance

  @MerGrp
  Scenario: Goto Merchant Group in iCore module
    Given I Click the "Merchant Management" icon to Merchant Group Management
    Then I should see the "Merchant Management" page to Merchant Group Management
    And I Click the "Merchant Group Management" icon
    Then I should see the "Merchant Group Management" page

  Scenario: Add Merchant Group in iCore module
    Given I Click the "Add Merchant Group" icon
    Then I should see the "Add Merchant Group" page
    And I fill the Merchant Group Details
      | field                  | value                   |
      | Description            | 30MERCGROUP              |
      | PERMNT_ADDR_TITLE      | Mr                      |
      | PERMNT_ADDR_NAME       | CUCUMBER TEST           |
      | PERMNT_ADDR_LINE_1     | Level 2                 |
      | PERMNT_ADDR_LINE_2     |                     240 |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLAND            |
      | PERMNT_ADDR_CITY       | CUCUMERCITY             |
      | PERMNT_ADDR_COUNTRY    | Nepal                   |
      | PERMNT_ADDR_POST_CODE  |                  910776 |
      | PERMNT_PHN_PHN_1       |                01134755 |
      | PERMNT_PHN_MOBILE_1    |              0703003344 |
      | PERMNT_PHN_FAX_1       |                01134755 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTEST@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                      |
      | BILLING_ADDR_NAME      | CUCUMBER TEST           |
      | BILLING_ADDR_LINE_1    | Level 2                 |
      | BILLING_ADDR_LINE_2    |                     240 |
      | BILLING_ADDR_LINE_3    | CUCUMBERLAND            |
      | BILLING_ADDR_CITY      | CUCUMERCITY             |
      | BILLING_ADDR_COUNTRY   | Nepal                   |
      | BILLING_ADDR_POST_CODE |                  910776 |
      | BILLING_PHN_PHN_1      |                01134755 |
      | BILLING_PHN_MOBILE_1   |              0703003344 |
      | BILLING_PHN_FAX_1      |                01134755 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTEST@MYMAIL.COM |
    And I Click on Button "Submit"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Group Added successfully" in "Add Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                    | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=5                                                                                                                     |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=5) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Reject Merchant group in Merchant group management
    Given I Click the "Approve Merchant Group" icon
    Then I should see the "Approve Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP [Pending]"
    Then I should see the "Approve Merchant Group" page
    And I Enter the Comment "Approve Merchant Group" in "Approve Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit2"
    Then I Check for Success Message "Merchant Group Rejected successfully" in "Approve Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                    | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=4                                                                                                                     |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=4) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Reapply Merchant group in Merchant group management
    Given I Click the "Reapply Merchant Group" icon
    Then I should see the "Reapply Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP [Rejected]"
    Then I should see the "Reapply Merchant Group" page
    And I Enter the Comment "Reapply Merchant Group" in "Reapply Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Group Reapplied successfully" in "Reapply Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                     | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=2                                                                                                                      |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=2 ) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Approve Reapplied Merchant group in Merchant group management
    Given I Click the "Approve Merchant Group" icon
    Then I should see the "Approve Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP [Reapplied]"
    Then I should see the "Approve Merchant Group" page
    And I Enter the Comment "Approve reapplied Merchant Group" in "Approve Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Group Approved successfully" in "Approve Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=1                                                                                                                    |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=1) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Modify Merchant group in Merchant group management
    Given I Click the "Modify Merchant Group" icon
    Then I should see the "Modify Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    Then I should see the "Modify Merchant Group" page
    And I fill the Modify Merchant Group Details
      | field                  | value                   |
      | PERMNT_ADDR_TITLE      | Mr                      |
      | PERMNT_ADDR_NAME       | CUCUMBER TEST           |
      | PERMNT_ADDR_LINE_1     | Level 2                 |
      | PERMNT_ADDR_LINE_2     |                     242 |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLAND            |
      | PERMNT_ADDR_CITY       | CUCUMERCITY             |
      | PERMNT_ADDR_COUNTRY    | Nepal                   |
      | PERMNT_ADDR_POST_CODE  |                  910776 |
      | PERMNT_PHN_PHN_1       |                01134755 |
      | PERMNT_PHN_MOBILE_1    |              0703003344 |
      | PERMNT_PHN_FAX_1       |                01134755 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTEST@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                      |
      | BILLING_ADDR_NAME      | CUCUMBER TEST           |
      | BILLING_ADDR_LINE_1    | Level 2                 |
      | BILLING_ADDR_LINE_2    |                     242 |
      | BILLING_ADDR_LINE_3    | CUCUMBERLAND            |
      | BILLING_ADDR_CITY      | CUCUMERCITY             |
      | BILLING_ADDR_COUNTRY   | Nepal                   |
      | BILLING_ADDR_POST_CODE |                  910776 |
      | BILLING_PHN_PHN_1      |                01134755 |
      | BILLING_PHN_MOBILE_1   |              0703003344 |
      | BILLING_PHN_FAX_1      |                01134755 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTEST@MYMAIL.COM |
    And I Enter the Comment "Modify Merchant Group" in "Modify Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Group edited successfully" in "Modify Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=3                                                                                                                    |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=3) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Approve Modify Merchant Group in Merchant group management
    Given I Click the "Approve Merchant Group" icon
    Then I should see the "Approve Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP [Modified]"
    Then I should see the "Approve Merchant Group" page
    And I Enter the Comment "Approve edited Merchant Group" in "Approve Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Group Approved successfully" in "Approve Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                    | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=1                                                                                                                     |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=1) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Suspend Merchant group in Merchant group management
    Given I Click the "Suspend Merchant Group" icon
    Then I should see the "Suspend Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    Then I should see the "Suspend Merchant Group" page
    And I should select the "suspend" reason in "Suspend Merchant Group"
      | field   | value |
      | RsnCode |     1 |
    And I Enter the Comment "Suspend Merchant Group" in "Suspend Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Error "Please select Reason"
    Then I Check for Success Message "Merchant Group Suspended successfully" in "Suspend Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                     | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=6                                                                                                                      |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=6) AND ADDED_BY='MADHUKA'   |                 24 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERCGRP' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' AND ATTR=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=6) |                  1 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Revoke Merchant group in Merchant group management
    Given I Click the "Revoke Merchant Group" icon
    Then I should see the "Revoke Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP [Suspended]"
    Then I should see the "Revoke Merchant Group" page
    And I Enter the Comment "Revoke Merchant Group" in "Revoke Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Group Revoked successfully" in "Revoke Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                     | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=7                                                                                                                      |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=7 ) AND ADDED_BY='MADHUKA' |                 24 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERCGRP' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' AND ATTR=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=7) |                  1 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Approve revoked Merchant group in Merchant group management
    Given I Click the "Approve Merchant Group" icon
    Then I should see the "Approve Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP [Revoked]"
    Then I should see the "Approve Merchant Group" page
    And I Enter the Comment "Approve revoked Merchant Group" in "Approve Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Group Approved successfully" in "Approve Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                     | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=1                                                                                                                      |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=1 ) AND ADDED_BY='MADHUKA' |                 24 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERCGRP' AND STATUS_CODE=1 AND ADDED_BY='MADHUKA' AND ATTR=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=1) |                  1 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Assign Merchant Cat. Group
    Given I Click the "Assign Merchant Cat. Group" icon
    Then I should see the "Assign Merchant Cat. Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    Then I should see the "Assign Merchant Cat. Group" page
    And I select item "27MCG"  of selectBox "cat_grp_not_given"
    And I Click on Button "Add"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=1                                                                                                   |                  1 |
      | ICORE | SELECT COUNT(*) FROM  BKN_DL_MERC_GRP_CAT_GRP WHERE  ADDED_BY='MADHUKA'  AND MERC_GRP_ID=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUP' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=1   ) |                  1 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: View Merchant group in Merchant group management
    Given I Click the "View Merchant Group" icon
    Then I should see the "View Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    Then I should see the "View Merchant Group" page

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Add Merchant Group to Close in iCore module
    Given I Click the "Add Merchant Group" icon
    Then I should see the "Add Merchant Group" page
    And I fill the Merchant Group Details
      | field                  | value                   |
      | Description            | 30MERCGROUPCLS           |
      | PERMNT_ADDR_TITLE      | Mr                      |
      | PERMNT_ADDR_NAME       | CUCUMBER TEST           |
      | PERMNT_ADDR_LINE_1     | Level 2                 |
      | PERMNT_ADDR_LINE_2     |                     240 |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLAND            |
      | PERMNT_ADDR_CITY       | CUCUMERCITY             |
      | PERMNT_ADDR_COUNTRY    | Nepal                   |
      | PERMNT_ADDR_POST_CODE  |                  910776 |
      | PERMNT_PHN_PHN_1       |                01134755 |
      | PERMNT_PHN_MOBILE_1    |              0703003344 |
      | PERMNT_PHN_FAX_1       |                01134755 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTEST@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                      |
      | BILLING_ADDR_NAME      | CUCUMBER TEST           |
      | BILLING_ADDR_LINE_1    | Level 2                 |
      | BILLING_ADDR_LINE_2    |                     240 |
      | BILLING_ADDR_LINE_3    | CUCUMBERLAND            |
      | BILLING_ADDR_CITY      | CUCUMERCITY             |
      | BILLING_ADDR_COUNTRY   | Nepal                   |
      | BILLING_ADDR_POST_CODE |                  910776 |
      | BILLING_PHN_PHN_1      |                01134755 |
      | BILLING_PHN_MOBILE_1   |              0703003344 |
      | BILLING_PHN_FAX_1      |                01134755 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTEST@MYMAIL.COM |
    And I Click on Button "Submit"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Group Added successfully" in "Add Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                      | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=5                                                                                                                    |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=5) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Close Merchant group in Merchant group management
    Given I Click the "Close Merchant Group" icon
    Then I should see the "Close Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value         |
      | Description | 30MERCGROUPCLS |
    Then I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUPCLS [Pending]"
    Then I should see the "Close Merchant Group" page
    And I should select the "close" reason in "Close Merchant Group"
      | field   | value |
      | RsnCode |     1 |
    And I Enter the Comment "Close Merchant Group" in "Close Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Error "Please select Reason"
    Then I Check for Success Message "Merchant Group Closed successfully" in "Close Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                       | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=15                                                                                                                    |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=15) AND ADDED_BY='MADHUKA' |                 24 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERCGRP'  AND ADDED_BY='MADHUKA' AND ATTR=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'AND STATUS_CODE=15)                 |                  1 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Approve pending close Merchant group in Merchant group management
    Given I Click the "Approve Merchant Group" icon
    Then I should see the "Approve Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value         |
      | Description | 30MERCGROUPCLS |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUPCLS [Pending Close]"
    Then I should see the "Approve Merchant Group" page
    And I Enter the Comment "Approve closed Merchant Group" in "Approve Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Group Approved successfully" in "Approve Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                       | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=8                                                                                                                     |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=8 ) AND ADDED_BY='MADHUKA' |                 24 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERCGRP'  AND ADDED_BY='MADHUKA' AND ATTR=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPCLS' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'AND STATUS_CODE=8)                  |                  1 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Add Merchant Group For delete in iCore module
    Given I Click the "Add Merchant Group" icon
    Then I should see the "Add Merchant Group" page
    And I fill the Merchant Group Details
      | field                  | value                   |
      | Description            | 30MERCGROUPDEL          |
      | PERMNT_ADDR_TITLE      | Mr                      |
      | PERMNT_ADDR_NAME       | CUCUMBER TEST           |
      | PERMNT_ADDR_LINE_1     | Level 2                 |
      | PERMNT_ADDR_LINE_2     |                     240 |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLAND            |
      | PERMNT_ADDR_CITY       | CUCUMERCITY             |
      | PERMNT_ADDR_COUNTRY    | Nepal                   |
      | PERMNT_ADDR_POST_CODE  |                  910776 |
      | PERMNT_PHN_PHN_1       |                01134755 |
      | PERMNT_PHN_MOBILE_1    |              0703003344 |
      | PERMNT_PHN_FAX_1       |                01134755 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTEST@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                      |
      | BILLING_ADDR_NAME      | CUCUMBER TEST           |
      | BILLING_ADDR_LINE_1    | Level 2                 |
      | BILLING_ADDR_LINE_2    |                     240 |
      | BILLING_ADDR_LINE_3    | CUCUMBERLAND            |
      | BILLING_ADDR_CITY      | CUCUMERCITY             |
      | BILLING_ADDR_COUNTRY   | Nepal                   |
      | BILLING_ADDR_POST_CODE |                  910776 |
      | BILLING_PHN_PHN_1      |                01134755 |
      | BILLING_PHN_MOBILE_1   |              0703003344 |
      | BILLING_PHN_FAX_1      |                01134755 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTEST@MYMAIL.COM |
    And I Click on Button "Submit"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Group Added successfully" in "Add Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                        | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPDEL' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE=5                                                                                                                      |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_MERC_GRP' AND CNCT_REF=(SELECT MERC_GRP_ID FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPDEL' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001'  AND STATUS_CODE=5 ) AND ADDED_BY='MADHUKA' |                 24 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Delete Merchant group in Merchant group management
    Given I Click the "Delete Merchant Group" icon
    Then I should see the "Delete Merchant Group" page
    And I fill Search Merchant Group Details
      | field       | value         |
      | Description | 30MERCGROUPDEL |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUPDEL [Pending]"
    Then I should see the "Delete Merchant Group" page
    And I Enter the Comment "Delete Merchant Group" in "Delete Merchant Group"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Group Deleted successfully" in "Delete Merchant Group"
    Then I call verify method
      | Alias | SQL                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC_GRP WHERE MERC_GRP_DES='30MERCGROUPDEL' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' |                  0 |

  Scenario: Back to Merchant Group Management
    And I click on "Merchant Group Management" icon to back
    Then I should see the "Merchant Group Management" page

  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page
