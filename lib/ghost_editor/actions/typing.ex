defmodule GhostEditor.Actions.Typing do
  use GhostEditor.Constants.Keys

  def init(model) do
    model
  end

  def update(model, message) do
    %{text: text, text_cursor: %{text_cursor_x: x, text_cursor_y: y}, cursor_position: pos} =
      model

    case message do
      {:event, %{key: key}} when key in @delete_keys ->
        %{model | text: String.slice(text, 0, String.length(text) - 1)}

      {:event, %{key: key}} when key in [@spacebar, @enter] ->
        case key do
          @spacebar -> %{model | text: text <> " ", cursor_position: pos + 1}
          @enter -> %{model | text: text <> "\n"}
        end

      {:event, %{key: key}} when key in @scroll_keys ->
        case key do
          @scroll_up ->
            %{
              model
              | text_cursor: %{text_cursor_y: y - 2, text_cursor_x: x},
                cursor_position: y - 2
            }

          @scroll_down ->
            %{
              model
              | text_cursor: %{text_cursor_y: y + 2, text_cursor_x: x},
                cursor_position: y + 2
            }

          @scroll_left ->
            %{
              model
              | text_cursor: %{text_cursor_y: y, text_cursor_x: x - 2},
                cursor_position: x - 2
            }

          @scroll_right ->
            %{
              model
              | text_cursor: %{text_cursor_y: y, text_cursor_x: x + 2},
                cursor_position: x + 2
            }
        end

      {:event, %{ch: ch}} when ch > 0 ->
        %{model | text: text <> <<ch::utf8>>}

      _ ->
        model
    end
  end
end
