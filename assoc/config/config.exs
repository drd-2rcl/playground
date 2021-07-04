# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :assoc,
  ecto_repos: [Assoc.Repo]

# Configures primary and foreign key to migrations
config :assoc, Assoc.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :assoc, AssocWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RKcKR6VW73gZ47x6eDe0nRV3YEx4kxPSjas/PNDaxT7FFMFZTHKYFqz+48mgekvs",
  render_errors: [view: AssocWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Assoc.PubSub,
  live_view: [signing_salt: "t4VfW92X"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
