defmodule GhostEditor.UI.CursorBar do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  @spec render(%{
          cursor_position: %{cursor_position_x: number(), cursor_position_y: number()},
          key: String.t()
        }) ::
          any()

  def render(model) do
    %{
      cursor_position: %{cursor_position_x: posX, cursor_position_y: posY},
      key: key
    } =
      model

    cursor_bar =
      bar do
        row do
          column(size: 2) do
            label(
              content: "(curX: #{posX}%, curY: #{posY}%, key: #{key})",
              color: @default_text_color,
              attributes: [:bold]
            )
          end
        end
      end

    cursor_bar
  end
end
