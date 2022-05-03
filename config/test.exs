import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pokedex_liveview, PokedexLiveviewWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "YDkfss+dTLTAwwn7K2CDwNIzEO3vSMMCCmctX2PR0bS6/7TlAOEC+P0o0xs19qRR",
  server: false

# In test we don't send emails.
config :pokedex_liveview, PokedexLiveview.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
