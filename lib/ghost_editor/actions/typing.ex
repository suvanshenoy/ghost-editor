defmodule GhostEditor.Actions.Typing do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Typing.TypingEvents

  def init(model) do
    model
  end

  def update(model, message) do
    %{
      text: text,
      text_cursor: %{text_cursor_x: x, text_cursor_y: y},
      cursor_position: %{cursor_position_x: posX, cursor_position_y: posY}
    } =
      model

    case message do
      {:event, %{key: key}} when key in @delete_keys ->
        TypingEvents.delete_event(model, text, posX, posY)

      {:event, %{key: key}} when key in [@spacebar, @enter] ->
        case key do
          @spacebar ->
            TypingEvents.spacebar_event(model, text, posX, posY)

          @enter ->
            TypingEvents.enter_event(model, text, 0, posY)
        end

      {:event, %{ch: ch}} when ch in @scroll_keys ->
        case ch do
          @scroll_up ->
            TypingEvents.scroll_up_event(model, x, y, posX, posY)

          @scroll_down ->
            TypingEvents.scroll_down_event(model, x, y, posX, posY)

          @scroll_left ->
            TypingEvents.scroll_left_event(model, x, y, posX, posY)

          @scroll_right ->
            TypingEvents.scroll_right_event(model, x, y, posX, posY)
        end

      # {:event, %{ch: ch}} when ch in @motion_keys ->
      #   case ch do
      #     @move_up ->
      #       TypingEvents.move_up_event(model, x, y, posX, posY)

      #     @move_down ->
      #       TypingEvents.move_down_event(model, x, y, posX, posY)

      #     @move_left ->
      #       TypingEvents.move_left_event(model, x, y, posX, posY)

      #     @move_right ->
      #       TypingEvents.move_right_event(model, x, y, posX, posY)
      #   end

      {:event, %{ch: ch}} when ch > 0 ->
        TypingEvents.text_event(model, text, ch, posX, posY)

      _ ->
        model
    end
  end
end
