defmodule GhostEditor do
  @behaviour Ratatouille.App
  alias GhostEditor.Layout
  alias GhostEditor.Model

  @impl true
  def init(%{window: window}) do
    model = %Model{
      window: window,
      text: "",
      text_cursor: %{text_cursor_x: 0, text_cursor_y: 0},
      cursor_position: %{cursor_position_x: 0, cursor_position_y: 0},
      displays: %{
        screen: %{size: 0, show: 0, focus: 0},
        menu: %{size: 0, show: 0, traverse: %{up: 0}, files: [], focus: 0, focussed_file: ""},
        cursor_bar: %{size: 0}
      },
      mode: "",
      key: ""
    }

    model
  end

  @impl true
  def update(model = %Model{}, message) do
    Layout.update(model, message)
  end

  @impl true
  def render(model = %Model{}) do
    Layout.render(model)
  end
end
