defmodule GhostEditor do
  @behaviour Ratatouille.App

  alias GhostEditor.Actions.Display
  alias GhostEditor.Actions.Switch
  alias GhostEditor.Actions.Traverse.MenuTraverse
  alias GhostEditor.Actions.Typing
  # alias GhostEditor.KeyNotifer
  alias GhostEditor.Layout

  @impl true
  def init(%{window: window}) do
    model = %{
      window: window,
      text: "",
      text_cursor: %{text_cursor_x: 0, text_cursor_y: 0},
      cursor_position: %{cursor_position_x: 0, cursor_position_y: 0},
      displays: %{
        screen: %{size: 0, show: 0, focus: 0},
        menu: %{size: 0, show: 0, traverse: %{up: 0}, files: [], focus: 0, focussed_file: ""}
      },
      key: ""
    }

    model
  end

  @impl true
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

  @impl true
  def render(model) do
    Layout.render(model)
  end
end
