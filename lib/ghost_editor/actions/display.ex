defmodule GhostEditor.Actions.Display do
  use GhostEditor.Constants.Keys
  # alias GhostEditor.Actions.Display.DisplayEvents

  def init(model) do
    model
  end

  def update(model, message) do
    %{
      # text: text
      # text_cursor: %{text_cursor_x: x, text_cursor_y: y},
      # cursor_position: %{cursor_position_x: posX, cursor_position_y: posY}
      # displays: %{screen: screen, menu: menu}
    } =
      model

    case message do
      {:event, %{key: key}} ->
        case key do
          _ -> model
        end

      _ ->
        model
    end
  end
end
