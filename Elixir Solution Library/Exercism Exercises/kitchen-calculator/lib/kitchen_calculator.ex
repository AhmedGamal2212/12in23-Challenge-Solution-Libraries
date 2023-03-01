defmodule KitchenCalculator do
  def get_volume(volume_pair) do
      elem(volume_pair, 1)
  end

  @from_cup 240.0
  @from_fluid_ounce 30.0
  @from_teaspoon 5.0
  @from_tablespoon 15.0
  @from_milliliter 1.0


  def to_milliliter({:cup, amount}), do: {:milliliter, amount * @from_cup}
  def to_milliliter({:fluid_ounce, amount}), do: {:milliliter, amount * @from_fluid_ounce}
  def to_milliliter({:teaspoon, amount}), do: {:milliliter, amount * @from_teaspoon}
  def to_milliliter({:tablespoon, amount}), do: {:milliliter, amount * @from_tablespoon}
  def to_milliliter({_, amount}), do: {:milliliter, amount * @from_milliliter}

  def from_milliliter({_, amount}, :cup), do: {:cup, amount / @from_cup}
  def from_milliliter({_, amount}, :fluid_ounce), do: {:fluid_ounce, amount / @from_fluid_ounce}
  def from_milliliter({_, amount}, :teaspoon), do: {:teaspoon, amount / @from_teaspoon}
  def from_milliliter({_, amount}, :tablespoon), do: {:tablespoon, amount / @from_tablespoon}
  def from_milliliter({_, amount}, :milliliter), do: {:milliliter, amount / @from_milliliter}

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
