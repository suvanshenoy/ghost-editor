defmodule GhostEditor.TUI do
  use ExRatatui.App

  alias ExRatatui.Event
  alias GhostEditor.Model
  alias GhostEditor.Layout

  @impl true
  def mount(_opts) do
    state = %Model{
      displays: %{
        screen: nil
      },
      textarea: ExRatatui.textarea_new()
    }

    {:ok, %{displays: %{screen: state.displays.screen}, textarea: state.textarea}}
  end

  @impl true
  def render(state, frame) do
    Layout.render(state, frame)
  end

  @impl true
  def handle_event(%Event.Key{code: "q", kind: "press"}, state), do: {:stop, state}

  def handle_event(%Event.Key{code: code, modifiers: modifiers}, state) do
    state = %Model{textarea: state.textarea}
    ExRatatui.textarea_handle_key(state.textarea, code, modifiers)
  end

  def handle_event(_event, state), do: {:noreply, state}
end
