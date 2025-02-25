import Config

config :esbuild,
  version: "0.17.11",
  # Configures the mailer
  #
  # By default it uses the "Local" adapter which stores the emails
  # locally. You can see the emails in your browser, at "/dev/mailbox".
  #
  # For production it's recommended to configure a different adapter
  # at the `config/runtime.exs`.
  ex_discourse_web: [
    args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/ex_discourse_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :ex_discourse, ExDiscourse.Mailer, adapter: Swoosh.Adapters.Local

# Configure Mix tasks and generators
config :ex_discourse,
  ecto_repos: [ExDiscourse.Repo]

# Configures the endpoint
config :ex_discourse_web, ExDiscourseWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: ExDiscourseWeb.ErrorHTML, json: ExDiscourseWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ExDiscourse.PubSub,
  live_view: [signing_salt: "x0BLjJ5U"]

config :ex_discourse_web,
  ecto_repos: [ExDiscourse.Repo],
  generators: [context_app: :ex_discourse]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  ex_discourse_web: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/ex_discourse_web/assets", __DIR__)
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
