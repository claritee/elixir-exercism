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

    command_mapping = %{1 => "wink",
      2 => "double blink",
      4 => "close your eyes",
      8 => "jump"}
    commands_list = command_mapping
    |> Enum.reduce([], fn({k, v}, acc) ->
        if band(code, k) == k, do: List.insert_at(acc, 0, v), else: List.insert_at(acc, 0, nil)
       end)
    |> Enum.filter(&(&1 != nil))
    
    if band(code, 16) == 16, do: commands_list, else: commands_list |> Enum.reverse
  end
end
