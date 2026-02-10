defmodule GhostEditor do
  @behaviour Ratatouille.App

  alias GhostEditor.Layout
  alias GhostEditor.Actions.Typing
  alias GhostEditor.Actions.Traverse.MenuTraverse
  alias GhostEditor.Actions.Display

  @impl true
  def init(%{window: window}) do
    model = %{
      window: window,
      text: "",
      text_cursor: %{text_cursor_x: 0, text_cursor_y: 0},
      cursor_position: %{cursor_position_x: 0, cursor_position_y: 0},
      displays: %{
        screen: %{size: 0, show: 0},
        menu: %{id: 0, size: 0, show: 0, traverse: %{up: 0, down: 0}}
      }
    }

    Display.init(model)
    MenuTraverse.init(model)
    Typing.init(model)
  end

  @impl true
  def update(model, message) do
    Display.update(model, message)
    MenuTraverse.update(model, message)
    Typing.update(model, message)
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
