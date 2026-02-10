defmodule GhostEditor.Layout do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  alias GhostEditor.UI.CursorBar
  alias GhostEditor.UI.Menu
  alias GhostEditor.UI.Screen

  def render(model) do
    %{
      text: text,
      text_cursor: %{text_cursor_x: x, text_cursor_y: y},
      displays: displays
    } =
      model

    case displays do
      _ ->
        Screen.render(
          %{
            model
            | displays: %{screen: %{size: 10}}
          },
          Menu.render(%{model | displays: %{menu: %{size: 2}}})
        )

        # _ ->
        #   view(bottom_bar: CursorBar.render(model)) do
        #     panel(height: :fill, border: %{color: @default_border_color}, padding: 0) do
        #       viewport(offset_y: y, offset_x: x) do
        #         label(content: text <> "| ", attributes: [:bold], color: @default_text_color)
        #       end
        #     end
        #   end
    end
  end
end
