defmodule GhostEditor.Layout do
  use GhostEditor.Constants.Colors

  alias GhostEditor.Actions.Display
  alias GhostEditor.Actions.Switch
  alias GhostEditor.Actions.Traverse.MenuTraverse
  alias GhostEditor.Actions.Typing

  alias GhostEditor.UI.FileMenu
  alias GhostEditor.UI.Screen

  def update(model, message) do
    case model do
      %{displays: %{menu: %{focus: 0}}} ->
        MenuTraverse.update(model, message)
        Switch.update(model, message)

      %{displays: %{menu: %{focus: 1}}} ->
        MenuTraverse.update(model, message)

      %{displays: %{screen: %{focus: 0}}} ->
        Typing.update(model, message)

      %{displays: %{screen: %{focus: 1}}} ->
        Typing.update(model, message)

      %{displays: %{screen: %{show: 1}, menu: %{show: 0}}} ->
        Display.update(model, message)

      %{displays: %{screen: %{show: 0}, menu: %{show: 1}}} ->
        Display.update(model, message)
    end
  end

  def render(model) do
    {_, files} = File.ls()

    %{displays: displays} = model

    case displays do
      %{menu: %{traverse: %{up: up}}} ->
        Screen.render(
          %{
            model
            | displays: %{
                screen: %{size: 10}
              }
          },
          FileMenu.render(%{
            model
            | displays: %{
                menu: %{
                  size: 2,
                  files: files,
                  traverse: %{up: up}
                }
              }
          })
        )

      %{screen: %{show: 1}, menu: %{show: 0}} ->
        %{window: window} = model

        {screen_size, _} = Integer.parse("#{window.height / 2 - 14}")

        Screen.render(
          %{
            model
            | displays: %{
                screen: %{size: screen_size}
              }
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
            | displays: %{
                screen: %{size: 10}
              }
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
            | displays: %{
                screen: %{size: 10}
              }
          },
          FileMenu.render(%{
            model
            | displays: %{menu: %{size: 2, files: files}, screen: %{size: 10}}
          })
        )
    end
  end
end
