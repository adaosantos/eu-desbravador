use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :eu_desbravador, EuDesbravadorWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :eu_desbravador, EuDesbravador.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "eu_desbravador_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
