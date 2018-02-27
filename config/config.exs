# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rock_store,
  ecto_repos: [RockStore.Repo]

# Configures the endpoint
config :rock_store, RockStoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QdmOrcUT8PcVomk4bO4aLFmxXCM5jz8zLQ49eynoc1dQFbudYfjecG1zcuUd4HzF",
  render_errors: [view: RockStoreWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RockStore.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
