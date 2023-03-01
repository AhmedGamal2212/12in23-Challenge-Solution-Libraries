defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    x = elem(a, 0) * elem(b, 1) + elem(a, 1) * elem(b, 0)
    y = elem(a, 1) * elem(b, 1)

    {x, y} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    x = elem(a, 0) * elem(b, 1) - elem(a, 1) * elem(b, 0)
    y = elem(a, 1) * elem(b, 1)
    
    {x, y} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    x = elem(a, 0) * elem(b, 0)
    y = elem(a, 1) * elem(b, 1)

    {x, y} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    multiply(num, {elem(den, 1), elem(den, 0)} |> fix())
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    x = Kernel.abs(elem(a, 0))
    y = Kernel.abs(elem(a, 1))
    
    {x, y} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(_a, 0), do: {1, 1}
  def pow_rational(a, n) when n > 0, do: multiply(a, pow_rational(a, n - 1))
  def pow_rational(a, n), do: pow_rational(a, Kernel.abs(n)) |> rev() |> fix()

  defp fix(a) do
    neg = (elem(a, 1) < 0 and elem(a, 0) >= 0) && -1 || 1
    {neg * elem(a, 0), neg * elem(a, 1)}
  end
  
  defp rev(a), do: {elem(a, 1), elem(a, 0)}

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    :math.pow(x, elem(n, 0) / elem(n, 1))
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    x = elem(a, 0)
    y = elem(a, 1)
    g = Integer.gcd(x, y)
    {div(x, g), div(y, g)} |> fix()
  end
end
