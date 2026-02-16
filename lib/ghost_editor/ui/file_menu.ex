defmodule GhostEditor.UI.FileMenu do
  import Ratatouille.View
  use GhostEditor.Constants.Colors
  alias GhostEditor.AdjustSize

  @spec render(%{
          window: any(),
          displays: %{
            menu: %{
              size: number(),
              show: number(),
              traverse: %{up: number()},
              files: [String.t()],
              focussed_file: String.t()
            }
          }
        }) :: any()

  def render(model) do
    %{
      window: window,
      displays: displays
    } =
      model

    height = window.height - 2

    size = AdjustSize.adjust(:menu, %{model: model})

    case displays.menu do
      %{traverse: %{up: up}} ->
        cond do
          up == 0 ->
            {focussed_file, other_files} = List.pop_at(displays.menu.files, up)

            column(size: size) do
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
                    color: @default_text_color
                  )
                end
              end
            end

          true ->
            {focussed_file, _} = List.pop_at(displays.menu.files, up)

            menu_list = []

            menu_list =
              for file <- displays.menu.files do
                menu_list ++
                  [label(content: file, attributes: [:bold], color: @default_text_color)]
              end

            menu_list = List.delete_at(menu_list, up)

            menu_list =
              List.insert_at(
                menu_list,
                up,
                panel(height: 3, padding: 0) do
                  label(
                    content: "#{focussed_file}",
                    attributes: [:bold],
                    color: @default_text_color
                  )
                end
              )

            column(size: size) do
              panel(height: height, border: %{color: @default_border_color}, padding: 0) do
                for menu_item <- menu_list do
                  menu_item
                end
              end
            end
        end

      %{show: 0} ->
        nil

      _ ->
        column(size: size) do
          panel(height: height, border: %{color: @default_border_color}, padding: 0) do
            for file <- displays.menu.files do
              label(
                content: "#{file}",
                attributes: [:bold],
                color: @default_text_color
              )
            end
          end
        end
    end
  end
end
