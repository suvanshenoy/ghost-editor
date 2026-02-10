defmodule GhostEditor.Layout do
  use GhostEditor.Constants.Colors

  alias GhostEditor.UI.FileMenu
  alias GhostEditor.UI.Screen

  def render(model) do
    %{
      displays: displays
    } =
      model

    case displays do
      _ ->
        Screen.render(
          %{
            model
            | displays: %{screen: %{size: 10}}
          },
          FileMenu.render(%{model | displays: %{menu: %{size: 2}}})
        )
    end
  end
end
