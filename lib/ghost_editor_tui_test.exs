defmodule GhostEditor.TuiTest do
  use ExUnit.Case, async: true

  alias ExRatatui.Event
  alias GhostEditor.TUI
  alias GhostEditor.Model

  describe "&handle_event/2" do
    test "toggles focus from screen to menu when ctrl-w is pressed" do
      assert TUI.handle_event(%Event.Key{code: "w", modifiers: ["ctrl"]}, %Model{}) ==
               {:noreply, %Model{focus: :menu}}
    end
  end
end
