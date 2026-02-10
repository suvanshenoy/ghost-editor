defmodule GhostEditor.UI.FileMenu do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  def render(model) do
    %{
      window: window,
      displays: %{menu: %{size: size}}
    } =
      model

    height = window.height - 2

    {_, files} = File.ls()

    column(size: size) do
      panel(height: height, border: %{color: @default_border_color}, padding: 0) do
        for file <- files do
          panel(height: 3, padding: 0) do
            label(
              content: "#{file}",
              attributes: [:bold],
              color: @default_text_color,
              wrap: true
            )
          end
        end
      end
    end
  end
end
