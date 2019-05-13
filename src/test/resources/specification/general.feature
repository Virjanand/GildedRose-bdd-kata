Feature: Track quality and sellIn of inventory items

  Scenario Outline: Item with quality <quality> degrades by one per day
    Given an item <name> with quality <quality> and sell by date <sellIn>
    When 1 day passed
    Then the item has quality <newQuality>
    And the item has sell by date <newSellIn>

    Examples:
    | name | quality | sellIn | newQuality | newSellIn |
    | "some item" | 10 | 1 | 9 | 0 |