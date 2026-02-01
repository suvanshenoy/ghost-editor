defmodule GhostEditor.UI.Screen do
  import Ratatouille.View

  use GhostEditor.Constants.Keys

  def render(model) do
    %{text: text} = model

    view do
      panel(height: :fill) do
        # render_tilde()
        label(content: text <> "| ")
      end
    end
  end

  # defp render_tilde do
  #   canvas_cell = canvas_cell(x: 0, y: 0, char: "~")

  #   for _ <- 1..20 do
  #     canvas(height: 1, width: 1) do
  #       [canvas_cell]
  #     end
  #   end
  # end
end
