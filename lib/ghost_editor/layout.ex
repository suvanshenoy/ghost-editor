defmodule GhostEditor.Layout do
  alias GhostEditor.Model
  alias ExRatatui.Frame
  alias ExRatatui.Layout
  alias ExRatatui.Layout.Rect
  alias ExRatatui.Style
  alias ExRatatui.Widgets.{Paragraph, Block, Textarea}

  def render(state, frame) do
    frame = %Frame{width: frame.width, height: frame.height}

    area = %Rect{x: 0, y: 0, width: frame.width, height: frame.height}

    [menu_area, screen_area] =
      Layout.split(area, :horizontal, [{:length, 20}, {:min, 0}])

    menu = menu_widget(state)

    screen = screen_widget(state)

    [{menu, menu_area}, {screen, screen_area}]
  end

  defp menu_widget(_state) do
    %Paragraph{
      style: %Style{fg: :magenta, modifiers: [:bold]},
      block: %Block{
        borders: [:all],
        border_type: :rounded,
        border_style: %Style{fg: :magenta}
      }
    }
  end

  defp screen_widget(state) do
    state = %Model{displays: state.displays, textarea: state.textarea}

    %Textarea{
      state: state.textarea,
      style: %Style{fg: :magenta, modifiers: [:bold]},
      cursor_style: %Style{bg: :white, fg: :black},
      block: %Block{
        borders: [:all],
        border_type: :rounded,
        border_style: %Style{fg: :magenta}
      }
    }
  end
end
