defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
  	text
  	|> String.to_charlist
  	|> Enum.map(&(new_value(&1, shift)))
  	|> String.Chars.to_string
  end

  defp new_value(x, shift) when (x in ?a..?z), do: shift_in_range(x, shift, ?z) 
  defp new_value(x, shift) when (x in ?A..?Z), do: shift_in_range(x, shift, ?Z) 
  defp new_value(x, _), do: x

  defp shift_in_range(x, shift, upper) do
  	if (x + shift <= upper), do: x + shift, else: x - 26 + shift
  end
end
