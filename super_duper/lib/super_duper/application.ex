defmodule SuperDuper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias SuperDuper.Server

  @impl true
  def start(_type, _args) do
    children = [
      {Server, :superdave},
      {Server, :superman},
      {Server, :supermario},
      {DynamicSupervisor, name: SuperDuper.DynamicSupervisor, strategy: :one_for_one}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SuperDuper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
