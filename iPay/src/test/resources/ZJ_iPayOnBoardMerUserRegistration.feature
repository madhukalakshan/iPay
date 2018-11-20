Feature: Feature File for OnBoad Merchant User Registration

  @OnBoardUsrRegis
  Scenario: Navigate to Merchant On Boad
    Given I am at "Merchant" Login page to "Merchant On Boad"
    And I click the link "Merchant On-board"
    And I verify "Merchant User Registration Form" title in "Merchant On Boad"

  Scenario: Create On Board merchant user
    And I "fill" data criteria of "On Bord Register new user"
      | Element | value            | option | ElementType |
      | e_mail  | 44test@gmail.com | Name   | Textbox     |
    And I click on "submit" button in "On Bord Register new user"
      | Element | option |
      | Submit  | name   |
    And I "fill" data criteria of "On Bord Register new user"
      | Element             | value         | option     | ElementType |
      | BankCode            |          0001 | Name,Value | Dropdown    |
      | user_id             | 47ONBOARDUSER | Name       | Textbox     |
      | login_password      | PassworD1.    | Name       | Textbox     |
      | conf_login_password | PassworD1.    | Name       | Textbox     |
    And I click on "submit" button in "On Bord Register new user"
      | Element | option |
      | Submit  | name   |
    And I "fill" data criteria of "On Bord Register new user"
      | Element                         | value               | option     | ElementType |
      | business_type_id                | 26myBusinessTest    | Name,Value | Dropdown    |
      | company_name                    | NIBLONBOARDMERAS    | Name       | Textbox     |
      | currency_code                   | NPR                 | Name,Value | Dropdown    |
      | url                             | http://www.test.com | Name       | Textbox     |
      | tittle                          | Mr                  | Nmae,Value | Dropdown    |
      | primary_contact                 | COREONBODMERAS      | Name       | Textbox     |
      | contact_mobile_phone_no         |           111111111 | Name       | Textbox     |
      | email_address                   | 44test@gmail.com    | Name       | Textbox     |
      | company_address                 | 44test@gmail.com    | Name       | Textbox     |
      | monthy_sale_val                 |            10007.00 | Name       | Textbox     |
      | monthy_sale_val_currency        | NPR                 | Name,Value | Dropdown    |
      | VISA                            |                     | Name       | Click       |
      | mBankCode                       |                0001 | Name,Value | Dropdown    |
      | merchant_account_number         |          1111111111 | Name       | Textbox     |
      | //table/tbody/tr[1]/td[1]/input |                     | xpath      | Click       |
    And I click on "submit" button in "On Bord Register new user"
      | Element | option |
      | Submit  | name   |
    And I verify "Merchant User Registration Form" title in "Merchant On Boad"
    And I upload file in "On Bord Register new user"
      | Elemet      | Path                      | Option |
      | fileUpload  | \\config\\Document\\1.jpg | Name   |
      | fileUpload2 | \\config\\Document\\1.jpg | Name   |
      | fileUpload4 | \\config\\Document\\1.jpg | Name   |
    And I "fill" data criteria of "On Bord Register new user"
      | Element           | value | option | ElementType |
      | random_image_text | text  | Name   | Textbox     |
      | accept_terms      |       | Id     | Click       |
    And I click on "submit" button in "On Bord Register new user"
      | Element   | option |
      | frmSubmit | id     |
    Then I should see the Success message as "Merchant Registration Successful" for OnBord Register new user
    Then I call verify method
      | Alias | SQL                                                                                                                              | Expected Row Count |
      | IPG   | SELECT count(*) FROM IPG_MERCH_ONLINE_REQ WHERE USER_ID='47ONBOARDUSER' AND STATUS_CODE='1' AND MERCHANT_NAME='NIBLONBOARDMERAS' |                  1 |

  Scenario: Close Merchant console
    And I close the console
