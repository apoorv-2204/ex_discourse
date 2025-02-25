import Config

config :ex_discourse_web, ExDiscourseWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

# Configures Swoosh API Client
config :swoosh, :api_client, ExDiscourse.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
