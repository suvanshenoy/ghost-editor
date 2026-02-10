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
      # %{traverse: %{up: 1}} ->
      #   first_file = List.first(displays.menu.files)

      #   column(size: displays.menu.size) do
      #     panel(height: height, border: %{color: @default_border_color}, padding: 0) do
      #       panel(height: 3, padding: 0) do
      #         label(
      #           content: "#{first_file}",
      #           attributes: [:bold],
      #           color: @default_text_color
      #         )
      #       end
      #     end
      #   end

      # %{traverse: %{down: 1}} ->
      #   last_file = List.last(displays.menu.files)

      #   column(size: displays.menu.size) do
      #     panel(height: height, border: %{color: @default_border_color}, padding: 0) do
      #       panel(height: 3, padding: 0) do
      #         label(
      #           content: "#{last_file}",
      #           attributes: [:bold],
      #           color: @default_text_color
      #         )
      #       end
      #     end
      #   end

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
