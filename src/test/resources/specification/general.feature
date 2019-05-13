Feature: Track quality and sellIn of inventory items

  Scenario Outline: Item with quality <quality> degrades by one per day
    Given an item with quality <quality> and sell by date 1
    When 1 day passed
    Then the item has quality 9
    And the item has sell by date 0

    Examples:
    | quality |
    | 10 |