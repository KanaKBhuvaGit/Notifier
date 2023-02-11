# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :notifier,
  ecto_repos: [Notifier.Repo]

# Configures the endpoint
config :notifier, NotifierWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: NotifierWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Notifier.PubSub,
  live_view: [signing_salt: "gxsTxkFo"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
# config :notifier, Notifier.Mailer, adapter: Swoosh.Adapters.Local
# config :notifier, Notifier.Mailer, adapter: Bamboo.LocalAdapter

# Swoosh API client is needed for adapters other than SMTP.
# config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :notifier, Notifier.QuantumScheduler,
  jobs: [
    # Every 10 minutes
    {{:extended, "*/10 * * * *"}, {Notifier.QuantumScheduler, :log_time, [:second]}}
    # Every minute
    # {"* * * * *", {Heartbeat, :send, []}},
    # Every 15 minutes
    # {"*/15 * * * *", fn -> System.cmd("rm", ["/tmp/tmp_"]) end},
    # Runs on 18, 20, 22, 0, 2, 4, 6:
    # {"0 18-6/2 * * *", fn -> :mnesia.backup('/var/backup/mnesia') end},
    # Runs every midnight:
    # {"@daily", {Backup, :backup, []}}
  ]
