defmodule GhostEditor.Layout do
  use GhostEditor.Constants.Colors

  alias GhostEditor.UI.FileMenu
  alias GhostEditor.UI.Screen

  def render(model) do
    %{
      window: window,
      displays: displays
    } =
      model

    {_, files} = File.ls()

    case displays do
      %{menu: %{traverse: %{up: up}}} ->
        Screen.render(
          %{
            model
            | displays: %{screen: %{size: 10}}
          },
          FileMenu.render(%{
            model
            | displays: %{menu: %{size: 2, files: files, traverse: %{up: up}}}
          })
        )

      %{screen: %{show: 1}, menu: %{show: 0}} ->
        {screen_size, _} = Integer.parse("#{window.height / 2 - 14}")

        Screen.render(
          %{
            model
            | displays: %{screen: %{size: screen_size}}
          },
          FileMenu.render(%{
            model
            | displays: %{menu: %{show: 0}}
          })
        )

      %{screen: %{show: 0}, menu: %{size: 2, show: 1}} ->
        Screen.render(
          %{
            model
            | displays: %{screen: %{size: 10}}
          },
          FileMenu.render(%{
            model
            | displays: %{menu: %{size: 2, show: 1}}
          })
        )

      _ ->
        Screen.render(
          %{
            model
            | displays: %{screen: %{size: 10}}
          },
          FileMenu.render(%{
            model
            | displays: %{menu: %{size: 2, files: files}}
          })
        )
    end
  end
end
