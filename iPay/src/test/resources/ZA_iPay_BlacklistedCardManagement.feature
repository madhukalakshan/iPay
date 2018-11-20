###############################################################################################################################################
# Card number  6004000600000126 will be Balck listed.
###############################################################################################################################################
Feature: Feature File for Blacklisted Card Management

  @BlacklistCardMgmt
  Scenario: Click iPay Application Menu
    Given I Click "IPG195" function id icon to "Blacklisted Card Management"
    Then I should see the "Maintenance" page to "Blacklisted Card Management"
    And I Click the "Blacklisted Card Management" icon
    Then I should see the "Blacklisted Card Management" page

  Scenario: Add Blacklisted Card
    Given I Click the "Add Blacklisted Card" icon
    Then I should see the "Add Blacklisted Card" page
    Then I should be on Add Blacklisted Card Page
      | field          | value                |
      | card_number    |     6004000600000126 |
      | card_type_code | SVC                  |
      | reason         | Add Blacklisted Card |
    And I Click on Button "submit"
    Then I Check for Success Message "Blacklisted card was added successfully." in "Add Blacklisted Card"
    Then I call verify method
      | Alias | SQL                                                                                                                        | Expected Row Count |
      | IPG   | select count(*) from ipg_hot_card where card_number=store_data('6004000600000126') and card_type='SVC' and status_code='1' |                  1 |

  Scenario: Back to Blacklisted Card Management
    And I click on "Blacklisted Card Management" icon to back
    Then I should see the "Blacklisted Card Management" page

  Scenario: View Blacklisted Card
    Given I Click the "View Blacklisted Card" icon
    Then I should see the "View Blacklisted Card" page
    And I fill Search  Blacklisted Card Details
      | field          | value                |
      | card_number    |     6004000600000126 |
      | card_type_code | SVC                  |
      | reason         | Add Blacklisted Card |
    And I Click on Button "submit"
    Then I should see the "View Blacklisted Card" page
    And I click the link "6004000600000126" in "View Blacklisted Card"
    Then I should see the "View Blacklisted Card" page

  Scenario: Back to Blacklisted Card Management
    And I click on "Blacklisted Card Management" icon to back
    Then I should see the "Blacklisted Card Management" page

  Scenario: Edit Blacklisted Card
    Given I Click the "Edit Blacklisted Card" icon
    Then I should see the "Edit Blacklisted Card" page
    And I fill Search  Blacklisted Card Details
      | field          | value                |
      | card_number    |     6004000600000126 |
      | card_type_code | SVC                  |
      | reason         | Add Blacklisted Card |
    And I Click on Button "submit"
    Then I should see the "Edit Blacklisted Card" page
    And I click the link "6004000600000126" in "Edit Blacklisted Card"
    Then I should see the "Edit Blacklisted Card" page
    And I edit the Reason in "Edit Blacklisted Card"
      | field  | value                 |
      | reason | Edit Blacklisted Card |
    And I Click on Button "submit"
    Then I Check for Success Message "Blacklisted card successfully edited." in "Edit Blacklisted Card"
    Then I call verify method
      | Alias | SQL                                                                                                                                                           | Expected Row Count |
      | IPG   | select count(*) from ipg_hot_card where card_number=store_data('6004000600000126') and card_type='SVC' and status_code='1' and reason='Edit Blacklisted Card' |                  1 |

  Scenario: Back to Blacklisted Card Management
    And I click on "Blacklisted Card Management" icon to back
    Then I should see the "Blacklisted Card Management" page

  Scenario: Delete Blacklisted Card
    Given I Click the "Delete Blacklisted Card" icon
    Then I should see the "Delete Blacklisted Card" page
    And I fill Search  Blacklisted Card Details
      | field          | value                 |
      | card_number    |      6004000600000126 |
      | card_type_code | SVC                   |
      | reason         | Edit Blacklisted Card |
    And I Click on Button "submit"
    Then I should see the "Delete Blacklisted Card" page
    And I click the link "6004000600000126" in "Delete Blacklisted Card"
    Then I should see the "Delete Blacklisted Card" page
    And I Click on Button "submit"
    Then I Check for Success Message "Blacklisted card successfully deleted." in "Delete Blacklisted Card"
    Then I call verify method
      | Alias | SQL                                                                                                                        | Expected Row Count |
      | IPG   | select count(*) from ipg_hot_card where card_number=store_data('6004000600000126') and card_type='SVC' and status_code='1' |                  0 |

  Scenario: Back to Blacklisted Card Management
    And I click on "Blacklisted Card Management" icon to back
    Then I should see the "Blacklisted Card Management" page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page

  Scenario: Logout from merchant application
    And I click on "Log Out" button in "Add Merchant API Details"
      | Element                          | option |
      | //div[contains(text(),'Logout')] | xpath  |
    And I close the console
