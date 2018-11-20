Feature: Feature File for Merchant User Management

  @iAdminMerUsrMgmt
  Scenario: Navigate to Merchant User Management
    Given I am at "IAdmin" Login page to "Merchant User Management"
    And I "fill" data criteria of "Login to Merchant User Management"
      | Element     | value   | option | ElementType |
      | user_id     | madhuka | Name   | Textbox     |
      | user_suffix |   00000 | Name   | Textbox     |
      | user_bank   |    0001 | Name   | Textbox     |
    And I click on "Login" button in "Login to Merchant User Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I "fill" data criteria of "Login to Merchant User Management"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "Login to Merchant User Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    Then I should see the "Application Menu" page to "Merchant User Management"
    And I am at "iAdmin" Home Page
    Then I should see "iAdmin" Home Page
    And I Click the "Administration" icon to "Merchant User Management"
    Then I should see the "Administration" page to "Merchant User Management"
    And I Click the "User Management" icon to "Merchant User Management"
    Then I should see the "User Management" page to "Merchant User Management"
    And I Click the "Merchant User Management" icon
    Then I should see the "Merchant User Management" page

  Scenario: Add Merchant User
    Given I Click the "Add Merchant User" icon
    Then I should see the "Add Merchant User" page
    And I "fill" data criteria of "Add Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "submit" button in "Merchant User Management"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Add Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Add Merchant User" page
    And I click on "Add" button in "Merchant User Management"
      | Element | option |
      | Add     | Id     |
    Then I Check for Success Message "Successfully Add a Merchant User" in "Add Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                                | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER_FOR_AUTH  WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='3' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Approve Merchant User
    Given I Click the "Approve Merchant User" icon
    Then I should see the "Approve Merchant User" page
    And I "fill" data criteria of "Approve Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Approve Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Approve Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Approve Merchant User" page
    And I Enter the Comment "Approved Merchant User" in "Approve Merchant User"
      | Element     | Option |
      | usr_comment | id     |
    And I click on "Approve" button in "Approve Merchant User"
      | Element | option |
      | Approve | Id     |
    Then I Check for Success Message "Successfully approved merchant user" in "Approve Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                      | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='1' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Edit Merchant User
    Given I Click the "Edit Merchant User" icon
    Then I should see the "Edit Merchant User" page
    And I "fill" data criteria of "Edit Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Edit Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Edit Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Edit Merchant User" page
    And I "fill" data criteria of "Edit Merchant User"
      | Element       | value          | option     | ElementType |
      | merchant_id   | 30MER          | Name,value | DropDown    |
      | title         | Mr.            | Name,value | DropDown    |
      | first_name    | test           | Name       | Textbox     |
      | last_name     | lastname       | Name       | Textbox     |
      | email_address | test@gmail.com | Name       | Textbox     |
      | office_phone  |      111111111 | Name       | Textbox     |
      | mobile_phone  |      111111111 | Name       | Textbox     |
      | home_phone    |      111111111 | Name       | Textbox     |
    And I click on "Edit" button in "Edit Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Successfully edited merchant user" in "Edit Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                                | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER_FOR_AUTH  WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='3' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Reject Merchant User
    Given I Click the "Approve Merchant User" icon
    Then I should see the "Approve Merchant User" page
    And I "fill" data criteria of "Approve Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Approve Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Approve Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Approve Merchant User" page
    And I Enter the Comment "Reject Merchant User" in "Approve Merchant User"
      | Element     | Option |
      | usr_comment | id     |
    And I click on "Reject" button in "Approve Merchant User"
      | Element | option |
      | Reject  | Id     |
    Then I Check for Success Message "Successfully rejected merchant user" in "Approve Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                                | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER_FOR_AUTH  WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='4' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Reapply Merchant User
    Given I Click the "Reapply Merchant User" icon
    Then I should see the "Reapply Merchant User" page
    And I "fill" data criteria of "Reapply Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Reapply Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Reapply Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Reapply Merchant User" page
    And I "fill" data criteria of "Reapply Merchant User"
      | Element       | value          | option     | ElementType |
      | merchant_id   | 30MER          | Name,value | DropDown    |
      | title         | Mr.            | Name,value | DropDown    |
      | first_name    | test           | Name       | Textbox     |
      | last_name     | lastname       | Name       | Textbox     |
      | email_address | test@gmail.com | Name       | Textbox     |
      | office_phone  |      111111111 | Name       | Textbox     |
      | mobile_phone  |      111111111 | Name       | Textbox     |
      | home_phone    |      111111111 | Name       | Textbox     |
    And I click on "Reapply" button in "Reapply Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Successfully reapplied merchant user" in "Reapply Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                                | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER_FOR_AUTH  WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='3' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Approve reapplied Merchant User
    Given I Click the "Approve Merchant User" icon
    Then I should see the "Approve Merchant User" page
    And I "fill" data criteria of "Approve Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Approve Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Approve Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Approve Merchant User" page
    And I Enter the Comment "Approved Reapplied Merchant User" in "Approve Merchant User"
      | Element     | Option |
      | usr_comment | id     |
    And I click on "Approve" button in "Approve Merchant User"
      | Element | option |
      | Approve | Id     |
    Then I Check for Success Message "Successfully approved merchant user" in "Approve Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                      | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='1' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Suspend Merchant User
    Given I Click the "Suspend Merchant User" icon
    Then I should see the "Suspend Merchant User" page
    And I "fill" data criteria of "Suspend Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Suspend Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Suspend Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Suspend Merchant User" page
    And I click on "Suspend" button in "Suspend Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Successfully suspended merchant user" in "Suspend Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                      | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='5' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Revoke Merchant User
    Given I Click the "Revoke Merchant User" icon
    Then I should see the "Revoke Merchant User" page
    And I "fill" data criteria of "Revoke Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Revoke Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Revoke Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Revoke Merchant User" page
    And I "fill" data criteria of "Revoke Merchant User"
      | Element       | value          | option     | ElementType |
      | merchant_id   | 30MER          | Name,value | DropDown    |
      | title         | Mr.            | Name,value | DropDown    |
      | first_name    | test           | Name       | Textbox     |
      | last_name     | lastname       | Name       | Textbox     |
      | email_address | test@gmail.com | Name       | Textbox     |
      | office_phone  |      111111111 | Name       | Textbox     |
      | mobile_phone  |      111111111 | Name       | Textbox     |
      | home_phone    |      111111111 | Name       | Textbox     |
    And I click on "Revoke" button in "Revoke Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Successfully revoked merchant user" in "Revoke Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                                | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER_FOR_AUTH  WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='3' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Approve revoked Merchant User
    Given I Click the "Approve Merchant User" icon
    Then I should see the "Approve Merchant User" page
    And I "fill" data criteria of "Approve Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Approve Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Approve Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Approve Merchant User" page
    And I Enter the Comment "Approved revoked Merchant User" in "Approve Merchant User"
      | Element     | Option |
      | usr_comment | id     |
    And I click on "Approve" button in "Approve Merchant User"
      | Element | option |
      | Approve | Id     |
    Then I Check for Success Message "Successfully approved merchant user" in "Approve Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                      | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='1' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Assign Roles to Merchant User
    Given I Click the "Assign Roles to Merchant User" icon
    Then I should see the "Assign Roles to Merchant User" page
    And I "fill" data criteria of "Assign Roles to Merchant User"
      | Element    | value        | option | ElementType |
      | user_id    | 25MERCHATUSER | Name   | Textbox     |
      | company_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "Assign Roles to Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "Assign Roles to Merchant User" page
    And I click the link "25MERCHATUSER"
    Then I should see the "Assign Roles to Merchant User" page
    And I "fill" data criteria of "Assign Roles to Merchant User"
      | Element                    | value | option | ElementType |
      | //option[@value='merrole'] |       | Xpath  | Click       |
    And I click on "Add" button in "Assign Roles to Merchant User"
      | Element | option |
      | Add     | Id     |
    Then I call verify method
      | Alias | SQL                                                                                      | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='1' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: Approve Roles Assigned Merchant User
    Given I Click the "Approve Roles Assigned Merchant User" icon
    Then I should see the "Approve Roles Assigned Merchant User" page
    And I click the link "25MERCHATUSER"
    And I click on "Confirm" button in "Approve Roles Assigned Merchant User"
      | Element | option |
      | Confirm | Id     |
    Then I should see the "Approve Roles Assigned Merchant User" page
    And I click on "yes" button in "Approve Roles Assigned Merchant User"
      | Element | option |
      | yes     | Id     |
    Then I should see the "Approve Roles Assigned Merchant User" page
    And I Enter the Comment "Approve Roles Assigned Merchant User" in "Approve Roles Assigned Merchant User"
      | Element      | Option |
      | user_comment | id     |
    And I click on "submit" button in "Approve Roles Assigned Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "The user was successfully approved" in "Approve Roles Assigned Merchant User"
    Then I call verify method
      | Alias | SQL                                                                                      | Expected Row Count |
      | USR   | SELECT COUNT(*) FROM USR_DM_USR WHERE USER_ID='25MERCHATUSER' AND STATUS_CODE='1'         |                  1 |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCHANT_USER WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='1' |                  1 |

  Scenario: Back to Merchant User Management
    And I click on "Merchant User Management" icon to back
    Then I should see the "Merchant User Management" page

  Scenario: View Merchant User
    Given I Click the "View Merchant User" icon
    Then I should see the "View Merchant User" page
    And I "fill" data criteria of "View Merchant User"
      | Element     | value        | option | ElementType |
      | user_id     | 25MERCHATUSER | Name   | Textbox     |
      | merchant_id | 30MER        | Name   | Textbox     |
    And I click on "Search" button in "View Merchant User"
      | Element | option |
      | submit  | Name   |
    Then I should see the "View Merchant User" page
    And I click the link "Active (Approved)"
    Then I should see the "View Merchant User" page

  Scenario: Moving to Iadmin Home Menu
    Given I click on Home Page
    Then I should see "iAdmin" Home Page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page

  Scenario: Logout from merchant application
    And I click on "Log Out" button in "Virtual Terminal"
      | Element | option |
      | logout  | id     |
    And I close the console
