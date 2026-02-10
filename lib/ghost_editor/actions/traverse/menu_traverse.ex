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
        %{model | displays: %{menu: %{traverse: %{up: up}}}}

      {:event, %{ch: @move_up}} ->
        up = displays.menu.traverse.up + 1
        %{model | displays: %{menu: %{traverse: %{up: up}}}}

      _ ->
        model
    end
  end
end
