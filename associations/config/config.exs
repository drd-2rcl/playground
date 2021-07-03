# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :associations,
  ecto_repos: [Associations.Repo]

# Configures the endpoint
config :associations, AssociationsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cyi6qwx++VHRT/SJguUC9TCWINdfq/PaLk4CmUacmXTBkJcqt98RTUzitMbD2W5h",
  render_errors: [view: AssociationsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Associations.PubSub,
  live_view: [signing_salt: "6nz5OQEs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
