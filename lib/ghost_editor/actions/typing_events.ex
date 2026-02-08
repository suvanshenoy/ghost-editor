defmodule GhostEditor.Actions.Typing.TypingEvents do
  def delete_event(model, text, posX, posY) do
    if(posX < 1 && String.length(text) - 1 == -1) do
      %{
        model
        | text: text <> "",
          cursor_position: %{cursor_position_y: posY, cursor_position_x: posX}
      }
    else
      %{
        model
        | text: String.slice(text, 0, String.length(text) - 1),
          cursor_position: %{cursor_position_y: posY, cursor_position_x: posX - 1}
      }
    end
  end

  def spacebar_event(model, text, posX, posY) do
    if(posX > 89) do
      %{model | text: text <> ""}
    else
      %{
        model
        | text: text <> " ",
          cursor_position: %{cursor_position_y: posY, cursor_position_x: posX + 1}
      }
    end
  end

  def enter_event(model, text, posX, posY) do
    if(posY > 45) do
      %{model | text: text <> ""}
    else
      %{
        model
        | text: text <> "\n",
          cursor_position: %{cursor_position_y: posY + 1, cursor_position_x: posX}
      }
    end
  end

  def text_event(model, text, ch, posX, posY) do
    %{
      model
      | text: text <> <<ch::utf8>>,
        cursor_position: %{cursor_position_y: posY, cursor_position_x: posX + 1}
    }
  end

  def scroll_up_event(model, x, y, posX, posY) do
    %{
      model
      | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
        cursor_position: %{cursor_position_y: posY - 2, cursor_position_x: posX}
    }
  end

  def scroll_down_event(model, x, y, posX, posY) do
    %{
      model
      | text_cursor: %{text_cursor_y: y + 2, text_cursor_x: x},
        cursor_position: %{cursor_position_y: posY + 2, cursor_position_x: posX}
    }
  end

  def scroll_left_event(model, x, y, posX, posY) do
    %{
      model
      | text_cursor: %{text_cursor_y: y, text_cursor_x: x - 2},
        cursor_position: %{cursor_position_y: posY, cursor_position_x: posX - 2}
    }
  end

  def scroll_right_event(model, x, y, posX, posY) do
    %{
      model
      | text_cursor: %{text_cursor_y: y, text_cursor_x: x + 2},
        cursor_position: %{cursor_position_y: posY, cursor_position_x: posX + 2}
    }
  end
end
