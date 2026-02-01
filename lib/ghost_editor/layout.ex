defmodule GhostEditor.Layout do
  import Ratatouille.View

  # alias GhostEditor.UI.ScrollBar

  use GhostEditor.Constants.Colors

  def render(model) do
    %{text: text, text_cursor: %{text_cursor_x: x, text_cursor_y: y}, cursor_position: pos} =
      model

    cursor_bar =
      bar do
        label(
          content: "(cur: #{pos}%)",
          color: @default_text_color,
          attributes: [:bold]
        )
      end

    view(bottom_bar: cursor_bar) do
      panel(height: :fill, border: %{color: @default_border_color}) do
        viewport(offset_y: y, offset_x: x) do
          # ScrollBar.render(model)

          label(content: text <> "| ", attributes: [:bold], color: @default_text_color)
        end
      end
    end
  end
end
