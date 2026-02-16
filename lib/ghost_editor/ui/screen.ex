defmodule GhostEditor.UI.Screen do
  import Ratatouille.View
  use GhostEditor.Constants.Colors
  alias GhostEditor.UI.CursorBar
  alias GhostEditor.AdjustSize

  @spec render(
          %{
            window: any(),
            text: String.t(),
            displays: %{
              screen: %{size: number()},
              menu: %{
                focussed_file: String.t()
              }
            }
          },
          any()
        ) :: any()

  def render(model, menu) do
    %{
      window: window,
      text: text
    } =
      model

    height = window.height - 2

    size = AdjustSize.adjust(:screen, %{model: model})

    focussed_file = ""

    focussed_file =
      cond do
        String.length(focussed_file) == 0 -> ".formatter.exs"
        true -> focussed_file
      end

    data =
      case File.read(focussed_file) do
        {:ok, data} -> data
        {:error, reason} -> raise reason
      end

    view(bottom_bar: CursorBar.render(%{model | displays: %{cursor_bar: %{size: 2}}})) do
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
