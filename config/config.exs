# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :eu_desbravador,
  ecto_repos: [EuDesbravador.Repo]

# Configures the endpoint
config :eu_desbravador, EuDesbravadorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fdbei3E2gXiuad5+8yy22QmdyzopIK7UdYKBdbgNlNDinplCRNF4r3aONAiiypVc",
  render_errors: [view: EuDesbravadorWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: EuDesbravador.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]


# Configures JWT Token
config :eu_desbravador, EuDesbravador.Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "BlogAppGql",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: %{"k" => "3gx0vXjUD2BJ8xfo_aQWIA", "kty" => "oct"},
  serializer: EuDesbravador.Guardian


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
