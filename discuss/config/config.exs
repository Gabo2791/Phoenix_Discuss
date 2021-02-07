# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "henoCjo2Rc4Ro+529Dka/qb2Nfkp7xlfIcs/8pLd6TU8AXKqJfFaYo95vL/sLtVU",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user, user:email"]}
  ]

  config :ueberauth, Ueberauth.Strategy.Github.OAuth,
    client_id: "2f36d96df30fd01ca43d",
    client_secret: "f9b6ac0d98c5a1fad896f298a1854769dee167f1"
    #client_id: System.get_env("GITHUB_CLIENT_ID"),
    #client_secret: System.get_env("GITHUB_CLIENT_SECRET")
