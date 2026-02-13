defmodule GhostEditor.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    runtime_opts = [
      app: GhostEditor,
      shutdown: {:application, :ghosteditor}
    ]

    children = [
      {Ratatouille.Runtime.Supervisor, runtime: runtime_opts}
    ]

    opts = [strategy: :one_for_one, name: GhostEditor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def stop(_state) do
    System.halt()
  end
end
