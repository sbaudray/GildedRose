defmodule GildedRose do
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(%Item{name: "Aged Brie", sell_in: sell_in, quality: quality} = item)
      when sell_in <= 0 and quality <= 48 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality + 2}
  end

  def update_item(%Item{name: "Aged Brie", quality: quality} = item) when quality < 50 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality + 1}
  end

  def update_item(%Item{name: "Aged Brie"} = item) do
    %{item | sell_in: item.sell_in - 1}
  end

  def update_item(
        %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: sell_in} = item
      )
      when sell_in <= 0 do
    %{item | sell_in: item.sell_in - 1, quality: 0}
  end

  def update_item(
        %Item{
          name: "Backstage passes to a TAFKAL80ETC concert",
          sell_in: sell_in,
          quality: quality
        } = item
      )
      when sell_in <= 5 and quality <= 47 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality + 3}
  end

  def update_item(
        %Item{
          name: "Backstage passes to a TAFKAL80ETC concert",
          sell_in: sell_in,
          quality: quality
        } = item
      )
      when sell_in <= 10 and quality <= 48 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality + 2}
  end

  def update_item(
        %Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: quality} = item
      )
      when quality <= 49 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality + 1}
  end

  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert"} = item) do
    %{item | sell_in: item.sell_in - 1}
  end

  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros"} = item) do
    item
  end

  def update_item(%Item{sell_in: sell_in, quality: quality} = item)
      when sell_in <= 0 and quality >= 2 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality - 2}
  end

  def update_item(%Item{quality: quality} = item) when quality > 0 do
    %{item | sell_in: item.sell_in - 1, quality: item.quality - 1}
  end

  def update_item(%Item{} = item) do
    %{item | sell_in: item.sell_in - 1}
  end
end
