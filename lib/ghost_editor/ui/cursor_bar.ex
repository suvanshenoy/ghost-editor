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
      text: text,
      key: key
    } =
      model

    size = AdjustSize.adjust(:cursor_bar, %{model: model})

    # key_length =
    #   cond do
    #     String.length(text) == 0 -> ""
    #     true -> String.length(text)
    #   end

    cursor_bar =
      bar do
        row do
          column(size: size) do
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
