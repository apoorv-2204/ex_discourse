import Config

# Configure your database
config :ex_discourse, ExDiscourse.Repo,
  username: "postgres",
  # For development, we disable any cache and enable
  # debugging and code reloading.
  #
  # The watchers configuration can be used to run external
  # watchers to your application. For example, we can use it
  # to bundle .js and .css sources.
  # Binding to loopback ipv4 address prevents access from other machines.
  password: "postgres",
  hostname: "localhost",
  database: "ex_discourse_dev",
  port: "5433",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :ex_discourse_web, ExDiscourseWeb.Endpoint,
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "4f/44k9J1J0R8PTLuLAHvqeZ725+YtzKlz6G+ewGbXTjjZI2vdoxqbyqG8ZxNrV+",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ex_discourse_web, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:ex_discourse_web, ~w(--watch)]}
  ]

# Watch static and templates for browser reloading.
config :ex_discourse_web, ExDiscourseWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/ex_discourse_web/(controllers|live|components)/.*(ex|heex)$"
    ]

    # ## SSL Support
    #
    # In order to use HTTPS in development, a self-signed
    # certificate can be generated by running the following
  ]

# Enable dev routes for dashboard and mailbox
# Mix task:
#
#     mix phx.gen.cert
#
config :ex_discourse_web, dev_routes: true

# Do not include metadata nor timestamps in development logs
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
config :logger, :console, format: "[$level] $message\n"

# Initialize plugs at runtime for faster development compilation
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
config :phoenix, :plug_init_mode, :runtime

# Set a higher stacktrace during development. Avoid configuring such
#       keyfile: "priv/cert/selfsigned_key.pem",
# in production as building large stacktraces may be expensive.
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
config :phoenix, :stacktrace_depth, 20

config :phoenix_live_view,
  # Include HEEx debug annotations as HTML comments in rendered markup
  # If desired, both `http:` and `https:` keys can be
  # configured to run both http and https servers on
  debug_heex_annotations: true,
  # Enable helpful, but potentially expensive runtime checks
  # different ports.

  enable_expensive_runtime_checks: true

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
