Feature: iPay Home Page

  @iPayHomePage
  Scenario: Navigate to iCore Home Page
    Given I am at "IAdmin" Login page to "iPay Home Page"
    And I fill data criteria of "iPay Home Page"
      | Element     | value   | option | ElementType |
      | user_id     | madhuka | Name   | Textbox     |
      | user_suffix |   00000 | Name   | Textbox     |
      | user_bank   |    0001 | Name   | Textbox     |
    And I click on "Login" button in "iPay Home Page"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I fill data criteria of "iPay Home Page"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "iPay Home Page"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    Given I am at "iPay" Home Page
    Then I should see "iPay" Home Page
