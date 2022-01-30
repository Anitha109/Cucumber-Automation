Feature: Verify the UI on Scheduled Payments

  Scenario: All the Scheduled payments are empty

    Given  User Clicks on View or delete Scheduled payments

    When Service call returns zero Direct debit, Standing order and future dated payment

    Then User able to see the below message under Direct debit section
      | There is no Direct debit for this account |
     And user able to see the below message under Standing order section
      | "There is no standing order for this account" |
     And user able to see the below message under Future-dated payments section
      | "There is no Future-dated payment for this account" |
# when 1 section has list of payments
  Scenario: Direct debit has list of payment and Standing order and future dated payment are empty

    Given User Clicks on View or delete Scheduled payments

    When Service call returns list of Direct debit and zero Standing order and future dated payment

    Then User able to see list of Direct debit payments
     And user able to see the below message under Standing order section
       | "There is no standing order for this account" |
    And user able to see the below message under Future-dated payments section
      | "There is no Future-dated payment for this account" |

  Scenario: Standing order has list of payment and Direct debit and future dated payment are empty
    Given  User Clicks on View or delete Scheduled payments

    When Service call returns list of Standing order zero Direct debit and future dated payment

    Then User able to see the below message under Direct debit section
      | "There is no Direct debit for this account" |
    And User able to see list of Standing order payments
    And user able to see the below message under Future-dated payments section
      | "There is no Future-dated payment for this account" |

  Scenario: future dated payment has list of payment and Direct debit and Standing order payments are empty
    Given  User Clicks on View or delete Scheduled payments

    When Service call returns list of Standing order zero Direct debit and future dated payment

    Then User able to see the below message under Direct debit section
      | "There is no Direct debit for this account" |
    And User able to see the below message under Standing order section
      | "There is no Standing order for this account" |
    And user able to see list of Future-dated payments

    # when 2 section has list of payments
  Scenario: Direct debit and Standing order has list of payment and future dated payment is empty

    Given User Clicks on View or delete Scheduled payments

    When Service call returns list of Direct debit and Standing order and zero future dated payment

    Then User able to see list of Direct debit payments
    And user able to see list of Standing order payments
    And user able to see the below message under Future-dated payments section
      | "There is no Future-dated payment for this account" |

  Scenario: Standing order and future dated payment has list of payment and Direct debit is empty
    Given  User Clicks on View or delete Scheduled payments

    When Service call returns list of Standing order and future dated payment zero Direct debit

    Then User able to see the below message under Direct debit section
      | "There is no Direct debit for this account" |
    And User able to see list of Standing order payments
    And user able to see list of Future-dated payments

  Scenario: future dated payment and Direct debit has list of payment and Standing order payments is empty
    Given  User Clicks on View or delete Scheduled payments

    When Service call returns list of Direct debit and future dated payment and zero Standing order payment

    Then User able to see list of Direct debit
    And User able to see the below message under Standing order
      | "There is no Standing order for this account" |
    And user able to see list of Future-dated payments

    # When all three has list of payments

  Scenario Outline:
    Given  User Clicks on View or delete Scheduled payments

    When Service call returns list of Direct debit Standing order and future dated payment

    Then User able to see list of Direct debit and it displays <"Account details"> <"Next payment date"> <"Amount">

    And User able to see list of Standing order
    And user able to see list of Future-dated payments

    Examples:
    | Account details | Next payment date | Amount |
    | 080023 01000008 | 02.02.2022        | 23.00  |
    | 080023 01000008 | 03.02.2022        | 2.00   |
    | 080023 01000008 | 04.02.2022        | 30.00  |





