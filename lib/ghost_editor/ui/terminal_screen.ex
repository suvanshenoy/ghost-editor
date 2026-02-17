defmodule GhostEditor.UI.Screen.TerminalScreen do
  import Ratatouille.View
  use GhostEditor.Constants.Colors

  def render(model) do
    view do
      row do
        column(size: 2) do
          panel do
            label(content: "hello")
          end
        end
      end
    end
  end
end
