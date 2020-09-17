defmodule Item do
  @enforce_keys [:name, :sell_in, :quality]
  defstruct [:name, :sell_in, :quality]

  @type t :: %__MODULE__{name: String.t(), sell_in: integer, quality: integer}
end
