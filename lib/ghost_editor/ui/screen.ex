defmodule GhostEditor.UI.Screen do
  import Ratatouille.View
  use GhostEditor.Constants.Colors
  alias GhostEditor.UI.CursorBar

  def render(model, menu) do
    %{
      window: window,
      text: text,
      displays: %{screen: %{size: size}},
      key: key
    } =
      model

    height = window.height - 2

    view(bottom_bar: CursorBar.render(%{model | key: key})) do
      overlay(padding: 0) do
        row do
          menu

          column(size: size) do
            panel(height: height, border: %{color: @default_border_color}) do
              label(content: text <> "| ", attributes: [:bold], color: @default_text_color)
            end
          end
        end
      end
    end
  end
end
