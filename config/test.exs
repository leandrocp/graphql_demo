use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rock_store, RockStoreWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rock_store, RockStore.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rock_store_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
