defmodule Strain do
  # Note: Refer to https://elixir-lang.org/getting-started/recursion.html#reduce-and-map-algorithms

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    reduce(list, fun, true)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    reduce(list, fun, false)
  end

  defp reduce(list, fun, condition) do
    reduce(list, [], fun, condition) |> Enum.reverse
  end

  defp reduce([head | tail], accumulator, fun, condition) do
    result = if fun.(head) == condition, do: [head | accumulator], else: accumulator
    reduce(tail, result, fun, condition)
  end

  defp reduce([], accumulator, fun, condition), do: accumulator
end
