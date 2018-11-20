Feature: iCore Merchant Management for created merchant by Onboarding

  @OnboardingMerMgmt
  Scenario: Navigate to iPay Home Page
    Given I am at "IAdmin" Login page to "Merchant Management"
    And I "fill" data criteria of "Login to Merchant Management"
      | Element     | value   | option | ElementType |
      | user_id     | madhuka | Name   | Textbox     |
      | user_suffix |   00000 | Name   | Textbox     |
      | user_bank   |    0001 | Name   | Textbox     |
    And I click on "Login" button in "Login to Merchant Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I "fill" data criteria of "Login to Merchant Management"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "Login to Merchant Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    Given I am at "iCore" Home Page
    Then I should see "iCore" Home Page
    And I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page

  Scenario: Edit Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Edit Merchant" icon
    Then I should see the "Edit Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
    Then I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Edit Merchant" page
    And I modify merchant contact details for "onbording"
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=3 |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Reject Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=4 |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Reapply Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Reapply Merchant" icon
    Then I should see the "Reapply Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
    Then I Click on Button "Submit"
    Then I Check if Merchant exists
    And I click the link "Details"
    Then I should see the "Reapply Merchant" page
    And I modify merchant contact details for "onbording"
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=2 |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Approve Reapplied Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=1 |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Suspend Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Suspend Merchant" icon
    Then I should see the "Suspend Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=6 |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Revoke Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Revoke Merchant" icon
    Then I should see the "Revoke Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=7 |                  1 |

  Scenario: Back to Merchant Management
    And I click on "Merchant Management" icon to back
    Then I should see the "Merchant Management" page

  Scenario: Approve revoked Merchant in Merchant management
    Given I Click the "Merchant Management" icon
    Then I should see the "Merchant Management" page
    And I Click the "Approve Merchant" icon
    Then I should see the "Approve Merchant" page
    And I fill the Merchant Details
      | field    | value          |
      | MercDesc | COREONBODMERAS |
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
      | Alias | SQL                                                                                | Expected Row Count |
      | ICORE | SELECT COUNT(*) FROM BKN_DM_MERC WHERE MERC_DES='COREONBODMERAS' AND STATUS_CODE=1 |                  1 |

  Scenario: Moving to iCore Home Menu
    Given I click on Home Page
    Then I should see "iCore" Home Page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page

  Scenario: Logout from merchant application
    And I click on "Log Out" button in "Add Merchant API Details"
      | Element | option |
      | logout  | id     |
    And I close the console
