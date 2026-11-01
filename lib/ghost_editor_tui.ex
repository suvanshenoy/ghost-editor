defmodule GhostEditor.TUI do
  use ExRatatui.App

  alias ExRatatui.Event
  alias ExRatatui.Frame
  alias GhostEditor.Model
  alias GhostEditor.Layout

  @impl true
  def mount(_opts) do
    state = %Model{
      displays: %{
        screen: nil
      }
    }

    {:ok, %{displays: %{screen: state.displays.screen}}}
  end

  @impl true
  def render(state, frame) do
    Layout.render(state, frame)
  end

  @impl true
  def handle_event(%Event.Key{code: "q", kind: "press"}, state), do: {:stop, state}

  def handle_event(_event, state), do: {:noreply, state}
end
