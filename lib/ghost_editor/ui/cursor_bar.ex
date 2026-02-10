defmodule GhostEditor.UI.CursorBar do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  def render(model) do
    %{
      cursor_position: %{cursor_position_x: posX, cursor_position_y: posY}
    } =
      model

    cursor_bar =
      bar do
        label(
          content: "(curX: #{posX}%, curY: #{posY}%)",
          color: @default_text_color,
          attributes: [:bold]
        )
      end

    cursor_bar
  end
end
