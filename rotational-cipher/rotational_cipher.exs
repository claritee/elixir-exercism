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

  def new_value(x, shift) do
  	cond do
		(x in ?a..?z) && (x + shift <= ?z) -> x + shift	
		(x in ?a..?z) && (x + shift > ?z) -> x - 26 + shift
		(x in ?A..?Z) && (x + shift <= ?Z) -> x + shift
		(x in ?A..?Z) && (x + shift > ?Z) -> x - 26 + shift
		true -> x
	end
  end
end
