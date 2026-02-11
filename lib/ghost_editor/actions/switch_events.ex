defmodule GhostEditor.Actions.Switch.SwitchEvents do
  use GhostEditor.Constants.Keys

  def event(:focus_screen, model) do
    %{model | displays: %{screen: %{focus: 1}}}
  end

  def event(:focus_menu, model) do
    %{model | displays: %{menu: %{focus: 1, traverse: %{up: 1}}}}
  end
end
