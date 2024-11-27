defmodule ImprovedAttributesExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ImprovedAttributesExampleWeb.Telemetry,
      ImprovedAttributesExample.Repo,
      {DNSCluster, query: Application.get_env(:improved_attributes_example, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ImprovedAttributesExample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ImprovedAttributesExample.Finch},
      # Start a worker by calling: ImprovedAttributesExample.Worker.start_link(arg)
      # {ImprovedAttributesExample.Worker, arg},
      # Start to serve requests, typically the last entry
      ImprovedAttributesExampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ImprovedAttributesExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ImprovedAttributesExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
