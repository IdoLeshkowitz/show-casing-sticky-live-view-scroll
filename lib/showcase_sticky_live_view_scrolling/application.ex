defmodule ShowcaseStickyLiveViewScrolling.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ShowcaseStickyLiveViewScrollingWeb.Telemetry,
      ShowcaseStickyLiveViewScrolling.Repo,
      {DNSCluster, query: Application.get_env(:showcase_sticky_live_view_scrolling, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ShowcaseStickyLiveViewScrolling.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ShowcaseStickyLiveViewScrolling.Finch},
      # Start a worker by calling: ShowcaseStickyLiveViewScrolling.Worker.start_link(arg)
      # {ShowcaseStickyLiveViewScrolling.Worker, arg},
      # Start to serve requests, typically the last entry
      ShowcaseStickyLiveViewScrollingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShowcaseStickyLiveViewScrolling.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShowcaseStickyLiveViewScrollingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
