defmodule ExDiscourse.Repo do
  use Ecto.Repo,
    otp_app: :ex_discourse,
    adapter: Ecto.Adapters.Postgres
end
