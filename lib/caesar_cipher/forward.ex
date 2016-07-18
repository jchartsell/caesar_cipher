defmodule CaesarCipher.Forward do

  @english ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  def cipher(string, shift) when is_bitstring(string) do
    cipher(String.split(string, ""), shift, [])
  end

  def cipher(string, shift) do
    IO.puts "[ #{string} ] is not valid input.\nEnsure you are using double quotes \"\""
  end

  defp cipher([""], _shift, new_string) do
    List.to_string(new_string)
  end

  defp cipher([h|t], shift, new_string) do
    character = h |> process_char(shift)
    cipher(t, shift, new_string ++ [character])
  end

  defp process_char(character, shift) when is_bitstring(character) do
    character
      |> English.is_it
      |> check_case(shift)
  end

  defp check_case({:true, character}, shift) do
    case character |> String.downcase == character do
      true ->
        #IO.puts "\[ #{character} \] is already lower-case"
        {:lower, character} |> caesar(shift)
      false ->
        #IO.puts "\[ #{character} \] is not already lower-case"
        {:upper, character} |> caesar(shift)
    end
  end

  defp check_case({:false, character}, shift) do
    IO.puts "\[ #{character} \] punctuation or non-english character, skipping"
    character
  end

  defp caesar({:lower, character}, shift) do
    IO.puts "processing lowercase character #{character}"
    Enum.at(@english, shifted(character, shift))
  end

  defp caesar({:upper, character}, shift) do
    IO.puts "processing uppercase character #{character}"
    Enum.at(@english, shifted(convert(character), shift)) |> String.upcase
  end

  defp index(character) do
    Enum.find_index(@english, fn(n) -> n == character end)
  end

  defp shifted(character, shift) do
    rem(index(character) + shift, 26)
  end

  defp convert(character) do
    character
      |> String.downcase
  end

end
