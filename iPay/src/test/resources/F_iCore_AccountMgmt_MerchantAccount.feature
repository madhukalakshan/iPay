###############################################################################################################################################
#Input values for Account Management Scenarios are taken/ignored by checking below conditions in the stated order
# PrdTyp and BrnchId are dependencies for account creation
# As per the below file product type 30MERACCUC should be in active state for this feature file to succeed.
###############################################################################################################################################
Feature: iCore Account Management(Merchant Account)

  @MerAcc
  Scenario: Goto Account Management menu in iCore module
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Account Management" icon
    Then I should see the "Account Management" page

  Scenario: Create Account in iCore module
    Given I Click the "Add Account" icon
    Then I should see the "Add Account" page
    And I fill the account Creation form for Account Type "MERC"
      | field             | value          |
      | PrdTyp            | 30MERACCUC     |
      | BrnchId           |          00000 |
      | AutoSetlTyp       | M_F_AMNT       |
      | CoreAcct          |      123475824 |
      | ACCT_CNCT_NAME    | madhuka        |
      | ACCT_CNCT_LINE_1  | add one        |
      | ACCT_CNCT_COUNTRY | Hong Kong      |
      | ACCT_CNCT_EMAIL_1 | madhuka@ib.com |
      | ACCT_BILL_NAME    | madhuka        |
      | ACCT_BILL_LINE_1  | Bill address   |
      | ACCT_BILL_COUNTRY | Hong Kong      |
      | ACCT_BILL_EMAIL_1 | madhuka@ib.com |
    And I Click on Button "Submit"
    Then I should see the Success message as "Account Added successfully" for Merchant Account Added
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "5"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Reject Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Approve Account" icon
    Then I should see the "Approve Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account" page
    And I Enter the Comment "Reject Account" in "Approve Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit2"
    Then I Check for Success Message "Account Rejected successfully" in "Approve Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "4"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: ReApply Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Reapply Account" icon
    Then I should see the "Reapply Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Reapply Account" page
    And I fill ReApply Account  edit form
      | field          | value    |
      | ACCT_CNCT_NAME | madhukaa |
    And I Enter the Comment "Reapply Account" in "Reapply Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Reapplied successfully" in "Reapply Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "2"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Approve reapplied Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Approve Account" icon
    Then I should see the "Approve Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account" page
    And I Enter the Comment "Approve reapplied Account" in "Approve Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Approved successfully" in "Approve Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "1"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Edit Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Edit Account" icon
    Then I should see the "Edit Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Edit Account" page
    And I Enter the Comment "Edit Account" in "Edit Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Modified successfully" in "Edit Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "3"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Approve Account Edit
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Approve Account" icon
    Then I should see the "Approve Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account" page
    And I Enter the Comment "Approve edited Account" in "Approve Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Approved successfully" in "Approve Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "1"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Suspend Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Suspend Account" icon
    Then I should see the "Suspend Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Suspend Account" page
    And I Enter the Comment "Suspend Account" in "Suspend Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Suspended successfully" in "Suspend Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "6"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Revoke Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Revoke Account" icon
    Then I should see the "Revoke Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Revoke Account" page
    And I Enter the Comment "Revoke Account" in "Revoke Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Revoked successfully" in "Revoke Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "7"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Approve Revoked Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "Approve Account" icon
    Then I should see the "Approve Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"
    Then I should see the "Approve Account" page
    And I Enter the Comment "Approve revoked Account" in "Approve Account"
      | Element | Option |
      | Comment | id     |
    And I Click on Button "Submit1"
    Then I Check for Success Message "Account Approved successfully" in "Approve Account"
    Then I call verify method
      | Alias | SQL                                                                                                                                                                                                                                                                                 | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA' AND STATUS_CODE=1                                                                                                                                                                  |                  1 |
      | ICORE | SELECT COUNT(*) FROM BKN_DP_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_CNCT_DET WHERE CNCT_LNK_TBL='BKN_DM_ACCT' AND CNCT_REF = (SELECT TRIM (BOTH ' ' from TO_CHAR(ACCOUNT_SERIAL_NUMBER, '9999999999999999999999')) FROM BKN_DM_ACCT_PROF WHERE PRDUCT_TYPE_ID ='30MERACCUC' and  ADDED_BY='MADHUKA') AND ADDED_BY='MADHUKA' |                  8 |
    Then I verify "Merchant Account" status "1"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: View Account
    Given I Click the "Account Management" icon
    Then I should see the "Account Management" page
    And I Click the "View Account" icon
    Then I should see the "View Account" page
    And I fill Merchant Account to Account Number TextBox
    And I Click on Button "Submit"
    Then I check whether No Records Found
    And I click the link "Details"

  Scenario: Back to Account Management
    And I click on "Account Management" icon to back
    Then I should see the "Account Management" page

  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page
