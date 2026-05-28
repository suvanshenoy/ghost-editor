defmodule GhostEditor.Actions.Typing do
  use GhostEditor.Constants.Keys
  alias GhostEditor.Actions.Typing.TypingEvents
  alias GhostEditor.Actions.Switch.SwitchEvents

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
        ) :: %{
          displays: %{
            text: String.t(),
            text_cursor: %{text_cursor_x: number(), text_cursor_y: number()},
            cursor_position: %{cursor_position_x: number(), cursor_position_y: number()}
          }
        }

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

      {:event, %{ch: ch}} when ch > 0 ->
        cond do
          String.printable?(<<ch::utf8>>) ->
            TypingEvents.event(:text, %{
              model: model,
              text: text,
              ch: ch,
              cursor_position_x: posX,
              cursor_position_y: posY
            })
        end

      {:event, %{key: @ctrl_w}} ->
        %{model | displays: %{screen: displays.screen, menu: displays.menu}}
        SwitchEvents.event(:focus_menu, %{model: model})

      _ ->
        model
    end
  end
end
