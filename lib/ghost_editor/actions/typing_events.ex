defmodule GhostEditor.Actions.Typing.TypingEvents do
  @spec event(
          :delete
          | :spacebar
          | :enter
          | :text
          | :scroll_up
          | :scroll_down
          | :scroll_right
          | :scroll_left,
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

  def event(:scroll_up, %{
        model: model,
        text_cursor_x: x,
        text_cursor_y: y,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{
      model
      | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
        cursor_position: %{cursor_position_y: posY - 2, cursor_position_x: posX}
    }
  end

  def event(:scroll_down, %{
        model: model,
        text_cursor_x: x,
        text_cursor_y: y,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{
      model
      | text_cursor: %{text_cursor_y: y + 2, text_cursor_x: x},
        cursor_position: %{cursor_position_y: posY + 2, cursor_position_x: posX}
    }
  end

  def event(:scroll_left, %{
        model: model,
        text_cursor_x: x,
        text_cursor_y: y,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{
      model
      | text_cursor: %{text_cursor_y: y, text_cursor_x: x - 2},
        cursor_position: %{cursor_position_y: posY, cursor_position_x: posX - 2}
    }
  end

  def event(:scroll_right, %{
        model: model,
        text_cursor_x: x,
        text_cursor_y: y,
        cursor_position_x: posX,
        cursor_position_y: posY
      }) do
    %{
      model
      | text_cursor: %{text_cursor_y: y, text_cursor_x: x + 2},
        cursor_position: %{cursor_position_y: posY, cursor_position_x: posX + 2}
    }
  end

  # def move_up_event(model, x, y, posX, posY) do
  # %{
  #   model
  #   | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
  #     cursor_position: %{cursor_position_y: posY - 2, cursor_position_x: posX}
  # }
  # end

  # def move_down_event(model, x, y, posX, posY) do
  # %{
  #   model
  #   | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
  #     cursor_position: %{cursor_position_y: posY - 2, cursor_position_x: posX}
  # }
  # end

  # def move_left_event(model, x, y, posX, posY) do
  # %{
  #   model
  #   | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
  #     cursor_position: %{cursor_position_y: posY - 2, cursor_position_x: posX}
  # }
  # end

  # def move_right_event(model, x, y, posX, posY) do
  # %{
  #   model
  #   | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
  #     cursor_position: %{cursor_position_y: posY - 2, cursor_position_x: posX}
  # }
  # end
end
