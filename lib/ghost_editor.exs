defmodule GhostEditor do
  @behaviour Ratatouille.App

  alias GhostEditor.UI.Screen

  @impl true
  def init(%{window: window}) do
    model = %{
      window: window
    }

    model
  end

  @impl true
  def update(model, mesg) do
    Screen.update(model, mesg)
  end

  @impl true
  def render(model) do
    Screen.render(model)
  end
end

Ratatouille.run(GhostEditor)
