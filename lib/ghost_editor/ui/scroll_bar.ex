defmodule GhostEditor.UI.ScrollBar do
  import Ratatouille.View

  def render(_model) do
    panel(
      title: "  ",
      height: 2,
      background: :magenta
    )
  end
end
