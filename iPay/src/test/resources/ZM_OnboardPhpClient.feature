Feature: Feature File for PHP Client to Onboarding

  @PHPClientOnboarding
  Scenario: Configure Shopping Cart
    Given I Modify MerchantId for "onboarding"
      | field       | value           |
      | $MerchantId | NIBLONBOARDMERAS |
    And I modify Key value for "Onboarding"

  Scenario: Perform iPay Sale Transaction to void
    Given I am at Shopping Cart page for "Onboarding"
    Then I should see the "Products" page to "PHP Client"
    And I click on "Add To Cart" button in "PHP Client"
      | Element                                   | option |
      | //button[contains(text(), 'Add To Cart')] | xpath  |
    And I Click on "Check-out!" link in Shopping Cart
    Then I should see the "View Cart" page to "PHP Client"
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I Select the "VISA" Payment Type
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I "fill" data criteria of "PHP Client"
      | Element        | value            | option     | ElementType |
      | cardNumber     | 5362050100072357 | Name       | Textbox     |
      | cvcNumber      |              530 | Name       | Textbox     |
      | expMonth       |               06 | Name,Value | Dropdown    |
      | expYear        |             2020 | Name,Value | Dropdown    |
      | cardHolderName | test             | Name       | Textbox     |
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I click on "Confirm Payment" button in "PHP Client"
      | Element                           | option |
      | //input[@value='Confirm Payment'] | xpath  |
    And I should see "ACCEPTED" transaction status to void
    #Then I veify DB values for Transaction to "void"
    And I close the Shopping Cart page

  Scenario: Perform iPay Sale Transaction to Refund
    Given I am at Shopping Cart page for "Onboarding"
    Then I should see the "Products" page to "PHP Client"
    And I click on "Add To Cart" button in "PHP Client"
      | Element                                   | option |
      | //button[contains(text(), 'Add To Cart')] | xpath  |
    And I Click on "Check-out!" link in Shopping Cart
    Then I should see the "View Cart" page to "PHP Client"
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I Select the "VISA" Payment Type
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I "fill" data criteria of "PHP Client"
      | Element        | value            | option     | ElementType |
      | cardNumber     | 5362050100072357 | Name       | Textbox     |
      | cvcNumber      |              530 | Name       | Textbox     |
      | expMonth       |               06 | Name,Value | Dropdown    |
      | expYear        |             2020 | Name,Value | Dropdown    |
      | cardHolderName | test             | Name       | Textbox     |
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I click on "Confirm Payment" button in "PHP Client"
      | Element                           | option |
      | //input[@value='Confirm Payment'] | xpath  |
    And I should see "ACCEPTED" transaction status to refund
    #Then I veify DB values for Transaction to "refund"
    And I close the console

  Scenario: Perform iPay Sale Transaction to Clear
    Given I am at Shopping Cart page for "Onboarding"
    Then I should see the "Products" page to "PHP Client"
    And I click on "Add To Cart" button in "PHP Client"
      | Element                                   | option |
      | //button[contains(text(), 'Add To Cart')] | xpath  |
    And I Click on "Check-out!" link in Shopping Cart
    Then I should see the "View Cart" page to "PHP Client"
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I Select the "VISA" Payment Type
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I "fill" data criteria of "PHP Client"
      | Element        | value            | option     | ElementType |
      | cardNumber     | 5362050100072357 | Name       | Textbox     |
      | cvcNumber      |              530 | Name       | Textbox     |
      | expMonth       |               06 | Name,Value | Dropdown    |
      | expYear        |             2020 | Name,Value | Dropdown    |
      | cardHolderName | test             | Name       | Textbox     |
    And I click on "Pay Now" button in "PHP Client"
      | Element                   | option |
      | //input[@value='Pay Now'] | xpath  |
    And I click on "Confirm Payment" button in "PHP Client"
      | Element                           | option |
      | //input[@value='Confirm Payment'] | xpath  |
    And I should see "ACCEPTED" transaction status to clear
    #Then I veify DB values for Transaction to "Clear"
    And I close the console
