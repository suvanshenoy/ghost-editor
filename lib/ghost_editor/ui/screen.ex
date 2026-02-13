defmodule GhostEditor.UI.Screen do
  import Ratatouille.View
  use GhostEditor.Constants.Colors
  alias GhostEditor.UI.CursorBar

  def render(model, menu) do
    %{
      window: window,
      text: text,
      displays: %{screen: %{size: size, focussed_file: focussed_file}}
    } =
      model

    height = window.height - 2

    focussed_file =
      cond do
        String.length(focussed_file) == 0 -> "Taskfile.yml"
      end

    data =
      case File.read(focussed_file) do
        {:ok, data} -> data
        {:error, reason} -> raise reason
      end

    view(bottom_bar: CursorBar.render(model)) do
      overlay(padding: 0) do
        row do
          menu

          column(size: size) do
            panel(height: height, border: %{color: @default_border_color}) do
              label(
                content: text <> "|" <> "#{data}",
                attributes: [:bold],
                color: @default_text_color
              )
            end
          end
        end
      end
    end
  end
end
