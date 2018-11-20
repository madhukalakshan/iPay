###############################################################################################################################################
# Merchant with name 30MERCHANT will be created.
# Merchant scheme with name 30MERCHANTCLS is created to close.
# Merchant scheme with name 30MERCHANTDEL is created for deletion.
# when tables belonging to different schemas are joined in verification sql need to hardcode the second schema in feture file
# in current featre file card schema has to be specified for table CRD_DR_DATE, current value is NIB_D_CRD.
###############################################################################################################################################
Feature: iCore Merchant Maintenance

  @Mer
  Scenario: Goto Merchant Management in iCore module
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page

  Scenario: Add Merchant in iCore module
    Given I Click the "Add Merchant" icon
    Then I should see the "Add Merchant" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    Then I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    And I should enter merchant details in "Add Merchant"
      | field       | value     |
      | CreOptId    | Auto      |
      | BrnchId     |     00000 |
      | Description | 30MERCHANT |
    #| selectedCurrencyCode |       524 |
    #And I Click on Add Account Button
    Then I should see the "Add Merchant" page
    And I modify merchant contact details for "iPay"
      | field                  | value                    |
      | PERMNT_ADDR_TITLE      | Mr                       |
      | PERMNT_ADDR_NAME       | CUCUMBER TESTA           |
      | PERMNT_ADDR_LINE_1     | Level 2A                 |
      | PERMNT_ADDR_LINE_2     | 240A                     |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLANDA            |
      | PERMNT_ADDR_CITY       | CUCUMERCITYA             |
      | PERMNT_ADDR_COUNTRY    | Nepal                    |
      | PERMNT_ADDR_POST_CODE  |                  9107769 |
      | PERMNT_PHN_PHN_1       |                011347559 |
      | PERMNT_PHN_MOBILE_1    |              07030033475 |
      | PERMNT_PHN_FAX_1       |                011347559 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTESTA@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                       |
      | BILLING_ADDR_NAME      | CUCUMBER TESTA           |
      | BILLING_ADDR_LINE_1    | Level 2A                 |
      | BILLING_ADDR_LINE_2    | 240A                     |
      | BILLING_ADDR_LINE_3    | CUCUMBERLANDA            |
      | BILLING_ADDR_CITY      | CUCUMERCITYA             |
      | BILLING_ADDR_COUNTRY   | Nepal                    |
      | BILLING_ADDR_POST_CODE |                  9107769 |
      | BILLING_PHN_PHN_1      |                011347559 |
      | BILLING_PHN_MOBILE_1   |              07030033475 |
      | BILLING_PHN_FAX_1      |                011347559 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTESTA@MYMAIL.COM |
    And I Click on Button "Submit"
    Then I Check for Error "Please Select"
    Then I Check for Error "Cannot be Blank"
    Then I should see the Success message as "Merchant Added successfully" for Merchant Added
    Then I retrive generated merchant id for "ADD"
      | field      | value                                       |
      | MerchantId | Merchant Added successfully, Merchant ID is |
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                              | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5                                                                                                                                                             |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5)                                               |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5 ) |                  3 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Approve Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Approve Merchant" page
    And I Enter the Comment "Approve Merchant" in "Approve Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Approved successfully" in "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                           |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1)                                                             |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 )          |                  3 |
      | ICORE | SELECT  COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE'  AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Edit Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Edit Merchant" icon
    Then I should see the "Edit Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    Then I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Edit Merchant" page
    And I modify merchant contact details for "iPay"
      | field                  | value                      |
      | PERMNT_ADDR_TITLE      | Mr                         |
      | PERMNT_ADDR_NAME       | CUCUMBER TESTABC           |
      | PERMNT_ADDR_LINE_1     | Level 2ABC                 |
      | PERMNT_ADDR_LINE_2     | 240ABC                     |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLANDABC            |
      | PERMNT_ADDR_CITY       | CUCUMERCITYABC             |
      | PERMNT_ADDR_COUNTRY    | Nepal                      |
      | PERMNT_ADDR_POST_CODE  |                  910776987 |
      | PERMNT_PHN_PHN_1       |                01134755987 |
      | PERMNT_PHN_MOBILE_1    |              0703003347587 |
      | PERMNT_PHN_FAX_1       |                01134755987 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTESTABC@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                         |
      | BILLING_ADDR_NAME      | CUCUMBER TESTABC           |
      | BILLING_ADDR_LINE_1    | Level 2ABC                 |
      | BILLING_ADDR_LINE_2    | 240ABC                     |
      | BILLING_ADDR_LINE_3    | CUCUMBERLANDABC            |
      | BILLING_ADDR_CITY      | CUCUMERCITYABC             |
      | BILLING_ADDR_COUNTRY   | Nepal                      |
      | BILLING_ADDR_POST_CODE |                  910776987 |
      | BILLING_PHN_PHN_1      |                01134755987 |
      | BILLING_PHN_MOBILE_1   |              0703003347587 |
      | BILLING_PHN_FAX_1      |                01134755987 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTESTABC@MYMAIL.COM |
    And I Enter the Comment "Edit Merchant" in "Edit Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant edited successfully" in "Edit Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                           | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=3                                                                                                                                                                          |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=3)                                                            |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=3 )          |                  3 |
      | ICORE | SELECT  COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE' AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=3) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Reject Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field       | value       |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Approve Merchant" page
    And I Enter the Comment "Reject Merchant" in "Approve Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit2"
    Then I Check for Success Message "Merchant Rejected successfully" in "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                               | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=4                                                                                                                                                              |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=4)                                                |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND ADDED_BY='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=4 ) |                  3 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Reapply Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Reapply Merchant" icon
    Then I should see the "Reapply Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    Then I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Reapply Merchant" page
    And I modify merchant contact details for "iPay"
      | field                  | value                     |
      | PERMNT_ADDR_TITLE      | Mr                        |
      | PERMNT_ADDR_NAME       | CUCUMBER TESTAB           |
      | PERMNT_ADDR_LINE_1     | Level 2AB                 |
      | PERMNT_ADDR_LINE_2     | 240AB                     |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLANDAB            |
      | PERMNT_ADDR_CITY       | CUCUMERCITYAB             |
      | PERMNT_ADDR_COUNTRY    | Nepal                     |
      | PERMNT_ADDR_POST_CODE  |                  91077698 |
      | PERMNT_PHN_PHN_1       |                0113475598 |
      | PERMNT_PHN_MOBILE_1    |              070300334758 |
      | PERMNT_PHN_FAX_1       |                0113475598 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTESTAB@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                        |
      | BILLING_ADDR_NAME      | CUCUMBER TESTAB           |
      | BILLING_ADDR_LINE_1    | Level 2AB                 |
      | BILLING_ADDR_LINE_2    | 240AB                     |
      | BILLING_ADDR_LINE_3    | CUCUMBERLANDAB            |
      | BILLING_ADDR_CITY      | CUCUMERCITYAB             |
      | BILLING_ADDR_COUNTRY   | Nepal                     |
      | BILLING_ADDR_POST_CODE |                  91077698 |
      | BILLING_PHN_PHN_1      |                0113475598 |
      | BILLING_PHN_MOBILE_1   |              070300334758 |
      | BILLING_PHN_FAX_1      |                0113475598 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTESTAB@MYMAIL.COM |
    And I Enter the Comment "Reapply Merchant" in "Reapply Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Reapplied successfully" in "Reapply Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=2                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=2)                                                    |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=2 ) |                  3 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Approve Reapplied Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Approve Merchant" page
    And I Enter the Comment "Approve reapplied Merchant" in "Approve Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Approved successfully" in "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                           |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1)                                                             |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 )          |                  3 |
      | ICORE | SELECT  COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE'  AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Suspend Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Suspend Merchant" icon
    Then I should see the "Suspend Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Suspend"
    Then I should see the "Suspend Merchant" page
    And I should select the "suspend" reason in "Suspend Merchant"
      | field   | value |
      | RsnCode |     1 |
    And I Enter the Comment "Suspend Merchant" in "Suspend Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Suspended successfully" in "Suspend Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=6                                                                                                                                                                           |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=6)                                                             |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=6 )          |                  3 |
      | ICORE | SELECT  COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE'  AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=6) |                  1 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERC' AND ADDED_BY='MADHUKA'AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA'AND STATUS_CODE=6 )                                                                              |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Revoke Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Revoke Merchant" icon
    Then I should see the "Revoke Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Revoke Merchant" page
    And I Enter the Comment "Revoke Merchant" in "Revoke Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Revoked successfully" in "Revoke Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                           | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=7                                                                                                                                                                          |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=7)                                                            |                 24 |
      | ICORE | SELECT COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=7 )          |                  3 |
      | ICORE | SELECT COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE'  AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=7) |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERC' AND ADDED_BY='MADHUKA'AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA'AND STATUS_CODE=7 )                                                                              |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Approve revoked Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Approve Merchant" page
    And I Enter the Comment "Approve revoked Merchant" in "Approve Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Approved successfully" in "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                            | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                           |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1)                                                             |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND MODIFIED_BY ='MADHUKA' AND STATUS_CODE=1  AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 )          |                  3 |
      | ICORE | SELECT  COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE'  AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1) |                  1 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERC' AND ADDED_BY='MADHUKA'AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA'AND STATUS_CODE=1 )                                                                              |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Assign Merchant Cat. Group
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Assign Merchant Cat. Group" icon in Merchant Management
    Then I should see the "Assign Merchant Cat. Group" page in Merchant Management
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Assign Merchant Cat. Group" page in Merchant Management
    And I select item "27MCG"  of selectBox "cat_grp_not_given"
    And I Click on Button "Add"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                            | Expected Row Count |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MERC_CAT_GRP_MERC WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 ) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  #Scenario: Assign Merchant Scheme
    #Given I Click the "Merchant Management" icon
    #Then I should see the "Merchant Management" page
    #And I Click the "Assign Merchant Scheme" icon
    #Then I should see the "Assign Merchant Scheme" page
    #And I fill the Merchant Details
      #| field       | value      |
      #| Description | 30MERCGROUP |
      #| MercDesc    | 30MERCHANT  |
    #And I Click on Button "Submit"
    #Then I Check if Merchant exists
    #And I click the link "Details"
    #And I select item "31SCHEME"  of selectBox "scma_not_given"
    #And I Click on Button "Add"
    #Then I call verify method
      #| Alias | SQL                                                                                                                                                                                                            | Expected Row Count |
      #| ICORE | SELECT  COUNT(*) FROM BKN_DL_MERC_CAT_GRP_MERC WHERE  ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 ) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: View Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "View Merchant" icon
    Then I should see the "View Merchant" page
    And I fill the Merchant Details
      | field       | value      |
      | Description | 30MERCGROUP |
      | MercDesc    | 30MERCHANT  |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "View Merchant" page
    #Then I call verify method
      #| Alias | SQL                                                                                                                                                                                   | Expected Row Count |
      #| ICORE | SELECT  COUNT(*) FROM BKN_DL_MERC_SCMA WHERE  ADDED_BY='MADHUKA' AND MERC_ID= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANT' AND ADDED_BY='MADHUKA'  AND STATUS_CODE=1 ) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Add Merchant to close in iCore module
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Add Merchant" icon
    Then I should see the "Add Merchant" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    And I should enter merchant details in "Add Merchant"
      | field       | value        |
      | CreOptId    | Auto         |
      | BrnchId     |        00000 |
      | Description | 30MERCHANTCLS |
    #| selectedCurrencyCode |          524 |
    #And I Click on Add Account Button
    Then I should see the "Add Merchant" page
    And I modify merchant contact details for "iPay"
      | field                  | value                    |
      | PERMNT_ADDR_TITLE      | Mr                       |
      | PERMNT_ADDR_NAME       | CUCUMBER TESTA           |
      | PERMNT_ADDR_LINE_1     | Level 2A                 |
      | PERMNT_ADDR_LINE_2     | 240A                     |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLANDA            |
      | PERMNT_ADDR_CITY       | CUCUMERCITYA             |
      | PERMNT_ADDR_COUNTRY    | Nepal                    |
      | PERMNT_ADDR_POST_CODE  |                  9107769 |
      | PERMNT_PHN_PHN_1       |                011347559 |
      | PERMNT_PHN_MOBILE_1    |              07030033475 |
      | PERMNT_PHN_FAX_1       |                011347559 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTESTA@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                       |
      | BILLING_ADDR_NAME      | CUCUMBER TESTA           |
      | BILLING_ADDR_LINE_1    | Level 2A                 |
      | BILLING_ADDR_LINE_2    | 240A                     |
      | BILLING_ADDR_LINE_3    | CUCUMBERLANDA            |
      | BILLING_ADDR_CITY      | CUCUMERCITYA             |
      | BILLING_ADDR_COUNTRY   | Nepal                    |
      | BILLING_ADDR_POST_CODE |                  9107769 |
      | BILLING_PHN_PHN_1      |                011347559 |
      | BILLING_PHN_MOBILE_1   |              07030033475 |
      | BILLING_PHN_FAX_1      |                011347559 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTESTA@MYMAIL.COM |
    And I Click on Button "Submit"
    Then I Check for Error "Please Select"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Added successfully" in "Add Merchant"
    And I retrive generated merchant id for "ADD"
      | field      | value                                       |
      | MerchantId | Merchant Added successfully, Merchant ID is |
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5                                                                                                                                                             |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5)                                               |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5 ) |                  3 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Close Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Close Merchant" icon
    Then I should see the "Close Merchant" page
    And I fill the Merchant Details
      | field       | value        |
      | Description | 30MERCGROUP   |
      | MercDesc    | 30MERCHANTCLS |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Close"
    Then I should see the "Close Merchant" page
    And I should select the "close" reason in "Close Merchant"
      | field   | value |
      | RsnCode |     1 |
    And I Enter the Comment "Close Merchant" in "Close Merchant"
      | Element | Option |
      | Comment | id     |
    Then I Click on Button "Submit1"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                  | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=15                                                                                                                                                             |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=15)                                               |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=15 ) |                  3 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERC' AND ADDED_BY='MADHUKA'AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA'AND STATUS_CODE=15 )                                                                |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Approve pending close Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field       | value        |
      | Description | 30MERCGROUP   |
      | MercDesc    | 30MERCHANTCLS |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Approve Merchant" page
    And I Enter the Comment "Approve closed Merchant" in "Approve Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Merchant Approved successfully" in "Approve Merchant"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                               | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=8                                                                                                                                                                           |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=8)                                                             |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=8 )               |                  3 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DX_MERC_RSN WHERE ATTR_TYP='MERC' AND ADDED_BY='MADHUKA'AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA'AND STATUS_CODE=8 )                                                                              |                  1 |
      | ICORE | SELECT  COUNT(*) FROM NIB_D_CRD.CRD_DR_DATE WHERE REF_GRP='STMT_DATE'  AND STATUS_CODE=1  AND REF_TYP ='MERCHANT'  AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND REF_VAL= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTCLS' AND ADDED_BY='MADHUKA' AND STATUS_CODE=8) |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Add Merchant for deletion in iCore module
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Add Merchant" icon
    Then I should see the "Add Merchant" page
    And I fill Search Merchant Group Details
      | field       | value      |
      | Description | 30MERCGROUP |
    And I Click on Button "Submit"
    And I Click on the tree item link "30MERCGROUP"
    And I should enter merchant details in "Add Merchant"
      | field       | value        |
      | CreOptId    | Auto         |
      | BrnchId     |        00000 |
      | Description | 30MERCHANTDEL |
    #| selectedCurrencyCode |          524 |
    #And I Click on Add Account Button
    Then I should see the "Add Merchant" page
    And I modify merchant contact details for "iPay"
      | field                  | value                    |
      | PERMNT_ADDR_TITLE      | Mr                       |
      | PERMNT_ADDR_NAME       | CUCUMBER TESTA           |
      | PERMNT_ADDR_LINE_1     | Level 2A                 |
      | PERMNT_ADDR_LINE_2     | 240A                     |
      | PERMNT_ADDR_LINE_3     | CUCUMBERLANDA            |
      | PERMNT_ADDR_CITY       | CUCUMERCITYA             |
      | PERMNT_ADDR_COUNTRY    | Nepal                    |
      | PERMNT_ADDR_POST_CODE  |                  9107769 |
      | PERMNT_PHN_PHN_1       |                011347559 |
      | PERMNT_PHN_MOBILE_1    |              07030033475 |
      | PERMNT_PHN_FAX_1       |                011347559 |
      | PERMNT_ADDR_EMAIL_1    | CUCUMBERTESTA@MYMAIL.COM |
      | BILLING_ADDR_TITLE     | Mr                       |
      | BILLING_ADDR_NAME      | CUCUMBER TESTA           |
      | BILLING_ADDR_LINE_1    | Level 2A                 |
      | BILLING_ADDR_LINE_2    | 240A                     |
      | BILLING_ADDR_LINE_3    | CUCUMBERLANDA            |
      | BILLING_ADDR_CITY      | CUCUMERCITYA             |
      | BILLING_ADDR_COUNTRY   | Nepal                    |
      | BILLING_ADDR_POST_CODE |                  9107769 |
      | BILLING_PHN_PHN_1      |                011347559 |
      | BILLING_PHN_MOBILE_1   |              07030033475 |
      | BILLING_PHN_FAX_1      |                011347559 |
      | BILLING_ADDR_EMAIL_1   | CUCUMBERTESTA@MYMAIL.COM |
    And I Click on Button "Submit"
    Then I Check for Error "Please Select"
    Then I Check for Error "Cannot be Blank"
    Then I Check for Success Message "Merchant Added successfully" in "Add Merchant"
    Then I retrive generated merchant id for "ADD"
      | field      | value                                       |
      | MerchantId | Merchant Added successfully, Merchant ID is |
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTDEL' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5                                                                                                                                                             |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET  WHERE CNCT_LNK_TBL='BKN_DM_MERC'  AND ADDED_BY='MADHUKA'AND CNCT_REF =( SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTDEL' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5)                                               |                 24 |
      | ICORE | SELECT  COUNT(*) FROM BKN_DL_MISC_TO_ACCT WHERE  ATTR_TYP='MERC' AND LINK_TYP IN ('CHG','MERC','CMSN') AND ADDED_BY='MADHUKA' AND STATUS_CODE=1 AND ATTR= (SELECT MERC_ID FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTDEL' AND ADDED_BY='MADHUKA' AND STATUS_CODE=5 ) |                  3 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Delete Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Delete Merchant" icon
    Then I should see the "Delete Merchant" page
    And I fill the Merchant Details
      | field       | value         |
      | Description | 30MERCGROUP   |
      | MercDesc    | 30MERCHANTDEL |
    And I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Delete Merchant" page
    And I Enter the Comment "Delete Merchant" in "Delete Merchant"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I call verify method
      | Alias | SQL                                                                                   | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='30MERCHANTDEL' AND ADDED_BY='MADHUKA' |                  0 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page
