defmodule GhostEditor.UI.Screen do
  import Ratatouille.View
  use GhostEditor.Constants.Colors
  alias GhostEditor.UI.CursorBar

  def render(model, menu) do
    %{
      window: window,
      displays: %{screen: %{size: size}}
    } =
      model

    height = window.height - 3

    view(bottom_bar: CursorBar.render(model)) do
      panel(height: :fill, border: %{color: @default_border_color}, padding: 0) do
        row do
          menu

          column(size: size) do
            panel(height: height)
          end
        end
      end
    end
  end
end
