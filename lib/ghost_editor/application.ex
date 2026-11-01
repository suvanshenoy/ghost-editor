defmodule GhostEditor.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children =
      if Burrito.Util.running_standalone?() do
        [
          GhostEditor.CLI
        ]
      else
        [
          GhostEditor.TUI
        ]
      end

    # children = [
    #   GhostEditor.CLI
    # ]

    opts = [strategy: :one_for_one, name: GhostEditor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def stop(_state) do
    System.halt()
  end
end
