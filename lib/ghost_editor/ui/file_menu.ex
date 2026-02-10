defmodule GhostEditor.UI.FileMenu do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  def render(model) do
    %{
      window: window,
      displays: displays
    } =
      model

    height = window.height - 2

    case displays.menu do
      %{traverse: %{up: up}} ->
        {focussed_file, other_files} = List.pop_at(displays.menu.files, up)

        column(size: displays.menu.size) do
          panel(height: height, border: %{color: @default_border_color}, padding: 0) do
            panel(height: 3, padding: 0) do
              label(
                content: "#{focussed_file}",
                attributes: [:bold],
                color: @default_text_color
              )
            end

            for file <- other_files do
              label(
                content: "#{file}",
                attributes: [:bold],
                color: @default_text_color,
                wrap: true
              )
            end
          end
        end

      %{show: 0} ->
        nil

      _ ->
        column(size: displays.menu.size) do
          panel(height: height, border: %{color: @default_border_color}, padding: 0) do
            for file <- displays.menu.files do
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
end
