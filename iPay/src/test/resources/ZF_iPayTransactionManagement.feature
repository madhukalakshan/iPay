Feature: Feature File for iPay Transaction Management

  @iPayTrxnMgmt
  Scenario: Navigate to Transaction Management
    Given I am at "Merchant" Login page to "Transaction Management"
    And I "fill" data criteria of "Login to Transaction Management"
      | Element   | value        | option | ElementType |
      | user_id   | 25MERCHATUSER | Name   | Textbox     |
      #| user_suffix |   00000 | Name   | Textbox     |
      | user_bank |         0001 | Name   | Textbox     |
    And I click on "Login" button in "Login to Transaction Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And I "fill" data criteria of "Login to Transaction Management"
      | Element  | value      | option | ElementType |
      | password | PassworD2. | Name   | Textbox     |
    And I click on "Login" button in "Login to Transaction Management"
      | Element                 | option |
      | //input[@value='Login'] | xpath  |
    And Select the top frame in Application page
    And I Click the "iPay" icon to "Transaction Management"
    Then I should see "iPay" Home Page
    And I Click the "Transaction Management" icon
    Then I should see the "Transaction Management" page

  Scenario: Void Transaction
    Given I Click the "Void Transaction" icon
    Then I should see the "Void Transaction" page
    And I "fill" data criteria of "Void Transaction"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | ALL   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "Void Transaction"
      | Element | option |
      | submit  | name   |
    And I click Merchant Ref ID to "Void Transaction"
    And I select Reason
    And I click on "submit" button in "Void Transaction"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Transaction Voided Successfully" in "Void Transaction"
    Then I veify DB values to "ipay" Void Transaction which did from "PHP Client"

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: PreAuth To Sale Transaction
    Given I Click the "PreAuth To Sale" icon
    Then I should see the "PreAuth To Sale" page
    And I "fill" data criteria of "PreAuth To Sale"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | ALL   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "PreAuth To Sale"
      | Element | option |
      | submit  | name   |
    And I click Merchant Ref ID to "PreAuth To Sale"
    And I click on "submit" button in "PreAuth To Sale"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Pre Authorization transaction converted to a Sale Transaction Successfully" in "PreAuth To Sale"
    Then I veify DB values for PreAuth To Sale Transaction

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Mark Suspisious Transaction
    Given I Click the "Mark Suspisious Txn" icon
    Then I should see the "Mark Suspisious Txn" page
    And I "fill" data criteria of "Mark Suspisious Txn"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | NPR   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "Mark Suspisious Txn"
      | Element | option |
      | submit  | name   |
    Then I should see the "Mark Suspisious Txn" page
    And I click Merchant Ref ID to "Mark Suspisious Txn"
    And I click on "submit" button in "Mark Suspisious Txn"
      | Element | option |
      | submit  | Name   |
    Then I should see the Success message in "Mark Suspisious Txn"
    Then I veify DB values to "ipay" Mark Suspisious Transaction which did from "PHP Client"

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Unmark Suspisious Transaction
    Given I Click the "Unmark Suspisious Txn" icon
    Then I should see the "Unmark Suspisious Txn" page
    And I "fill" data criteria of "Unmark Suspisious Txn"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | NPR   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "Unmark Suspisious Txn"
      | Element | option |
      | submit  | name   |
    Then I should see the "Unmark Suspisious Txn" page
    And I click Merchant Ref ID to "Unmark Suspisious Txn"
    And I click on "submit" button in "Unmark Suspisious Txn"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Suspected transaction is unmarked successfully" in "Unmark Suspisious Txn"
    Then I veify DB values to "ipay" Unmark Suspisious Transaction which did from "PHP Client"

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: PreAuth To Sale Transaction for Clear Transaction
    Given I Click the "PreAuth To Sale" icon
    Then I should see the "PreAuth To Sale" page
    And I "fill" data criteria of "PreAuth To Sale"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | ALL   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "PreAuth To Sale"
      | Element | option |
      | submit  | name   |
    And I click Merchant Ref ID to "Clear Transaction"
    And I click on "submit" button in "PreAuth To Sale"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Pre Authorization transaction converted to a Sale Transaction Successfully" in "PreAuth To Sale"

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Clear Transaction
    Given I Click the "Clear Transaction" icon
    Then I should see the "Clear Transaction" page
    And I "fill" data criteria of "Clear Transaction"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | ALL   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "Clear Transaction"
      | Element | option |
      | submit  | name   |
    And I click Merchant Ref ID to "Clear Transaction"
    And I click on "submit" button in "Clear Transaction"
      | Element | option |
      | submit  | Name   |
    Then I Check for Success Message "Transaction Cleared Successfully" in "Clear Transaction"
    Then I veify DB values to "ipay" Clear Transaction which did from "PHP Client"

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Batch Transactions
    Given I Click the "Batch Transactions" icon
    Then I should see the "Batch Transactions" page
    And I "fill" data criteria of "Batch Transactions"
      | Element       | value | option     | ElementType |
      # | merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | ALL   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "Batch Transactions"
      | Element | option |
      | submit  | name   |
    Then I should see the "Batch Transactions" page
    And I click on "Add Selected Transactions to Batch" button in "Batch Transactions"
      | Element                                              | option |
      | //input[@value='Add Selected Transactions to Batch'] | xpath  |
    Then I should see the Success message as "Selected transactions updated successfully" for Batch Transactions
    Then I veify DB values to "ipay" Batch Transaction which did from "PHP Client"

  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Settle Transactions
    Given I Click the "Settle Transactions" icon
    Then I should see the "Settle Transactions" page
    #And I "fill" data criteria of "Settle Transactions"
    #| Element     | value        | option   | ElementType |
    #| merchant_id | NIBLMERCHANT | Id,value | DropDown    |
    #And I click on "submit" button in "Settle Transactions"
    #| Element | option |
    #| submit  | name   |
    #Then I should see the "Settle Transactions" page
    And I tick the checkbox
    And I click on "Settle Selected Batches" button in "Settle Transactions"
      | Element                                   | option |
      | //input[@value='Settle Selected Batches'] | xpath  |
    Then I should see the Success message as "SEND_TO_SETTLEMENT_SUCCESSFULL" for Settle Transactions

  #Then I veify DB values for Settle Transaction
  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Refund Transaction
    Given I Click the "Refund Transaction" icon
    Then I should see the "Refund Transaction" page
    And I "fill" data criteria of "Refund Transaction"
      | Element       | value | option     | ElementType |
      #| merchant_id   | NIBLMERCHANT | Name,value | DropDown    |
      | product_code  | ALL   | Name,value | DropDown    |
      | currency_code | ALL   | Name,value | DropDown    |
    And I fill the Transaction Date period
    And I click on "submit" button in "Refund Transaction"
      | Element | option |
      | submit  | name   |
    Then I should see the "Refund Transaction" page
    And I click Merchant Ref ID to "Refund Transaction"
    And I select Reason
    And I click on "submit" button in "Refund Transaction"
      | Element | option |
      | submit  | name   |
    Then I Check for Success Message "Transaction Refunded Successfully." in "Refund Transaction"

  #Then I veify DB values for Refund Transaction
  Scenario: Back to Transaction Management
    And I click on "Transaction Management" icon to back
    Then I should see the "Transaction Management" page

  Scenario: Moving to Application Menu
    And I click on square icon  on corner
    And I Click the "Applications Menu" icon on Application Page
    Then I should see the "Application Menu" Application Page
