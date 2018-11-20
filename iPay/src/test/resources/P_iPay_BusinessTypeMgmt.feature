###############################################################################################################################################
# Business Type ID  27myBusinessTest will be created.
###############################################################################################################################################
Feature: Feature File for Business Type Management

  @BusTypeMgmt
  Scenario: Click iPay Application Menu
    Given I Click the "Merchant Related" icon to "Business Type Mgmt"
    Then I should see the "Merchant Related" page to "Business Type Mgmt"
    And I Click the "Business Type Mgmt" icon
    Then I should see the "Business Type Mgmt" page

  Scenario: Add Business Type
    Given I Click the "Add Business Type" icon
    Then I should see the "Add Business Type" page
    Then I should be on Add Business Type Mgmt Page
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I Check for Success Message "Successfully added business type and is pending approval" in "Add Business Type"
    Then I call verify method
      | Alias | SQL                                                                                       | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type_for_auth where business_type_id ='27myBusinessTest' |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Reject Business Type
    Given I Click the "Approve Business Type" icon
    Then I should see the "Approve Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Approve Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Approve Business Type" page
    And I Enter the Comment "Reject Business Type" in "Approve Business Type"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on "Reject" Button in "Approve Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully rejected" in "Approve Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                           | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type_for_auth where business_type_id ='27myBusinessTest' and status_code = 4 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Reapply Business Type
    Given I Click the "Reapply Business Type" icon
    Then I should see the "Reapply Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Reapply Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Reapply Business Type" page
    And I Click on "Reapply" Button in "Reapply Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully reapplied and is pending approval" in "Reapply Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                           | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type_for_auth where business_type_id ='27myBusinessTest' and status_code = 3 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Approve Business Type(Action Reapplied Approve)
    Given I Click the "Approve Business Type" icon
    Then I should see the "Approve Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Approve Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Approve Business Type" page
    And I Enter the Comment "Approve Business Type" in "Approve Business Type"
      | Element     | Option |
      | usr_comment | id     |
    And I Click on "Approve" Button in "Approve Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully approved" in "Approve Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                  | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type where business_type_id ='27myBusinessTest' and status_code = 1 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Edit Business Type
    Given I Click the "Edit Business Type" icon
    Then I should see the "Edit Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Edit Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Edit Business Type" page
    And I Click on "Save" Button in "Edit Business Type" of Business Type Mgmt
    Then I Check for Success Message "Successfully edited business type and is pending approval" in "Edit Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                           | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type_for_auth where business_type_id ='27myBusinessTest' and status_code = 3 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Suspend Business Type
    Given I Click the "Suspend Business Type" icon
    Then I should see the "Suspend Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Suspend Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Suspend Business Type" page
    And I Click on "Suspend" Button in "Suspend Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully suspended" in "Suspend Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                  | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type where business_type_id ='27myBusinessTest' and status_code = 5 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Delete Business Type
    Given I Click the "Delete Business Type" icon
    Then I should see the "Delete Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Delete Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Delete Business Type" page
    And I Click on "Delete" Button in "Delete Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully deleted" in "Delete Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                  | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type where business_type_id ='27myBusinessTest' and status_code = 6 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Reject Business Type(Action Deleted Reject)
    Given I Click the "Approve Business Type" icon
    Then I should see the "Approve Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Approve Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Approve Business Type" page
    And I Enter the Comment "Rejected Delete Business Type" in "Approve Business Type"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on "Reject" Button in "Approve Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully rejected" in "Approve Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                  | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type where business_type_id ='27myBusinessTest' and status_code = 5 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Revoke Business Type
    Given I Click the "Revoke Business Type" icon
    Then I should see the "Revoke Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Revoke Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Revoke Business Type" page
    And I Click on "Revoke" Button in "Revoke Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully revoked and is pending approval" in "Revoke Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                           | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type_for_auth where business_type_id ='27myBusinessTest' and status_code = 3 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Approve Business Type(Action Revoked Approve)
    Given I Click the "Approve Business Type" icon
    Then I should see the "Approve Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "Approve Business Type" page
    And I click the link "27myBusinessTest"
    Then I should see the "Approve Business Type" page
    And I Enter the Comment "Approved revoke Business Type" in "Approve Business Type"
      | Element     | Option |
      | usr_comment | name   |
    And I Click on "Approve" Button in "Approve Business Type" of Business Type Mgmt
    Then I Check for Success Message "Business type successfully approved" in "Approve Business Type"
    Then I call verify method
      | Alias | SQL                                                                                                  | Expected Row Count |
      | IPG   | select count(*) from ipg_business_type where business_type_id ='27myBusinessTest' and status_code = 1 |                  1 |

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: View Business Type
    Given I Click the "View Business Type" icon
    Then I should see the "View Business Type" page
    And I fill Search business type Details
      | field         | value           |
      | busi_type_id  | 27myBusinessTest |
      | busi_type_des | 27myBusinessTest |
    And I Click on Button "submit"
    Then I should see the "View Business Type" page
    And I click the link "Active (Approved)"
    Then I should see the "View Business Type" page

  Scenario: Back to Business Type Management
    And I click on "Business Type Mgmt" icon to back
    Then I should see the "Business Type Mgmt" page

  Scenario: Moving to Ipay Home Menu
    Given I click on Home Page
    Then I should see "iPay" Home Page
