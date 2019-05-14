Feature: Track quality and sellIn of inventory items

  Scenario Outline: items change quality and sellIn per day
    Given an item <name> with quality <quality> and sell by date <sellIn> according to <description>
    When 1 day passed
    Then the item has quality <newQuality>
    And the item has sell by date <newSellIn>

    Examples:
    | description | name | quality | sellIn | newQuality | newSellIn |
    | "Regular item reduces 1 per day:" | "Elixir of the Mongoose" | 10 | 1 | 9 | 0 |
    | "Quality cannot be negagtive:" | "Regular item" | 0 | 1 | 0 | 0 |
    | "Quality drops twice as fast after sellIn passed:" | "Regular item" | 3 | 0 | 1 | -1 |
    | "Aged Brie increases in quality:" | "Aged Brie" | 1 | 1 | 2 | 0 |
    | "Aged Brie increases twice as fast after sellIn passed:" | "Aged Brie" | 1 | 0 | 3 | -1 |
    | "Quality cannot increase above 50:" | "Aged Brie" | 50 | 1 | 50 | 0 |
    | "Backstage passes increase in quality:" | "Backstage passes to a TAFKAL80ETC concert" | 1 | 11 | 2 | 10 |
    | "Backstage passes between 10 and 5 days increase twice as fast:" | "Backstage passes to a TAFKAL80ETC concert" | 1 | 10 | 3 | 9 |
    | "Backstage passes between 5 and 0 days increase thrice as fast:" | "Backstage passes to a TAFKAL80ETC concert" | 1 | 5 | 4 | 4 |
    | "Backstage passes are worthless (0) when sellIn passed" | "Backstage passes to a TAFKAL80ETC concert" | 1 | 0 | 0 | -1 |
    | "Sulfuras always has a quality of 80 and sellIn stays 0" | "Sulfuras, Hand of Ragnaros" | 80 | 0 | 80 | 0 |