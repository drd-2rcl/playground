defmodule Assoc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Assoc.Repo,
      # Start the Telemetry supervisor
      AssocWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Assoc.PubSub},
      # Start the Endpoint (http/https)
      AssocWeb.Endpoint
      # Start a worker by calling: Assoc.Worker.start_link(arg)
      # {Assoc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Assoc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AssocWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
