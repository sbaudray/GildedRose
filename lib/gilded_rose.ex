defmodule GildedRose do
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(%Item{name: "Aged Brie", quality: quality, sell_in: sell_in} = item) do
    new_quality =
      cond do
        sell_in <= 0 -> quality + 2
        true -> quality + 1
      end
      |> clamp()

    %{item | sell_in: item.sell_in - 1, quality: new_quality}
  end

  def update_item(
        %Item{
          name: "Backstage passes to a TAFKAL80ETC concert",
          sell_in: sell_in,
          quality: quality
        } = item
      ) do
    new_quality =
      cond do
        sell_in <= 0 -> 0
        sell_in <= 5 -> quality + 3
        sell_in <= 10 -> quality + 2
        true -> quality + 1
      end
      |> clamp()

    %{item | sell_in: item.sell_in - 1, quality: new_quality}
  end

  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros"} = item) do
    item
  end

  def update_item(%Item{quality: quality, sell_in: sell_in} = item) do
    new_quality =
      cond do
        sell_in <= 0 -> quality - 2
        true -> quality - 1
      end
      |> clamp()

    %{item | sell_in: item.sell_in - 1, quality: new_quality}
  end

  defp clamp(quality) do
    cond do
      quality < 0 -> 0
      quality > 50 -> 50
      true -> quality
    end
  end
end
