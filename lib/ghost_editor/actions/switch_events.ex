defmodule GhostEditor.Actions.Switch.SwitchEvents do
  use GhostEditor.Constants.Keys

  def switch_to_screen_event(model) do
    %{model | displays: %{screen: %{focus: 1}}}
  end

  def switch_to_menu_event(model) do
    %{model | displays: %{menu: %{focus: 1, traverse: %{up: 1}}}}
  end
end
