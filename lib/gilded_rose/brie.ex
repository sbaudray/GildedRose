defmodule GildedRose.Brie do
  @moduledoc false
  @behaviour GildedRose

  @impl true
  def update_item(%Item{quality: quality, sell_in: sell_in} = item) do
    new_quality =
      cond do
        sell_in <= 0 -> quality + 2
        true -> quality + 1
      end
      |> GildedRose.clamp_quality()

    %{item | sell_in: item.sell_in - 1, quality: new_quality}
  end
end
