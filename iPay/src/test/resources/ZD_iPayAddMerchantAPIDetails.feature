Feature: Feature File for Add Merchant API Details

  @AddMerAPIDtls
  Scenario: Login to Merchant Console
    Given I am at "merchant" Login page to "Add Merchant API Details"
    And I "fill" data criteria of "Login to Add Merchant API Details"
      | Element   | value        | option | ElementType |
      | user_id   | 25MERCHATUSER | Name   | Textbox     |
      | user_bank |         0001 | Name   | Textbox     |
    And I click on "Login" button in "Login to Add Merchant API Details"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I "fill" data criteria of "Login to Add Merchant API Details"
      | Element  | value      | option | ElementType |
      | password | PassworD1. | Name   | Textbox     |
    And I click on "Login" button in "Login to Add Merchant API Details"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    Then I should display message as "Please Change Your Password " when navigate to "Add Merchant API Details"
    And I click on "OK" button in "Login to Add Merchant API Details"
      | Element                         | option |
      | //button[contains(text(),'OK')] | xpath  |
    And I "fill" data criteria of "Login to Add Merchant API Details"
      | Element         | value      | option | ElementType |
      | old_password    | PassworD1. | Name   | Textbox     |
      | new_password    | PassworD2. | Name   | Textbox     |
      | retype_password | PassworD2. | Name   | Textbox     |
    And I click on "Submit" button in "Login to Add Merchant API Details"
      | Element | option |
      | Submit2 | name   |
    Then I Check for Success Message "Password Was Changed Successfully" in "Login to Add Merchant API Details"
    And I click on "OK" button in "Login to Add Merchant API Details"
      | Element                         | option |
      | //button[contains(text(),'OK')] | xpath  |
    And I "fill" data criteria of "Add Merchant API Details"
      | Element   | value        | option | ElementType |
      | user_id   | 25MERCHATUSER | Name   | Textbox     |
      | user_bank |         0001 | Name   | Textbox     |
    And I click on "Login" button in "Add Merchant API Details"
      | Element | option |
      | login   | id     |
    And I "fill" data criteria of "Add Merchant API Details"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "Add Merchant API Details"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    Then I should see the "Application Menu" page to "Add Merchant API Details"

  Scenario: Navigate to Add Merchant API Details
    And I Click the "iPay-Merchant" icon to "Add Merchant API Details"
    Then I should see the "Main Menu" page to "Add Merchant API Details"

  Scenario: Add Merchant API Details
    And I Click the "Add Merchant API Details" icon
    Then I should see the "Add Merchant API Details" page
    And I "fill" data criteria of "Add Merchant API Details"
      | Element      | value  | option | ElementType |
      | APIpassword  | 123456 | Name   | Textbox     |
      | APIpassword2 | 123456 | Name   | Textbox     |
    And I click on "Generate" button in "Add Merchant API Details"
      | Element  | option |
      | Generate | id     |
    And I get API Key value "ipay"
    And I click on "Save" button in "Add Merchant API Details"
      | Element    | option |
      | submit_val | name   |
    Then I Check for Success Message "Successfully saved" in "Add Merchant API Details"
    Then I call verify method
      | Alias | SQL                                                                                        | Expected Row Count |
      | IPG   | select count(*) from ipg_merch_exp_api_det where merchant_id = '30MER' and status_code='1' |                  1 |

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page

  Scenario: Logout from merchant application
    And I click on "Log Out" button in "Add Merchant API Details"
      | Element | option |
      | logout  | id     |
    And I close the console
