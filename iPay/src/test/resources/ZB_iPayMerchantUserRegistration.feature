Feature: Feature File for Merchant User Registration

  @MerusrRegis
  Scenario: Merchant User Registration
    Given I am at "Merchant" Login page to "New Merchant User Registration"
    And I click the link "Register new user"
    Then I verify Merchant User Registration page is loaded
    And I "fill" data criteria of "New Merchant User Registration"
      | Element                         | value          | option     | ElementType |
      | merchant_id                     | 30MER          | Name       | Textbox     |
      | title                           | Mr.            | Name,value | DropDown    |
      | first_name                      | test           | Name       | Textbox     |
      | last_name                       | lastname       | Name       | Textbox     |
      | user_id                         | 25MERCHATUSER   | Name       | Textbox     |
      | login_password                  | PassworD1.     | Name       | Textbox     |
      | conf_login_password             | PassworD1.     | Name       | Textbox     |
      | security_question               |              0 | Name,index | Dropdown    |
      | secret_answer                   | secretanswer   | Name       | Textbox     |
      | //table/tbody/tr[1]/td[1]/input |                | xpath      | click       |
      | office_phone                    |      111111111 | Name       | Textbox     |
      | mobile_phone                    |      111111111 | Name       | Textbox     |
      | home_phone                      |      111111111 | Name       | Textbox     |
      | e_mail                          | test@gmail.com | Name       | Textbox     |
      | conf_e_mail                     | test@gmail.com | Name       | Textbox     |
      | random_image_text               | value          | Name       | Textbox     |
      | accept_terms                    |                | Name       | click       |
    And I click on "submit" button in "New Merchant User Registration"
      | Element | option |
      | Submit  | Name   |
    Then I Check for Success Message "User registered successfully" in "New Merchant User Registration"
    And I close the console
    Then I call verify method
      | Alias | SQL                                                                                        | Expected Row Count |
      | IPG   | SELECT COUNT(*) FROM IPG_MERCH_USER_REQ  WHERE USER_ID ='25MERCHATUSER' AND STATUS_CODE='7' |                  1 |
