defmodule GhostEditor.Actions.Typing do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Typing.TypingEvents
  alias GhostEditor.Actions.Switch.SwitchEvents

  def init(model) do
    model
  end

  @spec update(
          any(),
          {:event,
           %{
             key:
               Ratatouille.Constants.key(:backspace)
               | Ratatouille.Constants.key(:backspace2)
               | Ratatouille.Constants.key(:space)
               | Ratatouille.Constants.key(:enter)
               | Ratatouille.Constants.key(:ctrl_w),
             ch: ?w | ?s | ?d | ?a | char()
           }}
        ) :: any()

  def update(model, message) do
    %{
      text: text,
      text_cursor: %{text_cursor_x: x, text_cursor_y: y},
      cursor_position: %{cursor_position_x: posX, cursor_position_y: posY},
      displays: displays
    } =
      model

    case message do
      {:event, %{key: key}} when key in @delete_keys ->
        TypingEvents.event(:delete, %{
          model: model,
          text: text,
          cursor_position_x: posX,
          cursor_position_y: posY
        })

      {:event, %{key: key}} when key in [@spacebar, @enter] ->
        case key do
          @spacebar ->
            TypingEvents.event(:spacebar, %{
              model: model,
              text: text,
              cursor_position_x: posX,
              cursor_position_y: posY
            })

          @enter ->
            TypingEvents.event(:enter, %{
              model: model,
              text: text,
              cursor_position_x: posX,
              cursor_position_y: posY
            })
        end

      {:event, %{ch: ch}} when ch in @scroll_keys or ch > 0 ->
        case ch do
          @scroll_up ->
            TypingEvents.event(:scroll_up, %{
              model: model,
              text_cursor_x: x,
              text_cursor_y: y,
              cursor_position_x: posX,
              cursor_position_y: posY
            })

          @scroll_down ->
            TypingEvents.event(:scroll_down, %{
              model: model,
              text_cursor_x: x,
              text_cursor_y: y,
              cursor_position_x: posX,
              cursor_position_y: posY
            })

          @scroll_left ->
            TypingEvents.event(:scroll_left, %{
              model: model,
              text_cursor_x: x,
              text_cursor_y: y,
              cursor_position_x: posX,
              cursor_position_y: posY
            })

          @scroll_right ->
            TypingEvents.event(:scroll_right, %{
              model: model,
              text_cursor_x: x,
              text_cursor_y: y,
              cursor_position_x: posX,
              cursor_position_y: posY
            })

          _ ->
            TypingEvents.event(:text, %{
              model: model,
              text: text,
              ch: ch,
              cursor_position_x: posX,
              cursor_position_y: posY
            })
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

      {:event, %{key: @ctrl_w}} ->
        %{model | displays: %{screen: displays.screen, menu: displays.menu}}
        SwitchEvents.event(:focus_menu, %{model: model})

      _ ->
        model
    end
  end
end
