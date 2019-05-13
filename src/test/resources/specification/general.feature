Feature: Track quality and sellIn of inventory items

  Scenario Outline: Item with quality <quality> degrades by one per day
    Given an item with quality <quality> and sell by date <sellIn>
    When 1 day passed
    Then the item has quality <newQuality>
    And the item has sell by date <newSellIn>

    Examples:
    | quality | sellIn | newQuality | newSellIn |
    | 10 | 1 | 9 | 0 |