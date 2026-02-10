defmodule GhostEditor.UI.Menu do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  def render(model) do
    %{
      window: window,
      displays: %{menu: %{size: size}}
    } =
      model

    height = window.height - 3

    column(size: size) do
      panel(height: height)
    end
  end
end
