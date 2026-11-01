defmodule GhostEditor.TUI do
  use ExRatatui.App

  alias ExRatatui.Event
  alias GhostEditor.Model
  alias GhostEditor.Layout

  @impl true
  def mount(_opts) do
    state = %Model{
      focus: :screen,
      textarea: ExRatatui.textarea_new()
    }

    {:ok,
     %{
       focus: state.focus,
       textarea: state.textarea
     }}
  end

  @impl true
  def render(state, frame) do
    Layout.render(state, frame)
  end

  @impl true
  def handle_event(%Event.Key{code: "q", kind: "press"}, state), do: {:stop, state}

  def handle_event(%Event.Key{code: code, modifiers: mods}, state) do
    case [code, mods] do
      ["w", ["ctrl"]] ->
        {:noreply, toggle_focus(state)}

      _ ->
        ExRatatui.textarea_handle_key(state.textarea, code, mods)
        {:noreply, state}
    end
  end

  defp toggle_focus(state = %Model{focus: :screen}), do: %{state | focus: :menu}
  defp toggle_focus(state = %Model{focus: :menu}), do: %{state | focus: :screen}
end
