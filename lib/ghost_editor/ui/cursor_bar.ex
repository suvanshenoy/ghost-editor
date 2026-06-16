defmodule GhostEditor.UI.CursorBar do
  import Ratatouille.View
  use GhostEditor.Constants.Colors
  alias GhostEditor.AdjustSize

  @spec render(%{
          cursor_position: %{cursor_position_x: number(), cursor_position_y: number()},
          text: String.t(),
          key: String.t()
        }) ::
          any()

  def render(model) do
    %{
      cursor_position: %{cursor_position_x: posX, cursor_position_y: posY},
      key: key,
      mode: mode
    } =
      model

    size = AdjustSize.adjust(:cursor_bar, %{model: model})

    cursor_bar =
      bar do
        row do
          column(size: size) do
            viewport(offset_x: -7) do
              label(
                content: "curX: #{posX}%, curY: #{posY}%, key: #{key}, mode: #{mode}",
                color: :black,
                background: @default_background_color,
                attributes: [:bold]
              )
            end
          end
        end
      end

    cursor_bar
  end
end
