defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    # Loop through bits and get the command: code AND key == key
    # If the match is code AND 10000: then reverse the commands list

    commands_list = %{1 => "wink",
      2 => "double blink",
      4 => "close your eyes",
      8 => "jump"}
    |> Enum.reduce([], fn({k, v}, acc) ->
        if band(code, k) == k, do: acc ++ [v], else: acc
       end)
    
    if band(code, 16) == 16, do: commands_list |> Enum.reverse, else: commands_list
  end
end
