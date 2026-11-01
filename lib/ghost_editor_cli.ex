defmodule GhostEditor.CLI do
  use Task

  @version Mix.Project.config()[:version]

  def start_link(_arg) do
    ExRatatui.Burrito.start_link(GhostEditor.TUI, Burrito.Util.Args.argv(),
      name: :ghost_editor,
      version: @version
    )
  end
end
