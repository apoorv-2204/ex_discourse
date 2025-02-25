defmodule ExDiscourse.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ExDiscourse.Repo,
      {DNSCluster, query: Application.get_env(:ex_discourse, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ExDiscourse.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ExDiscourse.Finch}
      # Start a worker by calling: ExDiscourse.Worker.start_link(arg)
      # {ExDiscourse.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ExDiscourse.Supervisor)
  end
end
