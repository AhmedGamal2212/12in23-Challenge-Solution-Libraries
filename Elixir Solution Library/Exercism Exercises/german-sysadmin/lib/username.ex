defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    tmp = case head do
      ?_ -> [?_]
      head when ?a <= head and ?z >= head -> [head]
      head when head === ?ä -> 'ae'
      head when head === ?ö -> 'oe'
      head when head === ?ü -> 'ue'
      head when head === ?ß -> 'ss'
      _ -> []
    end

    tmp ++ sanitize(tail)
  end
end
