package se.crisp.edu.refactor.gildedrose.step;

import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import se.crisp.edu.refactor.gildedrose.GildedRose;
import se.crisp.edu.refactor.gildedrose.Inventory;
import se.crisp.edu.refactor.gildedrose.Item;

import static org.junit.Assert.assertEquals;

public class GeneralSteps {

    private static final String SOME_NAME = "some name";
    private GildedRose gildedRose;
    private Inventory inventory;
    private Item currentItem;

    @Before
    public void beforeAll() {
        inventory = new Inventory();
        gildedRose = new GildedRose(inventory);
    }

    @Given("^an item with quality (\\d+) and sell by date (\\d+)$")
    public void anItemWithQualityAndSellByDate(int quality, int sellIn) {
        currentItem = new Item(SOME_NAME, sellIn, quality);
        inventory.addItem(currentItem);
    }

    @When("^(\\d+) day passed$")
    public void dayPassed(int days) {
        for (int n = 0; n < days; n++) {
            gildedRose.updateQuality();
        }
    }

    @Then("^the item has quality (\\d+)$")
    public void theItemHasQuality(int quality) {
        assertEquals(quality, currentItem.quality);
    }

    @And("^the item has sell by date (\\d+)$")
    public void theItemHasSellByDate(int sellIn) {
        assertEquals(sellIn, currentItem.sellIn);
    }
}

