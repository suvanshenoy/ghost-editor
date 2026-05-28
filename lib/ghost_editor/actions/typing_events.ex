defmodule GhostEditor.Actions.Typing.TypingEvents do
  @spec event(
          :delete
          | :spacebar
          | :enter
          | :text,
          %{
            model: any(),
            text: String.t(),
            ch: char(),
            text_cursor_x: number(),
            text_cursor_y: number(),
            cursor_position_x: number(),
            cursor_position_y: number()
          }
        ) :: %{
          displays: %{
            text: String.t(),
            ch: char(),
            key: String.t(),
            text_cursor: %{text_cursor_x: number(), text_cursor_y: number()},
            cursor_position: %{cursor_position_x: number(), cursor_position_y: number()}
          }
        }

  def event(:delete, %{
        model: model,
        text: text,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    cond do
      posX < 1 && String.length(text) - 1 == -1 ->
        %{
          model
          | text: text <> "",
            cursor_position: %{cursor_position_y: posY, cursor_position_x: posX},
            key: "backspace"
        }

      posY == 0 && posX > 0 ->
        %{
          model
          | text: String.slice(text, 0, String.length(text) - 1),
            cursor_position: %{cursor_position_y: posY, cursor_position_x: posX - 1},
            key: "backspace"
        }

      posX == 0 && posY > 0 ->
        %{
          model
          | text: String.slice(text, 0, String.length(text) - 1),
            cursor_position: %{cursor_position_y: posY - 1, cursor_position_x: posX},
            key: "backspace"
        }

      true ->
        model
    end
  end

  def event(:spacebar, %{
        model: model,
        text: text,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{window: window} = model

    if(posX == window.width - 50) do
      %{model | text: text <> ""}
    else
      %{
        model
        | text: text <> " ",
          cursor_position: %{cursor_position_y: posY, cursor_position_x: posX + 1},
          key: "space"
      }
    end
  end

  def event(:enter, %{
        model: model,
        text: text,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{window: window} = model

    if(posY == window.height - 25) do
      %{model | text: text <> ""}
    else
      %{
        model
        | text: text <> "\n",
          cursor_position: %{cursor_position_y: posY + 1, cursor_position_x: posX},
          key: "enter"
      }
    end
  end

  def event(:text, %{
        model: model,
        text: text,
        ch: ch,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{window: window} = model

    if(posY == window.height - 5 || posX == window.width - 5) do
      %{model | text: text <> ""}
    else
      %{
        model
        | text: text <> <<ch::utf8>>,
          key: <<ch::utf8>>,
          cursor_position: %{cursor_position_y: posY, cursor_position_x: posX + 1}
      }
    end
  end
end
