defmodule CaesarCipher.CipherChannel do
  use Phoenix.Channel

  def join("cipher:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("cipher:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"cleartext" => cleartext, "shift" => shift}, socket) do
    ciphertext = CaesarCipher.Forward.cipher(cleartext, String.to_integer(shift)) |> IO.inspect
    broadcast! socket, "new_msg", %{cleartext: cleartext, ciphertext: ciphertext}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end

end
