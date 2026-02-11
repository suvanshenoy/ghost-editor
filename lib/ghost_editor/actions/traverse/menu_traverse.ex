defmodule GhostEditor.Actions.Traverse.MenuTraverse do
  use GhostEditor.Constants.Keys

  def init(model) do
    model
  end

  def update(model, message) do
    %{displays: displays} = model

    case message do
      {:event, %{ch: @move_down}} ->
        up = displays.menu.traverse.up - 1

        %{
          model
          | displays: %{
              menu: %{focus: displays.menu.focus, traverse: %{up: up}},
              screen: displays.screen
            }
        }

      {:event, %{ch: @move_up}} ->
        up = displays.menu.traverse.up + 1

        %{
          model
          | displays: %{
              menu: %{focus: displays.menu.focus, traverse: %{up: up}},
              screen: displays.screen
            }
        }

      _ ->
        model
    end
  end
end
