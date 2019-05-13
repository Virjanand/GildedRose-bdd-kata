Feature: General business rules

  Scenario Outline: Item with quality <quality> degrades by one per day
    Given an item with quality <quality> and sell by date tomorrow
    When 1 day passed
    Then the item has quality 9
    And the item has sell by date today

    Examples:
    | quality |
    | 10 |