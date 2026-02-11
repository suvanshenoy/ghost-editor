defmodule GhostEditor do
  @behaviour Ratatouille.App

  alias GhostEditor.Actions.Display
  alias GhostEditor.Actions.Switch
  alias GhostEditor.Actions.Traverse.MenuTraverse
  alias GhostEditor.Actions.Typing
  alias GhostEditor.KeyNotifer
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
        menu: %{size: 0, show: 0, traverse: %{up: 0}, files: [], focus: 0}
      },
      key: ""
    }

    model
  end

  @impl true
  def update(model, message) do
    case model do
      %{displays: %{menu: %{focus: 0}}} ->
        Display.update(model, message)
        MenuTraverse.update(model, message)
        Switch.update(model, message)

      %{displays: %{menu: %{focus: 1}}} ->
        Display.update(model, message)
        Switch.update(model, message)

      %{displays: %{screen: %{focus: 0}}} ->
        Display.update(model, message)
        Typing.update(model, message)

      %{displays: %{screen: %{focus: 1}}} ->
        Display.update(model, message)
        Typing.update(model, message)
    end

    # Typing.update(model, message)
    # IO.inspect(model)
  end

  @impl true
  def render(model) do
    Layout.render(model)
  end
end

Ratatouille.run(GhostEditor,
  quit_events: [
    {:key, Ratatouille.Constants.key(:ctrl_z)}
  ]
)
