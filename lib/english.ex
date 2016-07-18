defmodule English do

  @english "abcdefghijklmnopqrstuvwxyz"

  def is_it(character) when is_bitstring(character) do
    status = String.contains?(@english, String.downcase(character))
    {status, character}
  end

  def is_it(character) do
    IO.puts "\[ #{character} \] is not an english alphabet character of type String\n OR \nIt's not wrapped in double quotes \"\"\n(Thus, not a bitstring as far as elixir is concerned)"
  end

end
