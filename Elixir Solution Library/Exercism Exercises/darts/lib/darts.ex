defmodule Darts do
  @type position :: {number, number}
  
  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    dist = get_dist({x, y})
    cond do
      dist <= 1 -> 10
      dist <= 5 -> 5
      dist <= 10 -> 1
      true -> 0
    end
  end

  defp get_dist({x, y}) do
    :math.sqrt(x * x + y * y)
  end
end
