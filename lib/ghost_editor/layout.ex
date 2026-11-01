defmodule GhostEditor.Layout do
  alias ExRatatui.Frame
  alias ExRatatui.Layout
  alias ExRatatui.Layout.Rect
  alias ExRatatui.Style
  alias ExRatatui.Widgets.{Block, Textarea}

  def render(state, frame) do
    frame = %Frame{width: frame.width, height: frame.height}

    area = %Rect{x: 0, y: 0, width: frame.width, height: frame.height}

    [menu_area, screen_area] =
      Layout.split(area, :horizontal, [{:length, 20}, {:min, 0}])

    menu = menu_widget(state)

    screen = screen_widget(state)

    [{menu, menu_area}, {screen, screen_area}]
  end

  def menu_widget(state) do
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

  def screen_widget(state) do
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
