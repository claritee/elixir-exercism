defmodule SecretHandshake do
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
  use Bitwise, only_operators: true

  @secrets [{8,"jump"},{4,"close your eyes"},{2,"double blink"},{1,"wink"}]
  
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    handshake = Enum.reduce(@secrets, [] , fn({k,v}, acc) -> if((code &&& k) === k, do: [v|acc], else: acc) end )
    
    if((code &&& 16) === 16, do: Enum.reverse(handshake), else: handshake)
  end
end