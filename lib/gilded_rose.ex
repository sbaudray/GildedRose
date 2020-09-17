defmodule GildedRose do
  @callback update_item(Item.t()) :: Item.t()

  defp responsible_module_for(%Item{name: name}) do
    case name do
      "Aged Brie" -> GildedRose.Brie
      "Backstage passes to a TAFKAL80ETC concert" -> GildedRose.Backstage
      "Sulfuras, Hand of Ragnaros" -> GildedRose.Sulfuras
      _ -> GildedRose.Default
    end
  end

  @spec update_item(Item.t()) :: Item.t()
  def update_item(%Item{} = item) do
    module = responsible_module_for(item)
    module.update_item(item)
  end

  @spec clamp_quality(integer) :: integer
  def clamp_quality(quality) do
    cond do
      quality < 0 -> 0
      quality > 50 -> 50
      true -> quality
    end
  end
end
