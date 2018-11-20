Feature: Login to iadmin application through the iAdmin login page

  Scenario: Login to Iadmin Application
    Given I am at "IAdmin" Login page to "iAdmin Login"
    And I "fill" data criteria of "iAdmin Login"
      | Element     | value   | option | ElementType |
      | user_id     | madhuka | Name   | Textbox     |
      | user_suffix |   00000 | Name   | Textbox     |
      | user_bank   |    0001 | Name   | Textbox     |
    And I click on "Login" button in "iAdmin Login"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I "fill" data criteria of "iAdmin Login"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "iAdmin Login"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    Then I should see the "Application Menu" Application Page
