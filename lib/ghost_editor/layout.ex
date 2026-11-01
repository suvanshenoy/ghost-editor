defmodule GhostEditor.Layout do
  alias GhostEditor.Model
  alias ExRatatui.Frame
  alias ExRatatui.Layout
  alias ExRatatui.Layout.Rect
  alias ExRatatui.Style
  alias ExRatatui.Widgets.{Paragraph, Block}

  def render(state, frame) do
    frame = %Frame{width: frame.width, height: frame.height}

    area = %Rect{x: 0, y: 0, width: frame.width, height: frame.height}

    [header_area, body_area, footer_area] =
      Layout.split(area, :vertical, [{:length, 3}, {:min, 0}, {:length, 3}])

    header = header_widget(state)

    body = body_widget(state)

    footer = footer_widget(state)

    [
      {header, header_area},
      {body, body_area},
      {footer, footer_area}
    ]
  end

  defp header_widget(state) do
    state = %Model{displays: state.displays}

    %Paragraph{
      text: "foo text #{state.displays.screen}",
      style: %Style{fg: :cyan, modifiers: [:bold]},
      block: %Block{
        title: "foo block",
        borders: [:all],
        border_type: :rounded,
        border_style: %Style{fg: :cyan}
      }
    }
  end

  defp body_widget(state) do
    state = %Model{displays: state.displays}

    %Paragraph{
      text: "#{state.displays.screen}",
      style: %Style{fg: :white, modifiers: [:bold]},
      block: %Block{
        borders: [:all],
        border_type: :rounded,
        border_style: %Style{fg: :cyan}
      }
    }
  end

  defp footer_widget(state) do
    state = %Model{displays: state.displays}

    %Paragraph{
      text: "#{state.displays.screen}",
      style: %Style{fg: :white, modifiers: [:bold]},
      block: %Block{
        borders: [:all],
        border_type: :rounded,
        border_style: %Style{fg: :cyan}
      }
    }
  end
end
