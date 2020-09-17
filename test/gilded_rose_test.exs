defmodule GildedRoseTest do
  use ExUnit.Case

  use ExUnitProperties

  test "begin the journey of refactoring" do
    check all(item <- item()) do
      assert LegacyGildedRose.update_item(item) == GildedRose.update_item(item)
    end
  end

  defp item do
    gen all(
          quality <- integer(0..50),
          sell_in <- integer(-1..13),
          name <-
            member_of([
              "Whatever",
              "Aged Brie",
              "Backstage passes to a TAFKAL80ETC concert",
              "Sulfuras, Hand of Ragnaros"
            ])
        ) do
      %Item{name: name, sell_in: sell_in, quality: quality}
    end
  end
end
