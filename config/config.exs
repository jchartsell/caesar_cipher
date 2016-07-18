# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :caesar_cipher,
  ecto_repos: [CaesarCipher.Repo]

# Configures the endpoint
config :caesar_cipher, CaesarCipher.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EUdqleMX1pMp5rUS0+/3LYzxDyY2Rv/EtDhqQwwUJWZSuur2/UqE6APWyXL+UOcr",
  render_errors: [view: CaesarCipher.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CaesarCipher.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
