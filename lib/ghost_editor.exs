defmodule GhostEditor do
  @behaviour Ratatouille.App

  alias GhostEditor.UI.Screen

  alias GhostEditor.Actions.Typing

  @impl true
  def init(%{window: window}) do
    model = %{
      window: window,
      text: ""
    }

    Typing.init(model)
  end

  @impl true
  def update(model, message) do
    Typing.update(model, message)
  end

  @impl true
  def render(model) do
    Screen.render(model)
  end
end

Ratatouille.run(GhostEditor,
  quit_events: [
    {:key, Ratatouille.Constants.key(:ctrl_d)},
    {:key, Ratatouille.Constants.key(:ctrl_z)}
  ]
)
