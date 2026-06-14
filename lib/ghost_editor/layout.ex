defmodule GhostEditor.Layout do
  use GhostEditor.Constants.Colors
  alias GhostEditor.Actions.Resize
  alias GhostEditor.Actions.Switch
  alias GhostEditor.Actions.Traverse.MenuTraverse
  alias GhostEditor.UI.FileMenu
  alias GhostEditor.UI.Screen
  alias GhostEditor.Actions.Display
  alias GhostEditor.Actions.Typing
  # alias GhostEditor.UI.Screen.TerminalScreen

  def update(model, message) do
    case message do
      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 23, ch: 0, w: 0, h: 0, x: 0, y: 0}} ->
        Switch.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 0, ch: 106, w: 0, h: 0, x: 0, y: 0}} ->
        MenuTraverse.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 0, ch: 107, w: 0, h: 0, x: 0, y: 0}} ->
        MenuTraverse.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 5, ch: 0, w: 0, h: 0, x: 0, y: 0}} ->
        Switch.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 4, ch: 0, w: 0, h: 0, x: 0, y: 0}} ->
        Display.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 13, ch: 0, w: 0, h: 0, x: 0, y: 0}} ->
        Display.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 65514, ch: 0, w: 0, h: 0, x: 0, y: 0}} ->
        Resize.update(model, message)

      {:event, %ExTermbox.Event{type: 1, mod: 0, key: 65515, ch: 0, w: 0, h: 0, x: 0, y: 0}} ->
        Resize.update(model, message)

        # _ ->
        #   Typing.update(model, message)
    end
  end

  def render(model) do
    {_, files} = File.ls()

    case model do
      %{mode: "traverse", key: "k", displays: %{menu: %{focus: 1, traverse: %{up: up}}}} ->
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

      %{mode: "traverse", key: "j", displays: %{menu: %{focus: 1, traverse: %{up: up}}}} ->
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

      %{mode: "display", key: "ctrl_d", displays: %{screen: %{show: 1}, menu: %{show: 0}}} ->
        Screen.render(
          %{
            model
            | displays: %{
                screen: %{size: 12.85}
              }
          },
          nil
        )

      %{mode: "resize", displays: %{screen: %{size: size}, menu: %{size: size}}} ->
        Screen.render(
          %{
            model
            | displays: %{
                screen: %{size: 10 + size}
              }
          },
          FileMenu.render(%{
            model
            | displays: %{
                menu: %{size: 2 + size, files: files}
              }
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
